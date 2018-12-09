Use University
Go
Drop trigger if exists lab10_ex3
Go
Create trigger lab10_ex3 on studenti.studenti_reusita
after update, delete
as
	Declare @Nota int 
	Declare @NotaMsg  varchar(255) = 'Nota pentru studentii din grupa CIB171 nu poate fi micsorata'
	Declare @DataMsg varchar(255) = 'Cimpul Data_Evaluare pentru studentii din grupa CIB171 nu poate fi modificat'

	Select @Nota = deleted.Nota from deleted, grupe
		where deleted.Id_Grupa = grupe.Id_Grupa
		and Cod_Grupa = 'CIB171'
	
	if(@Nota > (Select top 1 Nota from inserted, grupe where inserted.Id_Grupa = grupe.Id_Grupa and Cod_Grupa = 'CIB171'))
	begin
		Raiserror(@NotaMsg, 16, 1)
		Rollback transaction
	end
	if( Update(Data_Evaluare) and exists (Select top 1 Data_Evaluare from inserted, grupe
		where inserted.Id_Grupa = grupe.Id_Grupa and Cod_Grupa = 'CIB171'))
	begin
		Raiserror(@DataMsg, 16, 1)
		Rollback transaction
	end
		

UPDATE studenti.studenti_reusita SET Nota=nota-1 WHERE Id_Grupa= (select Id_Grupa from grupe where Cod_Grupa='CIB171')

UPDATE studenti.studenti_reusita SET Data_Evaluare='2018-01-13' WHERE Id_Grupa= (select Id_Grupa from grupe where Cod_Grupa='CIB171')
