USE universidade
-- 1. select para verificar os cursos da universidade
SELECT sigla, nome FROM cursos

-- 2. cadastrar aluno
EXECUTE usp_matricular_aluno 'Tiago Graffunder', 'SISIF', '2025-1'

-- 3. verificar estado inicial do boletim
EXECUTE usp_boletim_aluno 'Tiago Graffunder', 'SISIF'

-- 4. vendo disciplinas do 1 semestre
SELECT d.nome AS disciplina, d.sigla AS sigla 
FROM disciplinas AS d 
JOIN matriculas AS m 
ON d.sigla = m.sigla_disciplina

-- 5. modificando matricula do 1 semestre
EXECUTE usp_atualiza_dados_matricula_aluno 'SISIF', 'ARQCOP', 1, '2025-1', 80, 82, 73, 91, 5, 3, 4, 1
EXECUTE usp_atualiza_dados_matricula_aluno 'SISIF', 'INTROC', 1, '2025-1', 70, 79, 82, 71, 4, 3, 4, 4
EXECUTE usp_atualiza_dados_matricula_aluno 'SISIF', 'LGPROG', 1, '2025-1', 60, 50, 30, 80, 1, 7, 10, 2
EXECUTE usp_atualiza_dados_matricula_aluno 'SISIF', 'PRGMOO', 1, '2025-1', 100, 50, 70, 95, 1, 0, 2, 0

-- 6. rodar boletim atualizado
EXECUTE usp_boletim_aluno 'Tiago Graffunder', 'SISIF'

-- 7. exame em matéria LGPROG | realizando exame
EXECUTE usp_exame 'SISIF', 'LGPROG', 1, '2025-1', 50.00

-- 8. rodar boletim atualizado
EXECUTE usp_boletim_aluno 'Tiago Graffunder', 'SISIF'

-- 9. rematricula, próximo semestre
EXECUTE usp_rematricula_aluno 'Tiago Graffunder', 'SISIF', '2025-2'

-- 10. rodar boletim atualizado
EXECUTE usp_boletim_aluno 'Tiago Graffunder', 'SISIF'