Use University
Go
Drop function if exists Func_ex9
Go 
create function Func_ex9(@CodGrupa varchar(6), @Is_Good varchar(20))
returns @result table (Grupa varchar(6), Nume_Prenume varchar(50), Nota_Medie decimal(4, 2), Is_Good varchar(20)) 
with encryption 
as 
begin
if(@Is_Good = 'sarguincios')
	Insert @result
	Select top 1 Cod_Grupa, concat(Nume_Student, ' ', Prenume_Student) as Nume_Prenume, convert(decimal(5,2),round(Avg(Nota+0.0),3)) as Nota_Medie, @Is_Good as Is_Good
	from grupe g, studenti.studenti st, studenti.studenti_reusita st_R
	where g.Id_Grupa = st_R.Id_Grupa and st_R.Id_Student = st.Id_Student
	and Cod_Grupa = @CodGrupa
	Group by Cod_Grupa, concat(Nume_Student, ' ', Prenume_Student)
	order by Nota_Medie desc
else
if(@Is_Good = 'slab')
	Insert @result
		Select top 1 Cod_Grupa, concat(Nume_Student, ' ', Prenume_Student) as Nume_Prenume, convert(decimal(5,2),round(Avg(Nota+0.0),3)) as Nota_Medie, @Is_Good as Is_Good
		from grupe g, studenti.studenti st, studenti.studenti_reusita st_R
		where g.Id_Grupa = st_R.Id_Grupa and st_R.Id_Student = st.Id_Student
		and Cod_Grupa = @CodGrupa
		Group by Cod_Grupa, concat(Nume_Student, ' ', Prenume_Student)
		order by Nota_Medie asc
return
end
go

select * from Func_ex9('CIB171','slab')