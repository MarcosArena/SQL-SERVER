alter Function functionDetails 
-- Parámetro/s de Entrada --
 (@CodeArticle int)
-- Nombre de la Tabla de Retorno -- 
  returns @NameQuantity table
-- Formato de la Tabla de Retorno
  (Name nvarchar(50),
   Quantity int )
  as
-- Cuerpo de la funcion -- 
 Begin
   -- Inserta Datos en la Tabla --
   insert @NameQuantity
   select  a.Name, SUM(sd.Quantity)  
   from Articles as a INNER JOIN
   SalesDetails as sd ON a.Code = sd.CodeArticle
   where a.Code = @CodeArticle
   group by a.Code, Name  
   -- retorna la tabla --
   return
 end;

 --Utilizar la FUNCTION 
DECLARE @CodeArticle int
SET @CodeArticle=2
Select a.Code , f.Name, f.Quantity, a.Price from functionDetails(2) as f INNER JOIN Articles AS a
ON f.Name = a.Name

select * from Articles