-- task 1
use movies;

-- 1.1 ������� ������� �� ��������� ����, ��������� � �Terms of Endearment�
select name
from starsin
join moviestar on starname=name
where gender='M' and movietitle='Terms of Endearment';

-- 1.2 ������� ������� �� ���������, ��������� ��� �����,
-- ����������� �� �MGM� ���� 1995 �.
select starname
from starsin
join movie on movietitle = title and movieyear=year
where studioname='MGM' and movieyear='1995';

-- 1.3 ������� ����� �� ���������� �� �MGM�
select distinct name
from movieexec
join movie on cert#=producerc#
where studioname='MGM';

-- 1.4  ������� ������� �� ������ ����� � �������, ��-������
-- �� ��������� �� ����� �Star Wars�
select m1.title
from movie as m1, movie as m2
where m2.title='Star Wars' and m1.length > m2.length;