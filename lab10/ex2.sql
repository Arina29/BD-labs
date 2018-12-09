Use University 
Go
Drop trigger if exists Populate_Students_Table
Go
Create trigger Populate_Students_Table on studenti.studenti_reusita
instead of insert 
as set nocount on 
	Declare @Id_Student int
	Declare @Nume_Student varchar(50) = 'New'
	Declare @Prenume_Student varchar(50) = 'Student'
	Declare @Data_Nastere date = null
	Declare @Adresa varchar(255) = 'mun. Chisinau'

	Select @Id_Student = inserted.Id_Student
	from inserted
	insert into studenti.studenti values (@Id_Student, @Nume_Student, @Prenume_Student, @Data_Nastere, @Adresa)
	insert into studenti.studenti_reusita 
	select * from inserted;

insert into studenti.studenti_reusita values (400, 100, 100, 1, 'Examen', 10, null)

Select * from studenti.studenti where Id_Student = 400
Select * from studenti.studenti_reusita where Id_Student = 400
