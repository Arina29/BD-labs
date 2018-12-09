IF EXISTS (SELECT * FROM master.sys.databases WHERE name='universitatea_lab11')
DROP DATABASE universitatea_lab11;
GO
Restore database universitatea_lab11
from disk = 'C:\univer\BD\lab11\Dosar\exercitiul1.bak'
WITH MOVE 'University' TO 'C:\univer\BD\lab11\BD_lab11\data.mdf',
MOVE 'University_log' TO 'C:\univer\BD\lab11\BD_lab11\log.ldf',
NORECOVERY
GO
RESTORE LOG universitatea_lab11
FROM DISK = 'C:\univer\BD\lab11\Dosar\exercitiul3.bak'
WITH NORECOVERY
GO
RESTORE DATABASE universitatea_lab11
FROM DISK = 'C:\univer\BD\lab11\Dosar\exercitiul2.bak'
WITH 
NORECOVERY
GO