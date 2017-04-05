-- ������ �� full join
-- �� ����� ������ �/��� ��������� �� �� ������ 
-- ����� ��, ��������� �� ���� � networth

-- �������� �����:
select ms.name, me.name, ms.birthdate, me.networth
from moviestar ms
full join movieexec me on ms.name = me.name;
-- ����� �����:
select coalesce(ms.name, me.name) as name, ms.birthdate, me.networth
from moviestar ms
full join movieexec me on ms.name = me.name;

-- task 1
use movies;

-- 1.1 �� ����� ����, ��-����� �� 120 ������, �������
-- ��������, ������, ��� � ����� �� ������
select title, year, name, address
from movie
join studio on studioname = name
where length > 120;

-- 1.2 ������� ����� �� �������� � ������� �� ���������,
-- ��������� ��� �����, ����������� �� ���� ������, ��������� �� ��� �� ������
select distinct studioname, starname
from movie
join starsin on title = movietitle and year = movieyear
order by studioname ASC;

select distinct name, starname
from studio
join movie on name = studioname
join starsin on title = movietitle
order by name ASC;

-- 1.3


-- 1.4


-- 1.5


-- 1.6 ������� ������� �� ��������� �� ��������� � ���� ���� ����
select name
from moviestar
where name not in (select distinct starname from starsin);
-- OR:
select name
from moviestar
left join starsin on name = starname
where starname is null;
