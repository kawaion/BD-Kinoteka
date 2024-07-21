USE pet_project

GO

DECLARE @film_name NVARCHAR(100) = '������� ����'
DECLARE @date DATE = '2019-09-07'
EXEC Add_profile_film @film_name, @date
EXEC Add_price_to_film @film_name, @date, 0

EXEC Add_profile_genre '��������'
EXEC Add_profile_genre '�������'
EXEC Add_profile_genre '�����'
EXEC Add_profile_genre '��������'

EXEC Add_profile_director '����� �������'

EXEC Add_profile_actor '������ �����'
EXEC Add_profile_actor '��� �� �����'
EXEC Add_profile_actor '���� �����'
EXEC Add_profile_actor '������ �� ʸ����'
EXEC Add_profile_actor '����� ������'

EXEC Add_genre_to_film @film_name, @date, '��������'
EXEC Add_genre_to_film @film_name, @date, '�������'
EXEC Add_genre_to_film @film_name, @date, '�����'
EXEC Add_genre_to_film @film_name, @date, '��������'

EXEC Add_director_to_film @film_name, @date, '����� �������'

EXEC Add_actor_to_film @film_name, @date, '������ �����'
EXEC Add_actor_to_film @film_name, @date, '��� �� �����'
EXEC Add_actor_to_film @film_name, @date, '���� �����'
EXEC Add_actor_to_film @film_name, @date, '������ �� ʸ����'
EXEC Add_actor_to_film @film_name, @date, '����� ������'