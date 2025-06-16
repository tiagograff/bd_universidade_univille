USE universidade

GO

CREATE OR ALTER PROCEDURE usp_processamento_frequencia
    @sigla_curso VARCHAR(5),
    @sigla_disciplina VARCHAR(6),
    @matricula_aluno INT,
    @periodo_letivo VARCHAR(7),
    @falta1 INT,
    @falta2 INT,
    @falta3 INT,
    @falta4 INT
AS
BEGIN 
    SET NOCOUNT ON

    IF @falta1 BETWEEN 0 AND 36
        AND @falta2 BETWEEN 0 AND 36
        AND @falta3 BETWEEN 0 AND 36
        AND @falta4 BETWEEN 0 AND 36
    BEGIN
    UPDATE matriculas
    SET 
        falta1 = @falta1,
        falta2 = @falta2,
        falta3 = @falta3,
        falta4 = @falta4
        WHERE
            sigla_curso = @sigla_curso
            AND matricula_aluno = @matricula_aluno
            AND sigla_disciplina = @sigla_disciplina
            AND periodo_letivo = @periodo_letivo

    UPDATE matriculas
    SET total_faltas =
        falta1 + falta2 + falta3 + falta4
    WHERE
        sigla_curso = @sigla_curso
        AND matricula_aluno = @matricula_aluno
        AND sigla_disciplina = @sigla_disciplina
        AND periodo_letivo = @periodo_letivo
    
    UPDATE matriculas
    SET percentual_frequencia =
        CASE
        WHEN total_faltas IS NOT NULL 
        THEN (1 - (
    dbo.fn_calcular_media(
        CAST(@falta1 AS DECIMAL(5,2)),
        CAST(@falta2 AS DECIMAL(5,2)),
        CAST(@falta3 AS DECIMAL(5,2)),
        CAST(@falta4 AS DECIMAL(5,2))
    ) * 4.00 / 144.00
)) * 100.00
        ELSE NULL
        END
    WHERE
        sigla_curso = @sigla_curso
        AND matricula_aluno = @matricula_aluno
        AND sigla_disciplina = @sigla_disciplina
        AND periodo_letivo = @periodo_letivo
    END
    ELSE
    BEGIN
        PRINT 'falta(s) inválida(s)! a(s) falta(s) deve(m) ser entre 0 e 36'
        RETURN
    END
END