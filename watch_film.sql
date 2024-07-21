USE pet_project

GO

CREATE PROCEDURE watch_film @film_name NVARCHAR(100), @date DATE, @nick_name NVARCHAR(50) AS
IF (dbo.Is_film_exist(@film_name,@date)=1)
	IF(dbo.Is_client_exist(@nick_name)=1)
		BEGIN
			DECLARE @film_id INT = dbo.get_film_id(@film_name,@date)
			DECLARE @email NVARCHAR(50) = (SELECT email FROM client WHERE name = @nick_name)
			IF((SELECT price FROM film_info WHERE film_id = @film_id) = 0 AND NOT EXISTS(SELECT * FROM client_library WHERE email = @email AND film_id = @film_id))
				EXEC Add_client_to_film @film_name, @date, @nick_name
			IF(EXISTS(SELECT * FROM client_library WHERE email = @email AND film_id = @film_id))
				BEGIN
					UPDATE client_library
					SET viewing_status = 1
					WHERE email = @email
				      AND film_id = @film_id
					UPDATE film_info 
					SET viewing_tally = viewing_tally + 1
					WHERE film_id = @film_id
				END
			ELSE
				PRINT('фильм с названием ' + @film_name + ' ' + CONVERT(NVARCHAR, YEAR(@date)) + '-го года не куплен у клиента '+ @nick_name)		
		END
	ELSE
		PRINT('клиента ' + @nick_name + ' не существует')	
ELSE
	PRINT('фильма с названием ' + @film_name + ' ' + CONVERT(NVARCHAR, YEAR(@date)) + '-го года не существует')