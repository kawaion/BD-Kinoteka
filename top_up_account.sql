USE pet_project

GO

CREATE PROCEDURE top_up_account @nick_name NVARCHAR(50), @money NUMERIC(18,0) AS
IF(dbo.Is_client_exist(@nick_name)=1)
	BEGIN
		UPDATE client
		SET amount = amount + @money
		WHERE name = @nick_name
	END
ELSE
	PRINT('клиента ' + @nick_name + ' не существует')	

