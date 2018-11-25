Select  Distinct Nume_Student, Prenume_Student, Disciplina
From studenti.studenti
join studenti.studenti_reusita  on studenti.Id_Student = studenti_reusita.Id_Student
join plan_studii.discipline on studenti_reusita.Id_Disciplina = discipline.Id_Disciplina
where Tip_Evaluare = 'Examen' AND Nota > 8 


Select Cod_Grupa
from grupe
where Id_Grupa IN
(Select Id_Grupa
from studenti.studenti_reusita
group by Id_Grupa
having COUNT(Distinct Id_Student) > 24)


select distinct Nume_Student, Prenume_Student
from studenti.studenti
join studenti.studenti_reusita on studenti.Id_Student = studenti_reusita.Id_Student
where Not studenti.Id_Student = Any
(select Id_Student from studenti.studenti_reusita 
where Tip_Evaluare = 'Reusita curenta' and Nota > 5)