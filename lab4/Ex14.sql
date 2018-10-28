Select  Distinct Nume_Student, Prenume_Student, Disciplina
From studenti
join studenti_reusita  on studenti.Id_Student = studenti_reusita.Id_Student
join discipline on studenti_reusita.Id_Disciplina = discipline.Id_Disciplina
where Tip_Evaluare = 'Examen' AND Nota > 8 