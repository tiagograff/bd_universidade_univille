# banco de dados universidade
descrição: trabalho/exercício de procedure, criando um banco de dados referente a uma universidade.
## enunciado:
neste exercício será **criado um banco de dados** para armazenar os dados dos alunos de uma **universidade**. além de **desenhar o diagrama**, **criar o banco de dados** e seus **objetos**, é necessário criar os **scripts de população básica**. em seguida, a criação das **procedures que irão executar as operações de manipulação das notas e faltas**.

a solução deverá possibilitar:

1. matricular o aluno automaticamente nas disciplinas de acordo com o curso escolhido e baseado nos dados cadastrados na tabela MATERIAS.
2. processar as notas dos alunos ao final do 4º Bimestre, verificando ser o aluno foi aprovado, reprovado ou ficou em exame.
3. caso o aluno fique em exame, deverá ser possível lançar a nota do exame e reprocessar o resultado desse aluno.

## execução:

### rodar arquivos em ordem:
01. create_dbuni
02. create_tablesuni
03. insert_dbuni
04. fnc_pegar_matricula
05. fnc_media
06. usp_matriculas
07. usp_frequencia
08. usp_notas_regulares
09. usp_atualiza_matriculas
10. usp_exame
11. usp_rematricula
12. usp_boletim
13. usp_formacao
14. testes
15. utilização

## ideias para melhorar e objetivos não alcançados:

- caso o aluno fique em exame, não aparece sua média no boletim;
- o cálculo da média com exame, não é proporcional a média regular, gerando um boletim com informações não consistentes e claras;
- o próximo semestre é gerado e matrículado, mas não é exibido no boletim.
