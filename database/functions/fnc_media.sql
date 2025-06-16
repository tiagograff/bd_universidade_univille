USE universidade;

GO

CREATE FUNCTION dbo.fn_calcular_media
(
    @valor1 DECIMAL(5,2),
    @valor2 DECIMAL(5,2),
    @valor3 DECIMAL(5,2),
    @valor4 DECIMAL(5,2)
)
RETURNS DECIMAL(5,2)
AS
BEGIN
    RETURN (@valor1 + @valor2 + @valor3 + @valor4) / 4.0
END