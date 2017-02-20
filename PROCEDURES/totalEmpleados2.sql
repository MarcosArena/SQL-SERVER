CREATE PROCEDURE totalEmpleados2
@dept int, 
@Apellido nvarchar(50)
as
begin
	if (@dept is null)
	<!-- >
	begin
		if (@Apellido is null)
		begin
			select Emp.Dept_No, Emp.Apellido, 
			count(*) as total from Emp 
			group by Emp. Apellido, Emp.Dept_No
		end
		else
		begin
			select Emp.Dept_No, Emp.Apellido, 
			count(*) as total from Emp 
			group by Emp. Apellido, Emp.Dept_No
			having Emp.Apellido = @Apellido
		end

		end
		else
		begin
		if (@Apellido is null)
		begin
			select Emp.Dept_No, Emp.Apellido, 
			count(*) as total from Emp 
			group by Emp. Apellido, Emp.Dept_No
			having Emp.Dept_No = @dept
		end
		else
		begin
			select Emp.Dept_No, Emp.Apellido, 
			count(*) as total from Emp 
			group by Emp. Apellido, Emp.Dept_No
			having Emp.Apellido = @Apellido and
			Emp.Dept_No = @dept
		end		

		end
		end

