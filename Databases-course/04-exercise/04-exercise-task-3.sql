-- task 3
use ships;

-- 3.1


-- 3.2


-- 3.3


-- 3.4



-- �� ����� ���� ��������� ������ �� �� ������� 
-- ������� �� (�� ���������) � ������� �� ������ �����,
-- � ����� �� ��������� ������ �� ���� ����.
-- ��� ����� ���� ���� ������ ��� ���, �� �� �� �� 
-- ��������� � �����, ���� �� �� ������� (��� ��������
-- NULL �� ��� �� �������).

-- ����� � �����
select c.class, battle
from classes c
join ships s on c.class = s.class
join outcomes o on o.ship = s.name
where c.country = 'Gt.Britain';

-- �����
select c.class, battle
from classes c
left join (select * from ships
			join outcomes on name = ship) t
		on c.class = t.class
where c.country = 'Gt.Britain';

-- �����
select c.class, battle
from outcomes o
join ships s on o.ship = s.name
right join classes c on s.class = c.class 
where c.country = 'Gt.Britain';


-- �� ����� ���� �� �� ������� ����� ��, ��������� 
-- � ������� �� ������ ������ ������, ������� ���� 1916 �.



-- �� �������� ������� ������, ���� ������� � ���������,
-- ����� ����� ���� ���� ����� �� 1916 - �/� ��� �� 
-- ���� NULL.