DECLARE @return_value int

EXEC @return_value = [dbo].[AltaEmpleado]
	@Apellido = 'Arena', 
	@Oficio = 'CEO', 
	@Dir = '7788', 
	@Salario = 9000000, 
	@Comision = 90,
	@Dept_No = 10 
	--@ids = @ids OUTPUT

	select 'Return Value' = @return_value

	select * from dbo.Emp