USE pet_project

GO

CREATE PROCEDURE Delete_actor_from_film @film_name NVARCHAR(50), @date DATE, @full_name NVARCHAR(100) AS
IF (dbo.Is_film_exist(@film_name, @date)=1)
	IF(dbo.Is_actor_exist(@full_name)=1)
		BEGIN
		DECLARE @actor_id INT = dbo.get_actor_id(@full_name)
		DECLARE @film_id INT = dbo.get_film_id(@film_name, @date)
		IF((SELECT COUNT(*) FROM actor_film WHERE film_id = @film_id AND actor_id = @actor_id)=1)
			DELETE actor_film
			WHERE film_id = @film_id 
			  AND actor_id = @actor_id
		ELSE
			PRINT('����� ' + @full_name + ' �� ���������� � ������ ' + @film_name + ' ' + CONVERT(NVARCHAR, YEAR(@date)) + '-�� ����')
		END
	ELSE
		PRINT('������ ' + @full_name + ' �� ����������')
ELSE
	PRINT('������ � ��������� ' + @film_name + ' ' + CONVERT(NVARCHAR, YEAR(@date)) + '-�� ���� �� ����������')

GO

CREATE PROCEDURE Delete_genre_from_film @film_name NVARCHAR(50), @date DATE, @name NVARCHAR(50) AS
IF (dbo.Is_film_exist(@film_name, @date)=1)
	IF(dbo.Is_genre_exist(@name)=1)
		BEGIN
		DECLARE @genre_id INT = dbo.get_genre_id(@name)
		DECLARE @film_id INT = dbo.get_film_id(@film_name, @date)
		IF((SELECT COUNT(*) FROM genre_film WHERE film_id = @film_id AND genre_id = @genre_id)=1)
			DELETE genre_film
			WHERE film_id = @film_id 
			  AND genre_id = @genre_id
		ELSE
			PRINT('���� ' + @name + ' �� ���������� � ������ ' + @film_name + ' ' + CONVERT(NVARCHAR, YEAR(@date)) + '-�� ����')
		END
	ELSE
		PRINT('����� ' + @name + ' �� ����������')
ELSE
	PRINT('������ � ��������� ' + @film_name + ' ' + CONVERT(NVARCHAR, YEAR(@date)) + '-�� ���� �� ����������')

GO

CREATE PROCEDURE Delete_director_from_film @film_name NVARCHAR(50), @date DATE, @full_name NVARCHAR(100) AS
IF (dbo.Is_film_exist(@film_name, @date)=1)
	IF(dbo.Is_director_exist(@full_name)=1)
		BEGIN
		DECLARE @director_id INT = dbo.get_director_id(@full_name)
		DECLARE @film_id INT = dbo.get_film_id(@film_name, @date)
		IF((SELECT COUNT(*) FROM film_info WHERE film_id = @film_id AND director_id = @director_id)=1)
			UPDATE film_info
		    SET director_id = NULL
		    WHERE film_id = @film_id
		ELSE
			PRINT('�������� ' + @full_name + ' �� ���������� � ������ ' + @film_name + ' ' + CONVERT(NVARCHAR, YEAR(@date)) + '-�� ����')
		END
	ELSE
		PRINT('��������� ' + @full_name + ' �� ����������')
ELSE
	PRINT('������ � ��������� ' + @film_name + ' ' + CONVERT(NVARCHAR, YEAR(@date)) + '-�� ���� �� ����������')

GO

CREATE PROCEDURE Delete_film_from_client @film_name NVARCHAR(50), @date DATE, @nick_name NVARCHAR(100) AS
IF (dbo.Is_film_exist(@film_name, @date)=1)
	IF(dbo.Is_client_exist(@nick_name)=1)
		BEGIN
		DECLARE @email NVARCHAR(100) = (SELECT email FROM client WHERE name = @nick_name)
		DECLARE @film_id INT = dbo.get_film_id(@film_name, @date)
		DECLARE @price NUMERIC = (SELECT price FROM film_info WHERE film_id = @film_id)

		IF((SELECT COUNT(*) FROM client_library WHERE film_id = @film_id AND email = @email)=1)
			BEGIN
				UPDATE client
				SET client.amount = client.amount + @price
				FROM (SELECT c.email 
					  FROM client AS c 
			          JOIN client_library AS l 
			          ON c.email = l.email
			          WHERE l.film_id = @film_id
					    AND l.email = @email) AS spent
		        WHERE client.email = spent.email

				DELETE client_library
				WHERE film_id = @film_id 
				AND email = @email
			END
		ELSE
			PRINT('������ ' + @nick_name + ' �� ������� ����� ' + @film_name + ' ' + CONVERT(NVARCHAR, YEAR(@date)) + '-�� ����')
		END
	ELSE
		PRINT('������� ' + @nick_name + ' �� ����������')
ELSE
	PRINT('������ � ��������� ' + @film_name + ' ' + CONVERT(NVARCHAR, YEAR(@date)) + '-�� ���� �� ����������')
