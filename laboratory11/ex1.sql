IF EXISTS (SELECT * FROM master.dbo.sysdevices WHERE name='device01')
EXEC sp_dropdevice 'device01' , 'delfile';

exec sp_addumpdevice 'DISK', 'device01', 'C:\univer\BD\lab11\Dosar\exercitiul1.bak'
GO
Backup database University
to device01 with format, Name = N'University-Full Database backup'
Go