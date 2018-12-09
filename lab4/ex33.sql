select distinct Nume_Student, Prenume_Student
from studenti.studenti
join studenti.studenti_reusita on studenti.Id_Student = studenti_reusita.Id_Student
where Not studenti.Id_Student = Any
(select Id_Student from studenti.studenti_reusita where Tip_Evaluare = 'Reusita curenta' and Nota > 5)