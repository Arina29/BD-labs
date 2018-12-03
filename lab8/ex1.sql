select Nume_Student, Prenume_Student, Disciplina from ex14_View

Use University
Go
Drop view if exists dbo.ex25_view;
Go 
Create view ex25_View as 
	Select Cod_Grupa
	from grupe
	where Id_Grupa IN
	(Select Id_Grupa
	from studenti.studenti_reusita
	group by Id_Grupa
	having COUNT(Distinct Id_Student) > 24)
Go

Select  Distinct Nume_Student, Prenume_Student, Disciplina
From studenti.studenti
join studenti.studenti_reusita  on studenti.Id_Student = studenti_reusita.Id_Student
join plan_studii.discipline on studenti_reusita.Id_Disciplina = discipline.Id_Disciplina
where Tip_Evaluare = 'Examen' AND Nota > 8 

Select * from ex25_View

Use University
go
Create view example_View as 
	select Id_Student, Nume_Student,Prenume_Student, Data_Nastere_Student
	from studenti.studenti
	Where Nume_Student like '%u'
go

select * from example_View