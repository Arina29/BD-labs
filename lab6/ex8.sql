Create Unique nonclustered Index ix_student_reusita on studenti_reusita(Id_Student,Id_Disciplina, Tip_Evaluare, Nota ASC)
where Nota > 5 and Tip_Evaluare = 'Reusita curenta'
on userdatafgroup1

Create Unique nonclustered Index ix_student_reusita_2 on studenti_reusita(Id_Student,Id_Disciplina, Tip_Evaluare, Nota ASC)
where Nota > 8 and Tip_Evaluare = 'Examen'
on userdatafgroup1


Select  Distinct Nume_Student, Prenume_Student, Disciplina
From studenti
join studenti_reusita on studenti.Id_Student = studenti_reusita.Id_Student
join discipline on studenti_reusita.Id_Disciplina = discipline.Id_Disciplina
where Tip_Evaluare = 'Examen' AND Nota > 8 

Select Cod_Grupa
from grupe
where Id_Grupa IN
(Select Id_Grupa
from studenti_reusita
group by Id_Grupa
having COUNT(Distinct Id_Student) > 24)

select distinct Nume_Student, Prenume_Student
from studenti
join studenti_reusita  on studenti.Id_Student = studenti_reusita.Id_Student
where Not studenti.Id_Student = Any
(select Id_Student from studenti_reusita where Tip_Evaluare = 'Reusita curenta' and Nota > 5)