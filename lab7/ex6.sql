USE University; 
GO 
ALTER SCHEMA cadre_didactice TRANSFER dbo.profesori; 
GO 

USE University; 
GO 
ALTER SCHEMA plan_studii TRANSFER dbo.orarul; 
GO 

USE University; 
GO 
ALTER SCHEMA studenti TRANSFER dbo.studenti; 
GO 

USE University; 
GO 
ALTER SCHEMA studenti TRANSFER dbo.studenti_reusita; 
GO 

USE University; 
GO 
ALTER SCHEMA plan_studii TRANSFER dbo.discipline
GO 