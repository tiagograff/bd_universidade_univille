IF NOT EXISTS (
    SELECT name
    FROM sys.DATABASES
    WHERE name = 'universidade'
)
    BEGIN
        CREATE DATABASE universidade;
        PRINT 'database universidade criado com sucesso uhuuuull :)';
    END
ELSE
    BEGIN
        PRINT 'esse database já existe :P';
    END