IF EXISTS (SELECT * FROM master.dbo.sysdevices WHERE name='device02')
EXEC sp_dropdevice 'device02' , 'delfile';

EXEC sp_addumpdevice 'DISK', 'device02','C:\univer\BD\lab11\Dosar\exercitiul2.bak'
GO 
BACKUP DATABASE University
TO device02 WITH FORMAT,
NAME = N'universitatea-Differential Database Backup'
GO