-- task 3
use ships;

-- 3.1 ������� ����� �� ��������, ��-����� (displacement) �� 35000


-- 3.2  ������� �������, ����������������� � ���� ������ ��
-- ������ ������, ��������� � ������� ��� �Guadalcanal�
select name, displacement, numguns
from classes c
join ships s on c.class=s.class
join outcomes o on s.name=o.ship
where o.battle = 'Guadalcanal';

select name, displacement, numguns
from outcomes
join ships on ship = name
join classes on ships.class = classes.class
where battle = 'Guadalcanal';

-- 3.3 ������� ������� �� ���� �������, ����� ���� �������
-- ������ �� ��� �bb� � �bc� ������������
select c1.country
from classes c1
join classes c2 on c1.country = c2.country
where c1.type = 'bb' and c2.type = 'bc';

-- 3.4 ������� ������� �� ���� ������, ����� �� ����
-- ��������� � ���� �����, �� ��-����� �� ��������� � ����� �����

