-- populando tabela de cursos
USE universidade;
INSERT INTO cursos (sigla, nome)
VALUES
    ('ENGSF', 'Engenharia de Software'),
    ('SISIF', 'Sistemas de Informação')

-- populando tabela de professores
INSERT INTO professores (nome)
VALUES
    ('Ana Costa'),
    ('Bruno Lima'),
    ('Camila Torres'),
    ('Daniel Rocha'),
    ('Elisa Nogueira'),
    ('Fernando Almeida'),
    ('Gabriela Sousa')

-- populando tabela disciplinas
INSERT INTO disciplinas (sigla, nome, carga_horaria, id_professor)
VALUES
    ('BNCDDS', 'Banco de Dados', 144, 2),
    ('PRGMOO', 'Programação Orientada a Objetos', 144, 1),
    ('DESWEB', 'Desenvolvimento Web', 144, 6),
    ('ENGREQ', 'Engenharia de Requisitos', 144, 7),
    ('INTROC', 'Introdução à Computação', 144, 1),
    ('ARQCOP', 'Arquitetura de Computadores', 144, 2),
    ('SISTOP', 'Sistemas Operacionais', 144, 3),
    ('REDECP', 'Redes de Computadores', 144, 4),
    ('ANDADO', 'Análise de Dados', 144, 5),
    ('ANSIST', 'Análise de Sistemas', 144, 6),
    ('DSNIHC', 'Design de Interface Humano-Computador', 144, 7),
    ('INARTI', 'Inteligência Artificial', 144, 3),
    ('LGPROG', 'Lógica de Programação', 144, 1),
    ('ALGEDD', 'Algoritmos e Estruturas de Dados', 144, 2),
    ('PDPROJ', 'Padrões de Projeto', 144, 4),
    ('QUASFT', 'Qualidade de Software', 144, 5),
    ('DEVOPS', 'DevOps', 144, 6),
    ('TESSFT', 'Teste de Software', 144, 7),
    ('MODSFT', 'Modelagem de Software', 144, 4),
    ('ARQSFT', 'Arquitetura de Software', 144, 3)

-- populando tabela de grades curriculares (Sistemas de Informação)
INSERT INTO grades_curriculares (sigla_curso, sigla_disciplina, semestre) VALUES
-- 1 semestre
('SISIF', 'INTROC', 1),
('SISIF', 'ARQCOP', 1),
('SISIF', 'PRGMOO', 1),
('SISIF', 'LGPROG', 1), 
-- 2 semestre
('SISIF', 'SISTOP', 2),
('SISIF', 'REDECP', 2),
('SISIF', 'ENGREQ', 2),
('SISIF', 'ALGEDD', 2), 
-- 3 semestre
('SISIF', 'ANSIST', 3),
('SISIF', 'DSNIHC', 3),
('SISIF', 'BNCDDS', 3),
('SISIF', 'MODSFT', 3), 
-- 4 semestre
('SISIF', 'ANDADO', 4),
('SISIF', 'INARTI', 4),
('SISIF', 'DESWEB', 4),
('SISIF', 'QUASFT', 4);
-- populando tabela de grades curriculares (Engenharia de Software)
INSERT INTO grades_curriculares (sigla_curso, sigla_disciplina, semestre) VALUES
-- 1 semestre
('ENGSF', 'LGPROG', 1),
('ENGSF', 'ALGEDD', 1),
('ENGSF', 'INTROC', 1),
('ENGSF', 'BNCDDS', 1), 

-- 2 semestre
('ENGSF', 'MODSFT', 2),
('ENGSF', 'ARQSFT', 2),
('ENGSF', 'PRGMOO', 2), 
('ENGSF', 'ARQCOP', 2), 

-- 3 semestre
('ENGSF', 'PDPROJ', 3),
('ENGSF', 'QUASFT', 3),
('ENGSF', 'ENGREQ', 3),
('ENGSF', 'SISTOP', 3), 

-- 4 semestre
('ENGSF', 'DEVOPS', 4),
('ENGSF', 'TESSFT', 4),
('ENGSF', 'DESWEB', 4),
('ENGSF', 'ANDADO', 4);