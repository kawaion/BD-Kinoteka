USE pet_project

GO

CREATE PROCEDURE rename_client @old_name NVARCHAR(100), @new_name NVARCHAR(100) AS
IF(dbo.Is_client_exist(@old_name)=1)
	UPDATE client
	SET name = @new_name
	WHERE name = @old_name    
ELSE
	PRINT('клиента ' + @old_name + ' не существует')	