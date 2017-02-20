ALTER TRIGGER updatePrice
ON MyProducts

FOR UPDATE
AS
BEGIN
	DECLARE @Code int
	DECLARE @Price smallmoney
	DECLARE @PriceAvg smallmoney

	SELECT	@Code=Code,	@Price=Price FROM inserted 
	SELECT  @PriceAvg=PriceAvg from MyProductsPlus where Code = @Code

	update MyProductsPlus
			set PriceAvg = ((@Price + @PriceAvg) / 2) where Code = @Code
		
END



