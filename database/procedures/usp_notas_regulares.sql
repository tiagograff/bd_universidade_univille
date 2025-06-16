USE universidade;

GO

CREATE PROCEDURE usp_processamento_notas_regulares
    @sigla_curso VARCHAR(5),
    @sigla_disciplina VARCHAR(6),
    @matricula_aluno INT,
    @periodo_letivo VARCHAR(7),
    @nota1 DECIMAL(5,2),
    @nota2 DECIMAL(5,2),
    @nota3 DECIMAL(5,2),
    @nota4 DECIMAL(5,2)
AS
BEGIN 
    SET NOCOUNT ON

    IF @nota1 BETWEEN 0.00 AND 100.00
        AND @nota2 BETWEEN 0.00 AND 100.00
        AND @nota3 BETWEEN 0.00 AND 100.00
        AND @nota4 BETWEEN 0.00 AND 100.00
    BEGIN
        UPDATE matriculas
        SET
            nota1 = @nota1,
            nota2 = @nota2,
            nota3 = @nota3,
            nota4 = @nota4
        WHERE
            sigla_curso = @sigla_curso
            AND matricula_aluno = @matricula_aluno
            AND sigla_disciplina = @sigla_disciplina
            AND periodo_letivo = @periodo_letivo


        UPDATE matriculas
        SET total_pontos =
            nota1 + nota2 + nota3 + nota4
        WHERE
            sigla_curso = @sigla_curso
            AND matricula_aluno = @matricula_aluno
            AND sigla_disciplina = @sigla_disciplina
            AND periodo_letivo = @periodo_letivo
        
        UPDATE matriculas
        SET media =
            CASE 
                WHEN total_pontos IS NOT NULL 
                THEN dbo.fn_calcular_media(@nota1, @nota2, @nota3, @nota4)
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
        PRINT 'nota(s) inválida(s)! a(s) nota(s) deve(m) ser entre 0.00 e 100.00'
        RETURN
    END
END