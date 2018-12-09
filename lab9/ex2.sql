Use University
go 
drop procedure if exists SP_Reusita
go 
create procedure SP_Reusita
	@NrStudenti int = null  output
as
	Set @NrStudenti = (Select Count(Distinct Id_Student)
	from studenti.studenti_reusita
	where Nota < 5 or Nota = null)
	return @NrStudenti
go

declare @Nr int
exec @Nr = Sp_Reusita 
print @Nr
