IF EXISTS (SELECT * FROM master.dbo.sysdevices WHERE name='backup_Log')
EXEC sp_dropdevice 'backup_Log' , 'delfile';

GO
EXEC sp_addumpdevice 'DISK', 'backup_Log', 'C:\univer\BD\lab11\Dosar\exercitiul3.bak'

GO
BACKUP LOG University TO backup_Log
GO