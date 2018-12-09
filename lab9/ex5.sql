use University
go 
drop procedure if exists SP_BestStudents 
go
create procedure SP_BestStudents
	@Discipline varchar(50)
	as
    Declare @students table(Id_Student int, media decimal)
	insert into @students
	
	select top 3 st.Id_Student, convert(decimal(5,2),round(Avg(Nota+0.0),3)) as media
	from studenti.studenti st, studenti.studenti_reusita st_r, plan_studii.discipline d
	where st.Id_Student = st_r.Id_Student
	and st_r.Id_Disciplina = d.Id_Disciplina
	and  Disciplina = @Discipline
	group by (st.Id_Student)
	order by(media) desc
	 
	 select Cod_Grupa, concat(Nume_Student, ' ', Prenume_Student) as Nume_Prenume_Student, Disciplina, nota as Nota_Veche, 
			iif(nota <= 9, nota+1, nota) as Nota_Noua
	 from studenti.studenti st, studenti.studenti_reusita st_r, grupe g, plan_studii.discipline d
	 where st.Id_Student = st_r.Id_Student and st_r.Id_Grupa = g.Id_Grupa and st_r.Id_Disciplina = d.Id_Disciplina
	 and Tip_Evaluare = 'Examen' and st.Id_Student in (select Id_Student from @students) and Disciplina = @Discipline


update studenti.studenti_reusita 
set Nota = (Nota + 1) where Id_Student in (
	select Id_Student from @students 
	where Tip_Evaluare = 'Examen' and Nota < 10
	and Id_Disciplina = (select Id_Disciplina from plan_studii.discipline where Disciplina = @Discipline))
go

exec SP_BestStudents 'Cercetari operationale '

