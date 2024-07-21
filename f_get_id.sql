USE pet_project

GO

CREATE OR ALTER FUNCTION get_film_id(@film_name NVARCHAR(50),@date DATE)
RETURNS INT
BEGIN
RETURN(SELECT id
       FROM film
       WHERE name = @film_name
         AND release_date = @date)
END;

GO

CREATE OR ALTER FUNCTION get_actor_id(@full_name NVARCHAR(100))
RETURNS INT
BEGIN
RETURN(SELECT id
       FROM actor
       WHERE full_name = @full_name)
END;

GO

CREATE OR ALTER FUNCTION get_genre_id(@name NVARCHAR(50))
RETURNS INT
BEGIN
RETURN(SELECT id
       FROM genre
       WHERE name = @name)
END;

GO

CREATE OR ALTER FUNCTION get_director_id(@full_name NVARCHAR(100))
RETURNS INT
BEGIN
RETURN(SELECT id
       FROM director
       WHERE full_name = @full_name)
END;