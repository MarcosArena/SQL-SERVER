declare getTotalProducts cursor for select
CustomerID, dbo.GetNumOfArticles(CustomerID)
from Sales.Customer

declare @CustomerID int
declare @TotalProducts int
open getTotalProducts
fetch next from getTotalProducts into @CustomerID, @TotalProducts
while (@@FETCH_STATUS = 0)
BEGIN
	print 'El customer:' + cast(@CustomerID as nvarchar(50)) + ', ha comprado '
	+ cast(@TotalPRoducts as nvarchar(50)) + ' productos'
	fetch next from getTotalProducts into @CustomerID, @TotalProducts
END

close getTotalProducts
deallocate getTotalProducts