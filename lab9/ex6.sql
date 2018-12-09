USE University 
GO 
DROP FUNCTION IF EXISTS Func_ex6 
GO 
CREATE FUNCTION Func_ex6 (@Evaluarea varchar(50), @NotaMin INT) 
returns table
as
return
	select distinct Nume_Student, Prenume_Student
	from studenti.studenti
	join studenti.studenti_reusita on studenti.Id_Student = studenti_reusita.Id_Student
	where Not studenti.Id_Student = Any
	(select Id_Student from studenti.studenti_reusita 
	where Tip_Evaluare = @Evaluarea and Nota > @NotaMin)
go

USE University 
GO 
DROP FUNCTION IF EXISTS Func_exercise6 
GO 
CREATE FUNCTION Func_exercise6 (@NrOfStudents INT) 
returns table
as return 
		Select Cod_Grupa
	from grupe
	where Id_Grupa IN
	(Select Id_Grupa
	from studenti.studenti_reusita
	group by Id_Grupa
	having COUNT(Distinct Id_Student) > @NrOfStudents)
go

select * from Func_exercise6 (24)
select * from Func_ex6 ('Reusita curenta', 5)
