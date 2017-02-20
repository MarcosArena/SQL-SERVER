/*Crear una función que devuelva, para cada uno de los productos, el precio más alto 
y más barato por el que se ha vendido. Esta información se encuentra en 
Production.ProductCostHistory.
La Función debe devolver la siguiente tabla, dado un id de producto 
como parámetro de entrada:
- Id de producto
- Nombre de producto
- Coste máximo
- Coste mínimo vendido
- Media de coste*/

alter Function ProductPrices 
-- Parámetro/s de Entrada --
 (@ProductID int)
-- Nombre de la Tabla de Retorno -- 
  returns @prices table
-- Formato de la Tabla de Retorno
  (ProductID Integer,
  Name nvarchar(50),
  MaxPrice money,
  MinPrice money,
  AveragePrice money)
  as
-- Cuerpo de la funcion -- 
 Begin
   -- Inserta Datos en la Tabla --
   insert @prices
   select ph.ProductID,  p.Name, max(ph.StandardCost) as MaxPrice, min(ph.StandardCost) as MinPrice, AVG(ph.StandardCost) as AveragePrice
   from Production.ProductCostHistory as ph INNER JOIN
   Production.Product as p ON ph.ProductID = p.ProductID
   where ph.StandardCost > 0 and ph.ProductID = @ProductID
   group by ph.ProductID, Name  
   -- retorna la tabla --
   return
 end;

 --Utilizar la FUNCTION 
DECLARE @ProductID int
SET @ProductID=708
Select * from ProductPrices(708)

select * from Production.ProductCostHistory