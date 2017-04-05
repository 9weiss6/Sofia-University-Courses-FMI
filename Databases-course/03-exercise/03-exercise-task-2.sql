-- task 2
use pc;

-- 2.1 ������� ��������������� �� ���������� �������� � ������� ���� 500
select distinct maker
from product
where model in (select model from pc where speed >= 500);

-- 2.2 ������� ���������� � ���-������ ����
select *
from printer
where price >= all (select price from printer);

-- ����� ���� ������� � ���-������ ����
select top 1 *
from printer
order by price DESC;

-- ������ ����������� � �����, ������� ������ ���� �� �� ������ ����:
select top 1 *
from printer
where price >= all (select price from printer);

-- 2.3 ������� ���������, ����� ������� � ��-����� ��
-- ��������� �� ����� � �� � ���������� ��������
select *
from laptop
where speed < all (select speed from pc); -- all - ��-����� �� ������ ��������
-- any - ��-����� �� ���� ���� ����.

-- 2.4 ������� ������ �� �������� (PC, ��� ��� ��� �������) � ���-������ ����
select distinct model
from (select model, price from pc
		union all
		select model, price from laptop
		union all
		select model, price from printer) as AllProducts
where price >= all (select price from pc
					union all
					select price from laptop
					union all
					select price from printer);

-- 2.5 ������� ������������� �� ������� ������� � ���-����� ����
select distinct maker
from product
where model in (select model from printer 
				where color='y' and price <= all (select price from printer where color='y'));

-- 2.6 ������� ��������������� �� ���� ���������� ��������
-- � ���-����� RAM �����, ����� ���� ���-����� ���������
select maker
from product
where model in (select model 
				from pc
				where ram <= all (select ram from pc) 
					and speed >= all (select speed 
										from pc 
										where ram <= all (select ram from pc)));
