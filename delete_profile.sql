USE pet_project

GO

CREATE PROCEDURE Delete_profile_film  @film_name NVARCHAR(50),@date DATE
AS
IF (dbo.Is_film_exist(@film_name,@date)=1)
	BEGIN
		DECLARE @film_id INT = dbo.get_film_id(@film_name,@date)
		DECLARE @price NUMERIC = (SELECT price FROM film_info WHERE film_id = @film_id)
		UPDATE client
		SET client.amount = client.amount + @price
		FROM (SELECT c.email 
		      FROM client AS c 
			  JOIN client_library AS l 
			  ON c.email = l.email
			  WHERE l.film_id = @film_id) AS spent
		WHERE client.email = spent.email

		DELETE client_library
		WHERE film_id = @film_id

		DELETE film_info
		WHERE film_id = @film_id
		
		DELETE actor_film
		WHERE film_id = @film_id

		DELETE genre_film
		WHERE film_id = @film_id

		DELETE film
		WHERE id = @film_id  
	END
ELSE
	PRINT('фильма с названием ' + @film_name + ' ' + CONVERT(NVARCHAR, YEAR(@date)) + '-го года не существует')

GO

CREATE PROCEDURE Delete_profile_actor  @full_name NVARCHAR(100)
AS
IF (dbo.Is_actor_exist(@full_name)=1)
	BEGIN
		   DECLARE @id INT = dbo.get_actor_id(@full_name)

		   DELETE actor_film
		    WHERE actor_id = @id

		   DELETE actor
		    WHERE id = @id   
	END
ELSE
	PRINT('актера ' + @full_name + ' не существует')

GO

CREATE PROCEDURE Delete_profile_genre  @name NVARCHAR(50)
AS
IF (dbo.Is_genre_exist(@name)=1)
	BEGIN
		   DECLARE @id INT = dbo.get_genre_id(@name)

		   DELETE genre_film
		    WHERE genre_id = @id

		   DELETE genre
		    WHERE id = @id
	END
ELSE
	PRINT('жанра ' + @name + ' не существует')

GO

CREATE PROCEDURE Delete_profile_director  @full_name NVARCHAR(100)
AS
IF (dbo.Is_director_exist(@full_name)=1)
	BEGIN
		   DECLARE @id INT = dbo.get_director_id(@full_name)

		   UPDATE film_info
		   SET director_id = NULL
		   WHERE director_id = @id

		   DELETE director
		   WHERE id = @id
	END
ELSE
	PRINT('режиссера ' + @full_name + ' не существует')

GO

CREATE PROCEDURE Delete_profile_client  @nick_name NVARCHAR(100)
AS
IF (dbo.Is_client_exist(@nick_name)=1)
	BEGIN
		DECLARE @email NVARCHAR(100) = (SELECT email
									    FROM client
										WHERE name = @nick_name)
		DECLARE @money NUMERIC

		SET @money = (SELECT SUM(f.price)
		              FROM client_library AS c
					  JOIN film_info AS f
					  ON c.film_id = f.film_id
					  WHERE c.email = @email)
		SET @money = @money + (SELECT amount FROM client WHERE email = @email)

		DELETE client_library
		WHERE email = @email
		   
		DELETE client
		WHERE email = @email

		RETURN @money
	END
ELSE
	PRINT('клиента ' + @nick_name + ' не существует')
RETURN 0

GO
