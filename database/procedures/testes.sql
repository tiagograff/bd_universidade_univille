USE universidade;
-- inserindo alunos e os matriculando automaticamente:
EXECUTE usp_matricular_aluno 'tiago graffunder', 'SISIF', '2025-1'

USE universidade
EXECUTE usp_atualiza_dados_matricula_aluno 
    @sigla_curso = 'SISIF',
    @sigla_disciplina = 'ARQCOP',
    @matricula_aluno = 1,
    @periodo_letivo = '2025-1',
    @nota1 = 85.00,
    @nota2 = 90.00,
    @nota3 = 95.00,
    @nota4 = 80.00,
    @falta1 = 0,
    @falta2 = 0,
    @falta3 = 0,
    @falta4 = 0

-- testes para verificar a população das tabelas
USE universidade
    SELECT * 
    FROM matriculas
    WHERE sigla_curso = 'SISIF'
    AND sigla_disciplina != 'ARQCOP'
    AND matricula_aluno = 1

USE universidade
EXECUTE usp_exame 
    @sigla_curso = 'SISIF',
    @sigla_disciplina = 'ARQCOP',
    @matricula_aluno = 1,
    @periodo_letivo = '2025-1',
    @nota_exame = 70.00

USE universidade
EXECUTE usp_rematricula_aluno 
    @sigla_curso = 'SISIF',
    @nome_aluno = 'tiago graffunder',
    @periodo_letivo = '2025-'

SELECT * FROM matriculas

USE universidade
EXECUTE usp_boletim_aluno
    @nome_aluno = 'tiago graffunder',
    @sigla_curso = 'SISIF'

USE universidade
EXECUTE usp_verificar_formatura
    @nome_aluno = 'tiago graffunder',
    @sigla_curso = 'SISIF'