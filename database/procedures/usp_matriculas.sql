USE universidade

GO

CREATE PROCEDURE usp_matricular_aluno
     @nome_aluno VARCHAR(100),
     @sigla_curso VARCHAR(5),
     @periodo_letivo VARCHAR(7)
AS
BEGIN
     SET NOCOUNT ON -- evita mensagens de linhas que foram afetadas
   
     DECLARE @matricula_nova INT
     DECLARE @semestre_atual INT

     INSERT INTO alunos (nome)
     VALUES(@nome_aluno)

     SET @matricula_nova = SCOPE_IDENTITY() -- pega o último valor da coluna identity do escopo atual
     SET @semestre_atual = (SELECT semestre_atual FROM alunos WHERE matricula = @matricula_nova)
     
     INSERT INTO matriculas (
          sigla_curso,
          sigla_disciplina,
          matricula_aluno,
          periodo_letivo
     )

     SELECT 
          grade.sigla_curso,
          grade.sigla_disciplina,
          @matricula_nova,
          @periodo_letivo
     FROM grades_curriculares AS grade 
     WHERE grade.sigla_curso = @sigla_curso
     AND grade.semestre = @semestre_atual

     -- verificação da realização da matrícula
     IF EXISTS (
          SELECT 1 FROM alunos WHERE matricula = @matricula_nova
     )
          BEGIN
               PRINT 'matricula realizada com sucesso!'
          END
     ELSE
          BEGIN 
               PRINT 'erro ao realizar a matricula!'
          END 

END