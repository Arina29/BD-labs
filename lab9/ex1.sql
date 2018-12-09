Use University
Go
Drop procedure if exists SP_Student
Go
Create procedure SP_Student
	@NotaMin Int = 5,
	@Evaluarea varchar(50) = 'Reusita curenta'
As
select distinct Nume_Student, Prenume_Student
from studenti.studenti
join studenti.studenti_reusita on studenti.Id_Student = studenti_reusita.Id_Student
where Not studenti.Id_Student = Any
(select Id_Student from studenti.studenti_reusita 
where Tip_Evaluare = @Evaluarea and Nota > @NotaMin)

go
----------------------------------------------------
Use University
Go
Drop procedure if exists SP_Grupe
go
Create procedure SP_Grupe
	@NrOfStudents int = 24
As
	Select Cod_Grupa
	from grupe
	where Id_Grupa IN
	(Select Id_Grupa
	from studenti.studenti_reusita
	group by Id_Grupa
	having COUNT(Distinct Id_Student) > @NrOfStudents)
go
execute SP_Student

execute SP_Grupe

