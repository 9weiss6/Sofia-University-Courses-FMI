-- task 2
use ships;

-- 2.1 ������� ���� �� ��������� ������
select count(*)
from classes;

-- 2.2 ������� ������� ���� �� ������ �� ������ ������, ������� �� ����
select avg(numguns)
from classes c
join ships s on c.class = s.class;

-- 2.3 ������� �� ����� ���� ������� � ���������� ������, �
-- ����� ����� �� ���������� ���� � ������ �� ����
select c.class, min(launched), max(launched)
from classes c
join ships s on c.class = s.class
group by c.class;

select class, min(launched) as FirstYear, 
			max(launched) as LastYear
from ships
group by class;

-- 2.4 ������� ���� �� �������� �������� � ����� ������ �����
select class, count(*)
from outcomes o
join ships on ship = name
where result = 'sunk'
group by class;

-- 2.5 ������� ���� �� �������� �������� � ����� ������
-- �����, �� ���� ������� � ������ �� 4 ������� �� ���� ������
select class, count(name)
from outcomes o
join ships s on o.ship = s.name
where o.result = 'sunk' and class in (select class
										from ships
										group by class
										having count(*) > 4)
group by class;

select class, count(*)
from ships
group by class
having count(*) > 4;

-- 2.6 ������� �������� ����� �� ��������, �� ����� ������


