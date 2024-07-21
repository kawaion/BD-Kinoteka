USE pet_project

GO

CREATE OR ALTER FUNCTION Is_film_exist(@film_name NVARCHAR(50),@date DATE)
RETURNS BIT
BEGIN
IF EXISTS(SELECT name 
	      FROM film
          WHERE LOWER(name) = LOWER(@film_name)
	        AND release_date = @date)
	RETURN 1
ELSE
	RETURN 0 
RETURN 0	
END;

GO

CREATE OR ALTER FUNCTION Is_actor_exist(@full_name NVARCHAR(100))
RETURNS BIT
BEGIN
IF EXISTS(SELECT full_name
		  FROM actor
          WHERE LOWER(full_name) = LOWER(@full_name))
	RETURN 1
ELSE
	RETURN 0  
RETURN 0
END;

GO

CREATE OR ALTER FUNCTION Is_genre_exist(@name NVARCHAR(50))
RETURNS BIT
BEGIN
IF EXISTS(SELECT name
		  FROM genre
          WHERE LOWER(name) = LOWER(@name))
	RETURN 1
ELSE
	RETURN 0  
RETURN 0
END;

GO

CREATE OR ALTER FUNCTION Is_director_exist(@full_name NVARCHAR(100))
RETURNS BIT
BEGIN
IF EXISTS(SELECT full_name
		  FROM director
          WHERE LOWER(full_name) = LOWER(@full_name))
	RETURN 1
ELSE
	RETURN 0  
RETURN 0
END;

GO

CREATE OR ALTER FUNCTION Is_client_exist(@name NVARCHAR(100))
RETURNS BIT
BEGIN
IF EXISTS(SELECT name
		  FROM client
          WHERE name = @name)
	RETURN 1
ELSE
	RETURN 0  
RETURN 0
END;