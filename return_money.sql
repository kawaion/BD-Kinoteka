USE pet_project

GO

CREATE PROCEDURE return_money @film_name NVARCHAR(100), @date DATE, @nick_name NVARCHAR(50), @admin_status BIT = 0 AS
IF (dbo.Is_film_exist(@film_name,@date)=1)
	IF(dbo.Is_client_exist(@nick_name)=1)
		BEGIN
			DECLARE @film_id INT = dbo.get_film_id(@film_name,@date)  
			DECLARE @email NVARCHAR(50) = (SELECT email FROM client WHERE name = @nick_name)
			IF ((SELECT price FROM film_info WHERE film_id = @film_id) != 0)
				IF(EXISTS(SELECT * FROM client_library WHERE email = @email AND film_id = @film_id))
					IF((SELECT viewing_status FROM client_library WHERE email = @email AND film_id = @film_id)=0 OR @admin_status = 1)
						BEGIN
							DECLARE @price NUMERIC = (SELECT price FROM film_info WHERE film_id = @film_id)
							UPDATE client
							SET amount = amount + @price
							WHERE name = @nick_name
							
							DELETE client_library
							WHERE email = @email 
							  AND film_id = @film_id
						END
					ELSE 
						PRINT('������ ' + @nick_name + ' �� ����� ������� ������ �� ����� ' + @film_name + ' ' + CONVERT(NVARCHAR, YEAR(@date)) + '-�� ����, ��� ��� �� ��� ����������')
				ELSE 
					PRINT('����� � ��������� ' + @film_name + ' ' + CONVERT(NVARCHAR, YEAR(@date)) + '-�� ���� �� ������')
			ELSE
				PRINT('����� � ��������� ' + @film_name + ' ' + CONVERT(NVARCHAR, YEAR(@date)) + '-�� ���� ����������')
        END
	ELSE
		PRINT('������� ' + @nick_name + ' �� ����������')	
ELSE
	PRINT('������ � ��������� ' + @film_name + ' ' + CONVERT(NVARCHAR, YEAR(@date)) + '-�� ���� �� ����������')