-- common tasks

use movies;
-- 1. ��� ���������� ���������� � �������� �� ������ �����, ������� ����� 1982, � ����� � �����
-- ���� ���� ������ (�������), ����� ��� �� ������� ���� ������� 'k', ���� 'b'. 
-- ����� �� �� ������� ���-������� �����
select distinct movietitle, movieyear
from starsin
where movieyear < 1982 
	and starname not like '%k%' 
	and starname not like '%b%'
group by movietitle, movieyear
having count(starname) >= 1
order by movieyear ASC;

-- 2. ���������� � ��������� � ������ (length � � ������) �� ������ �����, ����� �� �� ������
-- ������, �� ����� � � ������ Terms of Endearment, �� ��������� �� � ��-����� ��� ����������
select title, length / 60 as hours
from movie
where year = (select distinct year from movie where title = 'Terms of Endearment')
	and length < (select distinct length from movie where title = 'Terms of Endearment');

-- 3. ������� �� ������ ����������, ����� �� � ������� ������ � �� ������ 
-- � ���� ���� ���� ����� 1980 �. � ���� ���� ���� 1985 �
select name
from movieexec
join movie on cert# = producerc#
join starsin on title = movietitle and year = movieyear
where name in (select starname from starsin)
	and name in (select distinct starname 
					from starsin
					where movieyear < 1980)
	and name in (select distinct starname 
					from starsin
					where movieyear > 1985);

select name
from movieexec
join movie on cert# = producerc#
join starsin on title = movietitle and year = movieyear
where name in (select distinct s1.starname
				from starsin s1
				join starsin s2 on s1.movieyear < 1980
					and s2.movieyear > 1985
				where s1.starname = s2.starname);

-- 4.  ������ �����-���� �����, �������� ����� ���-������ ������ ���� 
-- (InColor='y'/'n') �� ������ ������
select title
from movie
where incolor = 'N' 
		and year < (select min(year)
					from movie
					where incolor = 'Y')
		and studioname = (select studioname
							from movie
							where year = (select min(year)
											from movie
											where incolor = 'Y'));

select m1.title
from movie m1
join movie m2 on m1.studioname = m2.studioname
where m1.incolor = 'N' and m2.incolor = 'Y'
group by m1.title, m1.year
having m1.year < (select min(year)
					from movie
					where incolor = 'Y');

-- 5. ������� � �������� �� ��������, ����� �� �������� � ��-����� �� 5 �������� ������� ������. 
-- ������, �� ����� ���� �������� ����� ��� ���, �� �� �� ���� ��� ������� �� ������ � ���,  ���� �� ����� ��������. 
-- ����� �� �� ������� ��������, �������� � ���-����� ������.
select name, address, count(starname)
from studio
left join movie on name = studioname
left join starsin on year = movieyear and title = movietitle
group by name, address
having count(starname) < 5
order by count(starname) DESC;

use ships;
-- 6. �� ����� �����, ����� � �� ���� � ���, ����������� ������� i � k, �� �� ������ �����
-- �� ������ � ���� ��� ������ � ������ �� ���� (launched). ���������� �� ���� ��������
-- ����, �� ����� �� �� �������� ���-����� ��������� ������.
select name, launched
from ships
where name not like '%i%' and name not like '%k%'
order by launched DESC;

-- 7. �� �� ������� ������� �� ������ �����, � ����� � �������� (damaged) 
-- ���� ���� ������� �����
select battle, country, result
from outcomes
join ships s on ship = name
join classes c on s.class = c.class
where country = 'Japan' and result = 'damaged';

-- 8. �� �� ������� ������� � ��������� �� ������ ������, ������� �� ���� 
-- ���� ������ ���� ������ 'Rodney' � ����� �� �������� �� � ��-����� �� 
-- ������� ���� ������ �� ���������, ������������ �� ������� ������
select name, s.class
from ships s
join classes c on s.class = c.class 
where launched > 1 + (select distinct launched 
						from ships where name = 'Rodney')
	and numguns > (select avg(numguns) from classes);

-- 9. �� �� ������� ������������� �������, �� ����� ������ ����� ������ �� ������� �� ����
-- � ������� �� ���� 10 ������ (�������� ������ �� ���� North Carolina �� ������� �
-- ������� �� 1911 �� 1941, ����� � ������ �� 10 ������, ������ ������ �� ���� Tennessee
-- �� ������� ���� ���� 1920 � 1921 �.)
select c.class
from classes c
join ships s on c.class = s.class
where country = 'USA';

select class, period
from (select s1.class, max(s2.launched) - min(s1.launched) as period
		from ships s1
		join ships s2 on s1.class = s2.class and s1.launched < s2.launched
		join classes c on s1.class = c.class
		where country = 'USA'
		group by s1.class) new
where period > 10;

select s1.class, max(s2.launched) - min(s1.launched) as period
from ships s1
join ships s2 on s1.class = s2.class and s1.launched < s2.launched
join classes c on s1.class = c.class
where country = 'USA'
group by s1.class

-- 10.  �� ����� ����� �� �� ������ �������� ���� ������ �� ���� � ���� ������� (�������� �
-- ������� ��� Guadalcanal �� ��������� 3 ����������� � ���� ������� �����, �.�.
-- �������� ���� � 2)
select battle, count(distinct country) as numCountries
from outcomes
join ships s on ship = s.name
join classes c on s.class = c.class
group by battle;

select battle, country, count(ship) as numShips
from outcomes
join ships s on ship = s.name
join classes c on s.class = c.class
group by battle, country;

select battle, cast(sum(numShips) as float) / cast(count(country) as float)
from (select battle, country, count(ship) as numShips
		from outcomes
		join ships s on ship = s.name
		join classes c on s.class = c.class
		group by battle, country) new
group by battle;

-- 19.(*) �� ����� ����� �������� ���� �� �������, � ����� � ��� �������. ��� ������� �� �
-- �������� � ����� ��� ��� ������ �� � ��� ��������, � ��������� �� �� ������ 0
select name, count(battle) as numBattles
from ships
left join outcomes on name = ship
where result = 'damaged'
group by name;

select name, count(o1.battle) numBattles, count(o2.battle) damagedNumBattles
from ships
left join outcomes o1 on name = o1.ship
left join outcomes o2 on o1.ship = o2.ship 
	and o1.battle = o2.battle and o2.result = 'damaged'
group by name;

-- 20.(*) �������� �� ����� ���� � ���� 3 ������ ���� �� �������� �� ���� ����, 
-- ����� �� �������� � �����
select distinct class, name
from outcomes
join ships on ship = name
where result = 'ok' 
	and class in (select class
					from ships
					group by class
					having count(name) >= 3);

select s.name, t.class
from (select class
					from ships
					group by class
					having count(name) >= 3) t
join ships s on s.class = t.class
join outcomes o on s.name = o.ship and o.result = 'ok';

-- 18. ������� �� ���������, �� ����� ���� �����, ������ �� ���� ���� 1921 �., 
-- �� ���� ������ ���� ���� �����






select * from ships;
select * from outcomes;
select * from classes;

