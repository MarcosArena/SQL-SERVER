
ALTER PROCEDURE AltaEmpleado
	-- Add the parameters for the stored procedure here
	@Apellido varchar(50),
	@Oficio varchar(50),
	@Dir int,
	@Salario numeric(9,2),
	@Comision numeric(9,2)
	--@ids int output

AS
BEGIN
	DECLARE @EmpExiste int
	DECLARE @UltimoEmp int
	select @EmpExiste = Emp_No from dbo.Emp where Apellido = upper(@Apellido) and Oficio = upper(@Oficio)

	if (@EmpExiste is null)
	begin
		select @UltimoEmp = max(Emp_No) FROM dbo.Emp 
		set @UltimoEmp = @UltimoEmp+1

		INSERT into Emp (Emp_No, Apellido, Oficio, Dir, Fecha_Alt, Salario, Comision) VALUES 
		(@UltimoEmp, upper(@Apellido), upper(@Oficio), @Dir, cast(SYSDATETIME() AS DATETIME), @Salario, @Comision)
		return @UltimoEmp
		--set @ids = @UltimoEmp
	end

	else
	--set @ids = @EmpExiste
	return @EmpExiste
	end

GO
