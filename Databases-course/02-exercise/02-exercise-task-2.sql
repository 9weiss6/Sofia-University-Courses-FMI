-- task 2
use pc;

-- 2.1 ������� ������������� � ��������� �� ��������� �� ����
-- ������� � ������ �� ����� ���� 9 GB
select p.maker, l.speed
from product as p
join laptop as l on p.model=l.model
where l.hd >= 9;

-- 2.2 ������� ����� �� ����� � ���� �� ������ ��������,
-- ����������� �� ������������ � ��� �B�. ���������� ��������� ����, �� ����� ��
-- �� ������� ���-������� ��������
select l.model, l.price
from laptop as l
join product as p on p.maker='B' and p.model=l.model
order by l.price DESC;

select p.model, price
from product p
join laptop on p.model = laptop.model
where maker = 'B';


select l.model, price
from laptop as l
join product as p on p.maker='B' and p.model=l.model

union

select pc.model, price
from pc as pc
join product as p on p.maker='B' and p.model=pc.model

union

select pr.model, price
from printer as pr
join product as p on p.maker='B' and p.model=pr.model

order by price DESC;

-- 2.3 ������� ��������� �� ���� �������, ����� �� ��������� �
-- ���� ��� ���������
select distinct p1.hd
from pc as p1
join pc as p2 on p1.hd = p2.hd and p1.code <> p2.code;

-- 2.4  ������� ������ ������ ������ �� ��������, ����� ����
-- ������� ������� � �����. �������� ������ �� �� �������� ���� �� ������,
-- �������� ���� (i, j), �� �� � (j, i)
select distinct p1.model, p2.model
from pc p1
join pc p2 on p1.speed = p2.speed and p1.ram = p2.ram
where p1.model < p2.model;

-- 2.5 �������� ������, ����� ������� ��������������� �� ���� ��� ��������
-- ��������� � ������� �� ��������� ���� 1000 MHz

