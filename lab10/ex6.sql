Use University 
Go
Drop trigger if exists Lab10_ex6 on database
Go
Create trigger Lab10_ex6
on database
for alter_table 
as
	Declare @Id_Profesor varchar(50)
	Declare @event1 varchar(500)
	Declare @event2 varchar(500)
	Declare @event3 varchar(100)
	SELECT @Id_Profesor=EVENTDATA().value('(/EVENT_INSTANCE/AlterTableActionList/*/Columns/Name)[1]', 'nvarchar(100)') 
	
	IF @Id_Profesor='Id_Profesor'
	BEGIN
	SELECT @event1 = EVENTDATA().value('(/EVENT_INSTANCE/TSQLCommand/CommandText)[1]','nvarchar(max)') 
	SELECT @event3 = EVENTDATA().value('(/EVENT_INSTANCE/ObjectName)[1]','nvarchar(max)') 
	SELECT @event2 = REPLACE(@event1, @event3, 'profesori');
	EXECUTE (@event2) 
	SELECT @event2 = REPLACE(@event1, @event3, 'orarul');
	EXECUTE (@event2) 
	SELECT @event2 = REPLACE(@event1, @event3, 'studenti_reusita');
	EXECUTE (@event2)   
	PRINT 'Datele au fost modificate'   
	END 

alter TABLE profesori alter column Id_Profesor smallint 
alter table studenti.studenti_reusita alter column Id_Profesor smallint 

select * from sys.triggers 
		
