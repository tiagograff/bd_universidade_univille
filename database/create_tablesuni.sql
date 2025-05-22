USE universidade;

-- criando tabelas e verificando suas existências
-- tabela alunos
IF NOT EXISTS (
    SELECT *
    FROM information_schema.tables 
    WHERE table_schema = 'dbo' AND table_name = 'alunos'  
)
    BEGIN
        CREATE TABLE dbo.alunos (
            matricula INT IDENTITY(1,1) PRIMARY KEY,
            nome VARCHAR(100) NOT NULL
        )
        PRINT 'tabela alunos criada com sucesso :)';
    END

-- tabela professores
IF NOT EXISTS (
    SELECT *
    FROM information_schema.tables
    WHERE table_schema = 'dbo' AND table_name = 'professores'
)
    BEGIN
        CREATE TABLE dbo.professores (
            id INT IDENTITY(1,1) PRIMARY KEY,
            nome VARCHAR(100) NOT NULL
        )
        PRINT 'tabela professores criada com sucesso :)';
    END

-- tabela cursos
IF NOT EXISTS (
    SELECT *
    FROM information_schema.tables
    WHERE table_schema = 'dbo' AND table_name = 'cursos'
)
    BEGIN
        CREATE TABLE dbo.cursos(
            sigla VARCHAR(5) PRIMARY KEY,
            nome VARCHAR(100) NOT NULL,
        )
        PRINT 'tabela cursos criada com sucesso :)';
    END

-- tabela disciplinas
IF NOT EXISTS (
    SELECT *
    FROM information_schema.tables
    WHERE table_schema = 'dbo' AND table_name = 'disciplinas'
)
    BEGIN
        CREATE TABLE dbo.disciplinas(
            sigla VARCHAR(6) PRIMARY KEY,
            nome VARCHAR(100) NOT NULL,
            carga_horaria INT NOT NULL,
            id_professor INT NOT NULL,
            FOREIGN KEY (id_professor) REFERENCES professores(id)
        )
        PRINT 'tabela disciplinas criada com sucesso :)';
    END

-- tabela grade curricular
IF NOT EXISTS (
    SELECT *
    FROM information_schema.tables
    WHERE table_schema = 'dbo' AND table_name = 'grade_curricular'
)
    BEGIN
        CREATE TABLE dbo.grade_curricular(
            sigla_curso VARCHAR(5) NOT NULL,
            sigla_disciplina VARCHAR(6) NOT NULL,
            PRIMARY KEY (sigla_curso, sigla_disciplina),
            FOREIGN KEY (sigla_curso) REFERENCES cursos(sigla),
            FOREIGN KEY (sigla_disciplina) REFERENCES disciplinas(sigla)
        )
        PRINT 'tabela grade curricular criada com sucesso :)';
    END

-- tabela matrículas
IF NOT EXISTS (
    SELECT *
    FROM information_schema.tables
    WHERE table_schema = 'dbo' AND table_name = 'matriculas'
)
    BEGIN
        CREATE TABLE dbo.matriculas(
            sigla_curso VARCHAR(5) NOT NULL,
            sigla_disciplina VARCHAR(6) NOT NULL,
            matricula_aluno INT NOT NULL,
            id_professor INT NOT NULL,
            periodo_letivo INT NOT NULL,
            nota1 DECIMAL(5,2) DEFAULT 0.00,
            nota2 DECIMAL(5,2) DEFAULT 0.00,
            nota3 DECIMAL(5,2) DEFAULT 0.00,
            nota4 DECIMAL(5,2) DEFAULT 0.00,
            total_pontos DECIMAL (5,2) DEFAULT 0.00,
            media DECIMAL (5,2),
            falta1 INT NOT NULL DEFAULT 0,
            falta2 INT NOT NULL DEFAULT 0,
            falta3 INT NOT NULL DEFAULT 0,
            falta4 INT NOT NULL DEFAULT 0,
            total_faltas INT,
            percentual_faltas DECIMAL(5,2) DEFAULT 0.00,
            nota_exame DECIMAL(5,2) DEFAULT 0.00,
            media_final DECIMAL (5,2) DEFAULT 0.00,
            resultado VARCHAR(10) CHECK(resultado IN ('Aguardando','Aprovado','Exame', 'Reprovado')) DEFAULT 'Aguardando',
            PRIMARY KEY (sigla_curso, sigla_disciplina, matricula_aluno, id_professor, periodo_letivo),
            FOREIGN KEY (sigla_curso) REFERENCES cursos(sigla),
            FOREIGN KEY (sigla_disciplina) REFERENCES disciplinas(sigla),
            FOREIGN KEY (matricula_aluno) REFERENCES alunos(matricula),
            FOREIGN KEY (id_professor) REFERENCES professores(id)
        )
        PRINT 'tabela matriculas criada com sucesso :)';
    END