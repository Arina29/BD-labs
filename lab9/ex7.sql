Use University
go 
drop function if exists Calculate_Age
go
create function Calculate_Age(@data_Nastere date)
returns int 
	begin
		DECLARE @age int;
		SELECT @age = floor(datediff(day, Data_Nastere_Student,(CONVERT (Date, CURRENT_TIMESTAMP)))/365.25) 
		FROM studenti.studenti s
		WHERE s.Data_Nastere_Student=@data_Nastere
		RETURN @age;
	end
	go
SELECT Nume_Student, Prenume_Student, Data_Nastere_Student, dbo.Calculate_Age(Data_Nastere_Student) age
FROM studenti.studenti;