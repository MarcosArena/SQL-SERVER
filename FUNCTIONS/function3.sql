--EJEMPLO DE UNA FUNCTION COMPLEJA
--Crear la FUNCTION

select top 1 ProductID, SUM(OrderQty) as quantity
from Sales.SalesOrderDetail group by ProductID
order by quantity desc

select ProductID from (
select s.ProductID, SUM(s.OrderQty) as total
FROM Sales.SalesOrderDetail as s
group by S.ProductID) as t1
where total in (select max(total) from
(select s.ProductID, sum(s.OrderQty) as total
FROM Sales.SalesOrderDetail as s
group by s.ProductID) as t2)

create function ProductMax()
returns int
as
begin
declare @result int
select @result = ProductID from (
select s.ProductID, SUM(s.OrderQty) as total
FROM Sales.SalesOrderDetail as s
group by S.ProductID) as t1
where total in (select max(total) from
(select s.ProductID, sum(s.OrderQty) as total
FROM Sales.SalesOrderDetail as s
group by s.ProductID) as t2

)
return @result
end

--select de nombre id y color del producto más vendido
select Name, ProductID, Color FROM Production.Product 
where ProductID = dbo.ProductMax()