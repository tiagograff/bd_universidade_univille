USE universidade;

GO

CREATE PROCEDURE usp_verificar_formatura
    @nome_aluno VARCHAR(100),
    @sigla_curso VARCHAR(5)
AS
BEGIN
    SET NOCOUNT ON

    DECLARE @matricula_aluno INT
    SET @matricula_aluno = dbo.fn_pegar_matricula(@nome_aluno)

    IF NOT EXISTS (
        SELECT 1
        FROM matriculas AS m
        JOIN grades_curriculares AS gc ON gc.sigla_disciplina = m.sigla_disciplina
        WHERE m.matricula_aluno = @matricula_aluno
          AND gc.sigla_curso = @sigla_curso
          AND m.resultado <> 'aprovado'
    )
    BEGIN
        PRINT 'o foi aluno formado com sucesso! :)';
    END
    ELSE
    BEGIN
        PRINT 'o aluno ainda está cursando ou tem pendências.';
    END
END;
