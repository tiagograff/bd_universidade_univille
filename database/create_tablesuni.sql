USE universidade;

-- criando tabelas e verificando suas existências
-- tabela cursos
IF NOT EXISTS (
    SELECT *
    FROM information_schema.tables
    WHERE table_schema = 'dbo' AND table_name = 'cursos'
)
    BEGIN
        CREATE TABLE dbo.cursos(
            sigla VARCHAR(5) PRIMARY KEY NOT NULL,
            nome VARCHAR(100) NOT NULL,
        )
        PRINT 'tabela cursos criada com sucesso :)';
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

-- tabela alunos
IF NOT EXISTS (
    SELECT *
    FROM information_schema.tables 
    WHERE table_schema = 'dbo' AND table_name = 'alunos'  
)
    BEGIN
        CREATE TABLE dbo.alunos (
            matricula INT IDENTITY(1,1) PRIMARY KEY,
            nome VARCHAR(100) NOT NULL,
            semestre_atual INT DEFAULT 1
        )
        PRINT 'tabela alunos criada com sucesso :)';
    END

-- tabela disciplinas
IF NOT EXISTS (
    SELECT *
    FROM information_schema.tables
    WHERE table_schema = 'dbo' AND table_name = 'disciplinas'
)
    BEGIN
        CREATE TABLE dbo.disciplinas(
            sigla VARCHAR(6) PRIMARY KEY NOT NULL,
            nome VARCHAR(100) NOT NULL,
            carga_horaria INT NOT NULL,
            id_professor INT NOT NULL,
            FOREIGN KEY (id_professor) REFERENCES professores(id)
        )
        PRINT 'tabela disciplinas criada com sucesso :)';
    END

-- tabela grades curriculares
IF NOT EXISTS (
    SELECT *
    FROM information_schema.tables
    WHERE table_schema = 'dbo' AND table_name = 'grades_curriculares'
)
    BEGIN
        CREATE TABLE dbo.grades_curriculares(
            sigla_curso VARCHAR(5) NOT NULL,
            sigla_disciplina VARCHAR(6) NOT NULL,
            semestre INT NOT NULL,
            PRIMARY KEY (sigla_curso, sigla_disciplina),
            FOREIGN KEY (sigla_curso) REFERENCES cursos(sigla),
            FOREIGN KEY (sigla_disciplina) REFERENCES disciplinas(sigla)
        )
        PRINT 'tabela grade curricular criada com sucesso :)';
    END

-- tabela disciplinas ofertadas
IF NOT EXISTS (
    SELECT *
    FROM information_schema.tables
    WHERE table_schema = 'dbo' AND table_name = 'disciplinas_ofertadas'
)
    BEGIN
        CREATE TABLE dbo.disciplinas_ofertadas(
            sigla_disciplina VARCHAR(6) NOT NULL,
            semestre VARCHAR(7) NOT NULL, --EX: 2025-1
            status VARCHAR(10) CHECK(status IN ('Aberta', 'Fechada', 'Cancelada')) DEFAULT 'Aberta',
            id_professor INT NOT NULL,
            PRIMARY KEY (sigla_disciplina, semestre),
            FOREIGN KEY (sigla_disciplina) REFERENCES disciplinas(sigla),
            FOREIGN KEY (id_professor) REFERENCES professores(id)
        )
        PRINT 'tabela ofertas disciplinas criada com sucesso :)';
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
            periodo_letivo VARCHAR(7) NOT NULL, --EX: 2025-1
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
            percentual_frequencia DECIMAL(5,2) DEFAULT 0.00,
            nota_exame INT DEFAULT NULL,
            media_final DECIMAL (5,2) DEFAULT 0.00,
            resultado VARCHAR(10) CHECK(resultado IN ('Aguardando','Aprovado','Exame', 'Reprovado')) DEFAULT 'Aguardando',
            PRIMARY KEY (sigla_curso, sigla_disciplina, matricula_aluno, periodo_letivo),
            FOREIGN KEY (sigla_curso) REFERENCES cursos(sigla),
            FOREIGN KEY (sigla_disciplina) REFERENCES disciplinas(sigla),
            FOREIGN KEY (matricula_aluno) REFERENCES alunos(matricula)
        )
        PRINT 'tabela matriculas criada com sucesso :)';
    END