--EJEMPLO DE UNA FUNCTION COMPLEJA
--Crear la FUNCTION
CREATE FUNCTION GetMainColor()
RETURNS NVARCHAR(25)
AS
BEGIN
	DECLARE @OrderQty INTEGER
	DECLARE @Color NVARCHAR(25)
	DECLARE c CURSOR SCROLL FOR
	SELECT SUM(sod.OrderQty) AS OrderQty,p.Color
	FROM sales.salesorderdetail AS sod
	INNER JOIN production.product AS p
	ON sod.ProductID=p.ProductID
	WHERE p.Color is not null
	GROUP BY p.Color
	ORDER BY OrderQty DESC

	OPEN c
	FETCH FIRST FROM c INTO @OrderQty, @Color
	IF(@@fetch_status<> 0)
		SET @color=''
	CLOSE c
	DEALLOCATE c
	RETURN @color
END

--Utilizar la FUNCTION Forma 1ª:
SELECT * FROM production.product
WHERE color=dbo.GetMainColor()

--Utilizar la FUNCTION Forma 2ª:
DECLARE @Color NVARCHAR(25)
SET @Color=dbo.GetMainColor()
SELECT * FROM production.product
WHERE color=@Color

