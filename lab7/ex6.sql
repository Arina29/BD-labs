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
ALTER SCHEMA studenti TRANSFER studenti; 
GO 

USE University; 
GO 
ALTER SCHEMA studenti TRANSFER studenti_reusita; 
GO 