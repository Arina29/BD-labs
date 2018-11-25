Select  Distinct Nume_Student, Prenume_Student, Disciplina
From studenti.students s1
join studenti.students_success s2 on s1.Id_Student = s2.Id_Student
join discipline on s2.Id_Disciplina = discipline.Id_Disciplina
where Tip_Evaluare = 'Examen' AND Nota > 8 

Select Cod_Grupa
from grupe
where Id_Grupa IN
(Select Id_Grupa
from studenti.students_success
group by Id_Grupa
having COUNT(Distinct Id_Student) > 24)


select distinct Nume_Student, Prenume_Student
from studenti.students s1
join studenti.students_success s2 on s1.Id_Student = s2.Id_Student
where Not s1.Id_Student = Any
(select Id_Student from studenti.students_success where Tip_Evaluare = 'Reusita curenta' and Nota > 5)