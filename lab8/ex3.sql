alter view example_view 
with schemabinding
as
	select Id_Student, Nume_Student,Prenume_Student, Data_Nastere_Student
	from studenti.studenti
	Where Nume_Student like '%u'
with check option
go

alter view ex25_View
as
	Select Cod_Grupa
	from grupe
	where Id_Grupa IN
	(Select Id_Grupa
	from studenti.studenti_reusita
	group by Id_Grupa
	having COUNT(Distinct Id_Student) > 24)
with check option
go

alter view ex14_View
as
SELECT        studenti.studenti.Nume_Student, studenti.studenti.Prenume_Student, plan_studii.discipline.Disciplina, studenti.studenti_reusita.Tip_Evaluare, studenti.studenti_reusita.Nota
FROM            plan_studii.discipline INNER JOIN
                         studenti.studenti_reusita ON plan_studii.discipline.Id_Disciplina = studenti.studenti_reusita.Id_Disciplina INNER JOIN
                         studenti.studenti ON studenti.studenti_reusita.Id_Student = studenti.studenti.Id_Student
WHERE        (studenti.studenti_reusita.Nota > 8) AND (studenti.studenti_reusita.Tip_Evaluare = 'Examen')
with check option
go