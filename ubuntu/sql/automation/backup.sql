DECLARE @MyFileName varchar(200);
SELECT @MyFileName=N'/var/opt/mssql/backup/$(dbName)' + convert(nvarchar(20),GetDate(),112) + '.bak'
BACKUP DATABASE [$(dbName)] TO DISK=@MyFileName

