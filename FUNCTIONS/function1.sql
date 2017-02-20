--EJEMPLO DE UNA FUNCTION SENCILLA
--Crear la FUNCTION
GO
CREATE FUNCTION PersonCount()
RETURNS INTEGER
AS
BEGIN
	DECLARE @Counter INTEGER
	SET @Counter=(SELECT COUNT(BusinessEntityID) FROM PERSON.PERSON)
	RETURN @Counter
END

--Utilizar la FUNCTION
DECLARE @Resultado INTEGER
SET @Resultado=dbo.PersonCount()
SELECT @Resultado AS RESULTADO
-- O bien
-- PRINT @Resultado
