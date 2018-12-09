use University 
go
drop procedure if exists SP_ChangeTeacher
go
create procedure SP_ChangeTeacher
	@TeacherName varchar(50),
	@TeacherSurname varchar(50),
	@NewTeacherName varchar(50),
	@NewTeacherSurname varchar(50),
	@Discipline varchar(255)
as
if exists (select Disciplina from plan_studii.discipline, studenti.studenti_reusita st, profesori pr 
		where discipline.Id_Disciplina = st.Id_Disciplina and st.Id_Profesor = pr.Id_Profesor and 
			  @Discipline = Disciplina and Nume_Profesor = @TeacherName and Prenume_Profesor = @TeacherSurname)
	begin
		Update profesori 
		set Nume_Profesor = @NewTeacherName, Prenume_Profesor = @NewTeacherSurname
		where Id_Profesor = (select Id_Profesor from profesori where
							Nume_Profesor = @TeacherName and Prenume_Profesor = @TeacherSurname)
	end
else
begin
	Print('Datele inserate sunt incorecte')
end

execute SP_ChangeTeacher 'Popescu', 'Gabriel', 'Marinciuc', 'Maria', 'Sisteme de operare'

select * from profesori