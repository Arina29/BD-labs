Use University 
Go
Drop trigger if exists inregistrare_noua
Go 
Create trigger inregistrare_noua On plan_studii.orarul
after update 
As
	if(Update(Auditoriu))
	begin
		Select 'Atentie, grupa', Cod_Grupa, 'lectiile de', Zi, 'de la ora', cast(Ora as varchar(50)),'la disciplina',
		  Disciplina ,'din blocul', Bloc,'sunt transferate din auditoriul', cast(Auditoriu as varchar(50)),
		   'in auditoriul',  cast(inserted.Auditoriu as varchar(50))  
		from inserted 
		join grupe on inserted.Id_Grupa = grupe.Id_Grupa
		join discipline on inserted.Id_Disciplina = discipline.Id_Disciplina
	end

	Update plan_studii.orarul set Auditoriu = 301 Where Zi = 'Luni'