use movies;

-- ������ �����, ����� �� ��-����� �� Star Wars
select title
from movie
where length > (select length 
				from movie 
				where title = 'Star Wars');

-- �������� IN:
-- ������ �����, ����� �� ������� ���� 1980, 1985 � 1990 �.:
select *
from movie
where year in (1980, 1985, 1990);

-- ��������� �� ������ ������� ���� ��� �����:
select *
from starsin
where starname in (select name from moviestar where gender = 'M');
-- ������������ ��
select starsin.*
from starsin
join moviestar on starsin.starname = moviestar.name
where moviestar.gender = 'M';


-- task 1

-- 1.1 ������� ������� �� ���������, ����� �� ���� �
-- ���������� � ����� �������� ��-������ �� 10 �������
select name
from moviestar
where gender='F' and name in (select name from movieexec where networth > 10000000);

-- 1.2 ������� ������� �� ���� ������� (���� � ����), ����� �� �� ����������
select name
from moviestar
where name not in (select name from movieexec);

-- 1.3 ������� ������� �� ������ ����� � ������� ��-������
-- �� ��������� �� ����� �Gone With the Wind�
select title
from movie
where length > (select length from movie where title = 'Gone With the Wind');

-- 1.4 ������� ������� �� ������������ � ������� ��
-- ����������� �� ����� ���������� �� � ��-������ �� ����������� �� ���������� �Mery Griffin�
select me.name, m.title
from movie m
join movieexec me on m.producerc# = me.cert#
where me.networth > (select networth from movieexec where name = 'Merv Griffin');


-- �� �� ������� ������� �� ������ �������, ����� �� ������ ��� ���� ���� 
-- ���������� �� 40-������� �������. ������ �������� �� ��� ������ - � JOIN 
-- � � ���������.
select name
from moviestar
where name in (select starname from starsin 
				where moviestar.name = starname
					and movieyear >= year(moviestar.birthdate) + 40);

select name from moviestar
where exists (select 1 
		from starsin 
		where moviestar.name=starname and movieyear >= year(moviestar.birthdate) + 40);

select m.name
from moviestar m
join starsin s on m.name = s.starname
where movieyear >= year(m.birthdate) + 40;
