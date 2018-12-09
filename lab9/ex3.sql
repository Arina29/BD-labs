Use University
Go 
Drop procedure if exists SP_PopulateStudent
go
Create procedure SP_PopulateStudent
@Id_Student int,
@Nume_Student varchar(50),
@Prenume_Student varchar(50),
@Data_Nastere_Student date,
@Adresa_Postala varchar(500),
@Cod_Grupa char(6) 
As
Insert into 
studenti.studenti(Id_Student, Nume_Student, Prenume_Student, Data_Nastere_Student, Adresa_Postala_Student)
values 
(@Id_Student, @Nume_Student, @Prenume_Student, @Data_Nastere_Student, @Adresa_Postala)
Insert into 
studenti.studenti_reusita(Id_Student, Id_Disciplina, Id_Profesor, Id_Grupa, Tip_Evaluare, Nota, Data_Evaluare)
values (
@Id_Student, 105, 110, (select Id_Grupa from grupe where Cod_Grupa = @Cod_Grupa), 'Testul 1', NUll, '2018-01-25')

exec SP_PopulateStudent 300, Iurie, Cernei, '1999-12-05', 'mun. Chisinau', 'CIB171'
select * from studenti.studenti_reusita where Id_Student = 300