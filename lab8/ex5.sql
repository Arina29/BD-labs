with cte_ex25(Grupa)
as 
(	Select Cod_Grupa
	from grupe
	where Id_Grupa IN
	(Select Id_Grupa
	from studenti.studenti_reusita
	group by Id_Grupa
	having COUNT(Distinct Id_Student) > 24)
)
Select Grupa from cte_ex25
go;

with cte_ex14(Nume, Prenume, Disciplina)
as 
(SELECT        studenti.studenti.Nume_Student, studenti.studenti.Prenume_Student, plan_studii.discipline.Disciplina
FROM            plan_studii.discipline INNER JOIN
                         studenti.studenti_reusita ON plan_studii.discipline.Id_Disciplina = studenti.studenti_reusita.Id_Disciplina INNER JOIN
                         studenti.studenti ON studenti.studenti_reusita.Id_Student = studenti.studenti.Id_Student
WHERE        (studenti.studenti_reusita.Nota > 8) AND (studenti.studenti_reusita.Tip_Evaluare = 'Examen')
)

Select Nume, Prenume from cte_ex14
go;


