-----------------------------------Ex1-----------------------------------
update profesori Set Adresa_Postala_Profesor = 'mun.Chisinau' where Adresa_Postala_Profesor is null

select * from profesori
-----------------------------------Ex2-----------------------------------
alter table grupe 
alter column Cod_Grupa char(6) not null;

alter table grupe 
add unique(Cod_Grupa)

-----------------------------------Ex3-----------------------------------
alter table grupe add Sef_grupa int, Prof_Indrumator int;

update grupe 
set Sef_grupa = (Select top 1 Id_Student
				from studenti_reusita sr2
				where grupe.Id_Grupa = sr2.Id_Grupa
				group by Id_Student
				order by ROUND(AVG(CAST(Nota AS FLOAT)), 2) desc)
update grupe
set Prof_Indrumator = (select top 1 Id_Profesor
						from studenti_reusita sr
						where sr.Id_Grupa = grupe.Id_Grupa
						group by Id_Profesor
						order by Count(Id_Disciplina) desc, Id_Profesor desc)

ALTER TABLE grupe ADD CONSTRAINT U_Name UNIQUE(Prof_Indrumator)

-----------------------------------Ex4-----------------------------------
update studenti_reusita 
set nota = nota + 1 where Id_Student in (Select Sef_grupa from grupe) and nota < 10

-----------------------------------Ex5-----------------------------------
Create table profesori_new (
	Id_Profesor int,
	Nume_Profesor varchar(60),
	Prenume_Profesor varchar(60),
	Localitate varchar(255) default('mun.Chisinau'),
	Adresa_1 varchar(255),
	Adresa_2 varchar(255),
	Primary key clustered(Id_Profesor));

Insert into profesori_new(Id_Profesor, Nume_Profesor, Prenume_Profesor, Localitate, Adresa_1, Adresa_2)
select Id_Profesor, Nume_Profesor, Prenume_Profesor,
case 
	when charindex('str.', Adresa_Postala_Profesor) > 0 then
		SUBSTRING(Adresa_Postala_Profesor, 1, CHARINDEX(', str.', Adresa_Postala_Profesor) - 1)
	when charindex('bd.', Adresa_Postala_Profesor) > 0 then 
		SUBSTRING(Adresa_Postala_Profesor, 1, CHARINDEX(', bd.', Adresa_Postala_Profesor) - 1)
	when charindex('mun.', Adresa_Postala_Profesor) > 0 then 
		SUBSTRING(Adresa_Postala_Profesor, 1, len(Adresa_Postala_Profesor))
end,

case 
	when charindex('str.', Adresa_Postala_Profesor) > 0 then
		SUBSTRING(Adresa_Postala_Profesor, CHARINDEX(' str.', Adresa_Postala_Profesor)+1, patindex('%, [0-9]%', Adresa_Postala_Profesor) - CHARINDEX(', str.', Adresa_Postala_Profesor))
	when charindex('bd.', Adresa_Postala_Profesor) > 0 then 
		SUBSTRING(Adresa_Postala_Profesor, CHARINDEX(' bd.', Adresa_Postala_Profesor)+1, patindex('%, [0-9]%', Adresa_Postala_Profesor) - CHARINDEX(', bd.', Adresa_Postala_Profesor))
end,

case 
	when patindex('%, [0-9]%', Adresa_Postala_Profesor) > 0 then 
		SUBSTRING(Adresa_Postala_Profesor, patindex('%, [0-9]%', Adresa_Postala_Profesor) + 1, len(Adresa_Postala_Profesor) - patindex('%, [0-9]%', Adresa_Postala_Profesor) + 1)

end

from profesori
select * from profesori_new
-----------------------------------Ex6-----------------------------------
create table orarul (
Id_Disciplina int,
Id_Profesor int,
Id_Grupa int,
Ora time,
Auditoriu int,
Bloc char(1),
Zi char(10)

primary key(Id_Disciplina, Id_Profesor, Id_Grupa)
);

insert into orarul (Id_Disciplina, Id_Profesor, Id_Grupa, Ora, Auditoriu, Bloc, Zi)
values(107, 101, 1, '08:00', 202, 'B', 'Luni'),
	  (108, 101, 1, '11:30', 501, 'B', 'Luni'),
      (119, 117, 1, '13:00', 501, 'B', 'Luni')


-----------------------------------Ex7-----------------------------------
alter table orarul add constraint default_bloc default 'B' for Bloc

insert into orarul (Id_Disciplina, Id_Profesor, Id_Grupa, Ora, Auditoriu, Bloc, Zi)
values((Select Id_Disciplina from discipline where Disciplina = 'Structuri de date si algoritmi'),
	   (Select Id_Profesor from profesori where Nume_Profesor = 'Bivol' and Prenume_Profesor = 'Ion'), 
	   (Select Id_Grupa from grupe where Cod_Grupa = 'INF171'), '08:00', 502, 'B', 'Luni'),

	  ((Select Id_Disciplina from discipline where Disciplina = 'Programe aplicative'),
	   (Select Id_Profesor from profesori where Nume_Profesor = 'Mircea' and Prenume_Profesor = 'Sorin'), 
	   (Select Id_Grupa from grupe where Cod_Grupa = 'INF171'), '11:30', 502, 'B', 'Luni'),

      ((Select Id_Disciplina from discipline where Disciplina = 'Baze de date'),
	   (Select Id_Profesor from profesori where Nume_Profesor = 'Micu' and Prenume_Profesor = 'Elena'), 
	   (Select Id_Grupa from grupe where Cod_Grupa = 'INF171'), '13:00', 502, 'B', 'Luni')

