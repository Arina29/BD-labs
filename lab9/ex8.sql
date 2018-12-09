Use University
Go
drop function if exists Func_Ex8
Go
create function Func_Ex8(@Nume_Prenume_Student as varchar(255))
returns table 
as
return
select concat(Nume_Student, ' ', Prenume_Student) Nume_Prenume, Disciplina, Nota, Data_Evaluare
from studenti.studenti st, plan_studii.discipline d, studenti.studenti_reusita st_r
where st.Id_Student = st_r.Id_Student and st_r.Id_Disciplina = d.Id_Disciplina
and @Nume_Prenume_Student = concat(Nume_Student, ' ', Prenume_Student)
go
select * from Func_Ex8('Brasovianu Teodora')
