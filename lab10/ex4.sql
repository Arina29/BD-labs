Use University 
Go 
Drop trigger if exists lab10_ex4 on Database
Go
Create trigger lab10_ex4
on Database
For alter_table
as
	Declare @Disciplina varchar(50)
	SELECT @Disciplina=EVENTDATA().value('(/EVENT_INSTANCE/AlterTableActionList/*/Columns/Name)[1]', 'nvarchar(100)') 
	
	IF @Disciplina='Disciplina'
	BEGIN 
		PRINT ('Nu poate fi modificata coloana Disciplina')
		rollback;
	END

	alter table plan_studii.discipline alter column Disciplina varchar(400)
