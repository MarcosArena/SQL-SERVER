
/* SGBD_FUN004.docx */

ALTER FUNCTION GetNumOfArticles2
(@customer int)
RETURNS int
AS
BEGIN
	declare @TotalProducts int
	select @TotalProducts = sum(sd.OrderQty)
	from Sales.SalesOrderHeader as sh, Sales.SalesOrderDetail as sd
	where sh.CustomerID=@customer and sd.SalesOrderID=sh.SalesOrderID

	return @TotalProducts
END

--Utilizar la FUNCTION Forma 1ª:


--Utilizar la FUNCTION Forma 2ª:
DECLARE @Color NVARCHAR(25)
SET @Color=dbo.GetMainColor()
SELECT * FROM production.product
WHERE color=@Color

