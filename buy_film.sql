USE pet_project

GO

CREATE PROCEDURE buy_film @film_name NVARCHAR(100), @date DATE, @nick_name NVARCHAR(50) AS
IF (dbo.Is_film_exist(@film_name,@date)=1)
	IF(dbo.Is_client_exist(@nick_name)=1)
		BEGIN
			DECLARE @film_id INT = dbo.get_film_id(@film_name,@date)  
			DECLARE @email NVARCHAR(50) = (SELECT email FROM client WHERE name = @nick_name)
			IF ((SELECT price FROM film_info WHERE film_id = @film_id) != 0)
				IF((SELECT COUNT(*) FROM client_library WHERE email = @email AND film_id = @film_id)=0)
					EXEC Add_client_to_film @film_name, @date, @nick_name
				ELSE 
					PRINT('фильм с названием ' + @film_name + ' ' + CONVERT(NVARCHAR, YEAR(@date)) + '-го года уже куплен')
			ELSE
				PRINT('фильм с названием ' + @film_name + ' ' + CONVERT(NVARCHAR, YEAR(@date)) + '-го года бесплатный')
        END
	ELSE
		PRINT('клиента ' + @nick_name + ' не существует')	
ELSE
	PRINT('фильма с названием ' + @film_name + ' ' + CONVERT(NVARCHAR, YEAR(@date)) + '-го года не существует')
