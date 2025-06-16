USE universidade;

GO

CREATE OR ALTER PROCEDURE usp_rematricula_aluno
    @nome_aluno VARCHAR(100),
    @sigla_curso VARCHAR(5),
    @periodo_letivo VARCHAR(7)
AS
BEGIN
    SET NOCOUNT ON

    DECLARE @matricula_aluno INT
    DECLARE @semestre_atual INT
    DECLARE @reprovacoes INT

    SET @matricula_aluno = dbo.fn_pegar_matricula(@nome_aluno)

    IF @matricula_aluno IS NULL
    BEGIN
        PRINT 'aluno não encontrado!'
        RETURN
    END

    SELECT @reprovacoes = COUNT(*)
    FROM matriculas
    WHERE matricula_aluno = @matricula_aluno
    AND resultado != 'Aprovado'
    AND resultado IS NULL

    IF @reprovacoes > 0
    BEGIN
        INSERT INTO matriculas (
            sigla_curso,
            sigla_disciplina,
            matricula_aluno,
            periodo_letivo
        )

     SELECT 
            grade.sigla_curso,
            grade.sigla_disciplina,
            @matricula_aluno,
            @periodo_letivo
        FROM grades_curriculares AS grade 
        WHERE grade.sigla_curso = @sigla_curso
        AND grade.semestre = @semestre_atual
    END
    ELSE
    BEGIN
        SET @semestre_atual = @semestre_atual + 1

        UPDATE alunos
        SET semestre_atual = @semestre_atual
        WHERE matricula = @matricula_aluno

        INSERT INTO matriculas (
            sigla_curso,
            sigla_disciplina,
            matricula_aluno,
            periodo_letivo
        )

        SELECT 
            grade.sigla_curso,
            grade.sigla_disciplina,
            @matricula_aluno,
            @periodo_letivo
        FROM grades_curriculares AS grade
        WHERE grade.sigla_curso = @sigla_curso
        AND grade.semestre = @semestre_atual

        PRINT 'rematricula realizada com sucesso!'
    END
END