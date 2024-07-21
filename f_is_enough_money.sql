USE pet_project

GO

CREATE OR ALTER FUNCTION Is_enough_money(@client_name NVARCHAR(50),@price NUMERIC)
RETURNS BIT
BEGIN
DECLARE @amount NUMERIC = (SELECT amount
			               FROM client
			               WHERE name = @client_name)
IF @amount >= @price
	RETURN 1
ELSE
	RETURN 0 
RETURN 0	
END;