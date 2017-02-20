-- Create procedure to retrieve error information.  
ALTER PROCEDURE insertDetail 
@CodeSale int,
@CodeArticle int, 
@Quantity int
AS  
  
BEGIN TRY  
    -- Insert data. 
	INSERT INTO SalesDetails (CodeSale, CodeArticle, Quantity) VALUES (@CodeSale,@CodeArticle, @Quantity);    
END TRY  
BEGIN CATCH  
    -- Execute error retrieval routine.  
   SELECT  
    ERROR_NUMBER() AS ErrorNumber  
    ,ERROR_SEVERITY() AS ErrorSeverity  
    ,ERROR_STATE() AS ErrorState  
    ,ERROR_PROCEDURE() AS ErrorProcedure  
    ,ERROR_LINE() AS ErrorLine  
    ,ERROR_MESSAGE() AS ErrorMessage;
	  
END CATCH; 

-- Ejecutamos el procedure.
exec insertDetail 1,1,10




