Use University
Go 
Drop trigger if exists Lab10_ex5 on Database 
Go
Create Trigger Lab10_ex5
on Database
for alter_table
as
Declare @StartTime datetime = '9:00:00'
Declare @Now dateTime = GetDate()
Declare @check int

if (datepart(hour, GETDATE()) not BETWEEN 9 and 18) and (DATEPART(DAY, GetDate())not in(1, 7))
begin
	Print('Schema can not be modified in non-working hours')
	rollback
end

alter table grupe add test date