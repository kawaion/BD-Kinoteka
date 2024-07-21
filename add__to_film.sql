USE pet_project

GO

CREATE PROCEDURE Add_actor_to_film  @film_name NVARCHAR(100), @date DATE, @full_name NVARCHAR(100)
AS
IF (dbo.Is_film_exist(@film_name,@date)=1)
	IF(dbo.Is_actor_exist(@full_name)=1)
		BEGIN
			INSERT INTO actor_film(film_id, actor_id)
			VALUES (dbo.get_film_id(@film_name,@date), dbo.get_actor_id(@full_name))
        END
	ELSE
		PRINT('актера ' + @full_name + ' не существует')	
ELSE
	PRINT('фильма с названием ' + @film_name + ' ' + CONVERT(NVARCHAR, YEAR(@date)) + '-го года не существует')

GO

CREATE PROCEDURE Add_genre_to_film  @film_name NVARCHAR(100), @date DATE, @genre_name NVARCHAR(100)
AS
IF (dbo.Is_film_exist(@film_name,@date)=1)
	IF(dbo.Is_genre_exist(@genre_name)=1)
		BEGIN
			INSERT INTO genre_film(film_id, genre_id)
			VALUES (dbo.get_film_id(@film_name,@date), dbo.get_genre_id(@genre_name))
        END
	ELSE
		PRINT('жанра ' + @genre_name + ' не существует')	
ELSE
	PRINT('фильма с названием ' + @film_name + ' ' + CONVERT(NVARCHAR, YEAR(@date)) + '-го года не существует')

GO

CREATE PROCEDURE Add_price_to_film  @film_name NVARCHAR(100), @date DATE, @price NUMERIC(18,0)
AS
IF (dbo.Is_film_exist(@film_name,@date)=1)
    BEGIN
		DECLARE @film_id INT = dbo.get_film_id(@film_name,@date)  

		UPDATE film_info
		SET price = @price
		WHERE film_id = @film_id
	END
ELSE
	PRINT('фильма с названием ' + @film_name + ' ' + CONVERT(NVARCHAR, YEAR(@date)) + '-го года не существует')

GO

CREATE PROCEDURE Add_client_to_film  @film_name NVARCHAR(100), @date DATE, @nick_name NVARCHAR(50)
AS
IF (dbo.Is_film_exist(@film_name,@date)=1)
	IF(dbo.Is_client_exist(@nick_name)=1)
		BEGIN
			DECLARE @film_id INT = dbo.get_film_id(@film_name,@date)  
			DECLARE @price NUMERIC = (SELECT price FROM film_info WHERE film_id = @film_id)
			IF(dbo.Is_enough_money(@nick_name, @price) = 1)
				BEGIN
					UPDATE client
					SET amount = amount - @price
					WHERE name = @nick_name
					DECLARE @email NVARCHAR(50) = (SELECT email FROM client WHERE name = @nick_name)
					INSERT INTO client_library(email, film_id)
					VALUES (@email, dbo.get_film_id(@film_name,@date))
				END
			ELSE
			    PRINT('у клиента ' + @nick_name + ' не достаточно средств для покупки фильма' + @film_name + ' ' + CONVERT(NVARCHAR, YEAR(@date)) + '-го года')
        END
	ELSE
		PRINT('клиента ' + @nick_name + ' не существует')	
ELSE
	PRINT('фильма с названием ' + @film_name + ' ' + CONVERT(NVARCHAR, YEAR(@date)) + '-го года не существует')

GO

CREATE PROCEDURE Add_director_to_film  @film_name NVARCHAR(100), @date DATE, @full_name NVARCHAR(100)
AS
IF (dbo.Is_film_exist(@film_name,@date)=1)
	IF(dbo.Is_director_exist(@full_name)=1)
		BEGIN
			DECLARE @film_id INT = dbo.get_film_id(@film_name,@date)  

			UPDATE film_info
			SET director_id = dbo.get_director_id(@full_name)
			WHERE film_id = @film_id
        END
	ELSE
		PRINT('режиссера ' + @full_name + ' не существует')	
ELSE
	PRINT('фильма с названием ' + @film_name + ' ' + CONVERT(NVARCHAR, YEAR(@date)) + '-го года не существует')