USE universidade

GO

CREATE FUNCTION dbo.fn_pegar_matricula(
    @nome_aluno VARCHAR(100)
) 
RETURNS INT
AS
BEGIN
    DECLARE @matricula_aluno INT;

    SELECT @matricula_aluno = matricula
    FROM alunos
    WHERE nome = @nome_aluno;

    IF @matricula_aluno IS NULL
    BEGIN
        RETURN NULL;
    END

    RETURN @matricula_aluno;
END
