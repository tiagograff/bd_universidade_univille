USE universidade

GO

CREATE PROCEDURE usp_atualiza_dados_matricula_aluno
    @sigla_curso VARCHAR(5),
    @sigla_disciplina VARCHAR(6),
    @matricula_aluno INT,
    @periodo_letivo VARCHAR(7),
    @nota1 DECIMAL(5,2),
    @nota2 DECIMAL(5,2),
    @nota3 DECIMAL(5,2),
    @nota4 DECIMAL(5,2),
    @falta1 INT,
    @falta2 INT,
    @falta3 INT,
    @falta4 INT

AS 
BEGIN
    SET NOCOUNT ON

    EXECUTE usp_processamento_frequencia
        @sigla_curso = @sigla_curso,
        @sigla_disciplina = @sigla_disciplina,
        @matricula_aluno = @matricula_aluno,
        @periodo_letivo = @periodo_letivo,
        @falta1 = @falta1,
        @falta2 = @falta2,
        @falta3 = @falta3,
        @falta4 = @falta4

    EXECUTE usp_processamento_notas_regulares
        @sigla_curso = @sigla_curso,
        @sigla_disciplina = @sigla_disciplina,
        @matricula_aluno = @matricula_aluno,
        @periodo_letivo = @periodo_letivo,
        @nota1 = @nota1,
        @nota2 = @nota2,
        @nota3 = @nota3,
        @nota4 = @nota4

    UPDATE matriculas
    SET resultado =
        CASE 
            WHEN percentual_frequencia < 75.00 THEN 'Reprovado'
            WHEN media < 30.00 THEN 'Reprovado'
            WHEN media >= 70.00 THEN 'Aprovado'
            WHEN media >= 30.00 AND media < 70.00 THEN 'Exame'
            ELSE 'Aguardando'
        END
    WHERE
        resultado = 'Aguardando'
        AND sigla_curso = @sigla_curso
        AND matricula_aluno = @matricula_aluno
        AND sigla_disciplina = @sigla_disciplina
        AND periodo_letivo = @periodo_letivo
END