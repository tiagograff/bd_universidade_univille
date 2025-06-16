USE universidade

GO

CREATE PROCEDURE usp_boletim_aluno
    @nome_aluno VARCHAR(100),
    @sigla_curso VARCHAR(5)
AS
BEGIN
    SET NOCOUNT ON

    DECLARE @matricula_aluno INT
    SET @matricula_aluno = dbo.fn_pegar_matricula(@nome_aluno)

    IF @matricula_aluno IS NULL
    BEGIN
        PRINT 'aluno não encontrado!'
        RETURN
    END
    ELSE
    BEGIN
        SELECT
            d.nome as disciplina,
            m.periodo_letivo,
            CASE
                WHEN m.resultado = 'Exame' THEN m.media_final
                ELSE m.media
            END AS media_final,
            m.resultado AS status_disciplina
            FROM matriculas AS m
            INNER JOIN disciplinas AS d
            ON m.sigla_disciplina = d.sigla
            INNER JOIN grades_curriculares AS gc
            ON d.sigla = gc.sigla_disciplina
            AND gc.sigla_curso = @sigla_curso
            WHERE m.matricula_aluno = @matricula_aluno
            AND m.resultado IS NOT NULL
            ORDER BY m.periodo_letivo ASC, d.nome ASC
    END
    
END