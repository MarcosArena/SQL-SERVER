
CREATE PROCEDURE TotalEmpleadosApellido
	-- Add the parameters for the stored procedure here
	@Dept_No int,
	@Apellido varchar(50)


AS

BEGIN
DECLARE @Total int



SELECT d.Dept_No, e.Apellido, count(e.Apellido) AS TOTAL FROM 
Emp AS e INNER JOIN Dept as d ON e.Dept_No = d.Dept_No 
where Apellido = @Apellido
GROUP BY e.Apellido, d.Dept_No
	


	end

GO
