Begin try
	Declare @N1 Int, @N2 int, @N3 int;
	Declare @Mai_mare int;
	Set @N1 = 60 * Rand();
	Set @N2 = 60 * Rand();
	Set @N3 = 60 / 0;

	Set @Mai_mare = Case
			When @N1 > @N2 and @N1 > @N3 Then @N1
			When @N2 > @N3  and @N2 > @N1 Then @N2
			Else @N3
	END;

	Print @N1;
	Print @N2;
	Print @N3;
	Print 'Mai mare = ' + Cast(@Mai_mare as VARCHAR(2));
end try

begin catch
	print ('Division by 0 error')
	print concat ('Error_number = ', error_number())
	print concat('Error severity = ', error_severity())
	print concat('Error state = ', error_state())
end catch

if (select COUNT(Id_Student) from studenti.studenti) < 10
	begin
		raiserror('The table contains less than 10 students', 16, 1)
	end
else
	Begin try
		Declare @disciplina varchar(20), @evaluarea varchar(10), @Nota1 int, @Nota2 int, @Nota int;
		Set @disciplina = 'Baze de date';
		Set @evaluarea = 'Testul 1';
		Set @Nota1 = 6;
		Set @Nota2 = 8;
		select top 10 Nume_Student, Prenume_Student
		from studenti.studenti
			join studenti.studenti_reusita on studenti.Id_Student = studenti_reusita.Id_Student
			join plan_studii.discipline on studenti_reusita.Id_Disciplina = discipline.Id_Disciplina
			Where Disciplina = @disciplina and 
				  Tip_Evaluare = @evaluarea and 
				Nota in (iif(Nota <> @Nota1 and Nota <> @Nota2, Nota, null))
	end try 

	begin catch 
		Print concat('An error has occured : ', error_message())
	end catch