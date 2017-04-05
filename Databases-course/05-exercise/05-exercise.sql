-- intro
use movies;

select avg(networth)
from movieexec;

select count(*)
from starsin;

select count(distinct starname)
from starsin;

select count(*), count(distinct starname)
from starsin;

select studioname, sum(length)
from movie
group by studioname;

-- ��� ������ GROUP BY, ������ ����:
select distinct studioname, (select sum(length)
								from movie
								where studioname = m.studioname)
from movie m;

-- ���-������� ���� (��� �� ������ �� ����, �� �� ������� ������):
select *
from movie
where length = (select max(length) from movie);

-- ��������� �� �����:
-- �� ����� ������ �� �� ������ ����� ������� ������ �� ������
select year(birthdate), count(*)
from moviestar
group by year(birthdate)

-- �� ����� ������� ������ - ����� �� �������, � ����� �� � �������
-- ��� �� ������ ������ �� ����� ����� ����� ���, �� ��� �� �� ������ 0
select name, count(starname) as moviesCount
from moviestar
left join starsin on name = starname
group by name

-- �� �� ������ �������� ���� �����, �
-- ����� �� �� ������� ���������
select avg(moviesCount)
from (select count(movietitle) as moviesCount
		from moviestar
		left join starsin on name = starname
		group by name) stat;

select max(length) from movie;
select length from movie;