USE pet_project

GO

CREATE PROCEDURE Add_profile_film @film_name NVARCHAR(100), @date DATE
AS
IF (dbo.Is_film_exist(@film_name, @date) = 1)
	PRINT('фильм с названием ' + @film_name + ' ' + CONVERT(NVARCHAR, YEAR(@date)) + '-го года уже существует')
ELSE
	BEGIN
	INSERT INTO film(name, release_date)
	       VALUES (@film_name, @date)
	INSERT INTO film_info(film_id)
	       VALUES (dbo.get_film_id(@film_name, @date))
	END

GO

CREATE PROCEDURE Add_profile_actor @full_name NVARCHAR(100)
AS
IF (dbo.Is_actor_exist(@full_name) = 1)
	PRINT('актер ' + @full_name + ' уже существует')
ELSE
	BEGIN
	INSERT INTO actor(full_name)
	       VALUES (@full_name)
	END

GO

CREATE PROCEDURE Add_profile_director @full_name NVARCHAR(100)
AS
IF (dbo.Is_director_exist(@full_name) = 1)
	PRINT('режиссер ' + @full_name + ' уже существует')
ELSE
	BEGIN
	INSERT INTO director(full_name)
           VALUES (@full_name)
	END

GO

CREATE PROCEDURE Add_profile_genre @name NVARCHAR(50)
AS
IF (dbo.Is_genre_exist(@name) = 1)
	PRINT('жанр ' + @name + ' уже существует')
ELSE
	BEGIN
	INSERT INTO genre(name)
           VALUES (@name)
	END

GO

CREATE PROCEDURE Add_profile_client @email NVARCHAR(100), @name NVARCHAR(50)
AS
IF (dbo.Is_client_exist(@name) = 1)
	PRINT('никнейм ' + @name + ' уже занят')
ELSE
	BEGIN
	INSERT INTO client(email, name)
           VALUES (@email, @name)
	END

GO