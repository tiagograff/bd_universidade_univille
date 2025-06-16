USE universidade;

GO

CREATE PROCEDURE usp_exame
    @sigla_curso VARCHAR(5),
    @sigla_disciplina VARCHAR(6),
    @matricula_aluno INT,
    @periodo_letivo VARCHAR(7),
    @nota_exame DECIMAL(5,2)

AS
BEGIN
    SET NOCOUNT ON

    IF @nota_exame BETWEEN 0.00 AND 100.00
    BEGIN
        UPDATE matriculas
        SET nota_exame = media + @nota_exame 
        WHERE
            sigla_curso = @sigla_curso
            AND matricula_aluno = @matricula_aluno
            AND sigla_disciplina = @sigla_disciplina
            AND periodo_letivo = @periodo_letivo
        
        UPDATE matriculas
        SET media_final = nota_exame / 2.00
        WHERE
            sigla_curso = @sigla_curso
            AND matricula_aluno = @matricula_aluno
            AND sigla_disciplina = @sigla_disciplina
            AND periodo_letivo = @periodo_letivo

        UPDATE matriculas
        SET resultado =
            CASE
                WHEN nota_exame >= 100.00 AND media_final >= 50.00
                    THEN 'Aprovado'
                WHEN nota_exame < 100.00 AND media_final < 50.00
                    THEN 'Reprovado'
            END

    END
    ELSE
    BEGIN
        PRINT 'nota do exame inválida! a nota deve ser entre 0.00 e 100.00'
    END
END