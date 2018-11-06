Declare @disciplina varchar(20), @evaluarea varchar(10), @Nota1 int, @Nota2 int, @Nota int;
Set @disciplina = 'Baze de date';
Set @evaluarea = 'Testul 1';
Set @Nota1 = 6;
Set @Nota2 = 8;

select top 10 Nume_Student, Prenume_Student, Nota
from studenti
join studenti_reusita on studenti.Id_Student = studenti_reusita.Id_Student
join discipline on studenti_reusita.Id_Disciplina = discipline.Id_Disciplina
Where Disciplina = @disciplina and 
	  Tip_Evaluare = @evaluarea and 
	  Nota in (iif(Nota <> @Nota1 and Nota <> @Nota2, Nota, null))
