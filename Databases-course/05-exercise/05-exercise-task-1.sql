-- task 1
use pc;

-- 1.1 ������� �������� ������� �� ����������
select avg(speed)
from pc;

-- 1.2 ������� ������� ������ �� �������� �� ��������� �� ����� ������������
select maker, avg(screen)
from product p
join laptop l on p.model = l.model
group by maker;

-- 1.3 ������� �������� ������� �� ��������� � ���� ��� 1000
select avg(price)
from laptop
where price > 1000;

-- 1.4 ������� �������� ���� �� ���������� ����������� �� ������������ �A�
select avg(price)
from product p
join pc on p.model = pc.model
where p.maker = 'A'; 

-- 1.5 ������� �������� ���� �� ���������� � ��������� �� ������������ �B�
select avg(price)
from (select price
		from product p
		join pc on p.model = pc.model
		where p.maker = 'B'
		union all
		select price
		from product p
		join laptop l on p.model = l.model
		where p.maker = 'B') AllPrices;

-- 1.6 ������� �������� ���� �� ���������� ������ ���������� �� �������
select speed, avg(price)
from pc
group by speed;

-- 1.7 ������� ���������������, ����� �� ��������� ���� �� 3
-- �������� ������ ���������
select maker
from product
where type='PC'
group by maker
having count(*) >= 3;

-- 1.8 ������� ��������������� �� ���������� � ���-������ ����
select maker
from product p
join pc on p.model = pc.model
where pc.price = (select max(price) from pc);

-- 1.9 ������� �������� ���� �� ���������� �� ����� �������
-- ��-������ �� 800
select speed, avg(price)
from pc
where speed > 800
group by speed;

-- 1.10 ������� ������� ������ �� ����� �� ���� ��������
-- ����������� �� �������������, ����� ����������� � ��������
select avg(hd)
from product p
join pc on p.model = pc.model
where p.maker in (select maker from product where type = 'Printer'); 

-- 1.11 �� ����� ������ �� ������ ������ ��������� � ������ ��
-- ���-������ � ���-������� ������ ��� ����� ������
select l.screen, max(l.price) - min(l2.price)
from laptop l
join laptop l2 on l.screen = l2.screen
group by l.screen;

select screen, max(price) - min(price)
from laptop
group by screen;

