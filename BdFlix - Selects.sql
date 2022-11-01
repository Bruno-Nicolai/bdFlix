USE bd_flix_database;

-- a) pelo menos uma seleção de dados para exibir todos os registros de uma tabela usando como ordenação um atributo textual em ordem decrescente;
-- Selecionar o nome, email e cpf dos usuários ordenados por nome e email
SELECT
	u.nome_usuario
	, u.email
	, u.cpf
FROM
	usuario u
ORDER BY
	u.nome_usuario ASC
	, u.email ASC;

-- 
-- b) pelo menos uma seleção que apresente uma função de agregação (count, sum, max, min, avg);
-- Selecionar o nome da série e a quantidade total de episódios dela
SELECT
	o.titulo
	, count(*) AS quantidade_episodios
FROM
	serie s
JOIN obra o ON
	o.cod_obra = s.cod_obra
JOIN temporada t ON
	t.cod_serie = s.cod_serie
	AND t.cod_obra = s.cod_obra
JOIN episodio e ON
	e.cod_temporada = t.cod_temporada
GROUP BY
	s.cod_serie
	, s.cod_obra;

-- c) pelo menos uma seleção que apresenta dados de duas tabelas (pode escolher quais atributos de cada uma delas) com relacionamento 1 para N, ou seja, deve haver correspondência entre uma chave estrangeira de uma tabela e a chave primária de outra;
-- Selecionar cada episódio e a temporada referente
SELECT
	t.cod_temporada
	, e.titulo
	, DATE_FORMAT(e.dt_lancamento, '%d/%m/%Y') AS dt_lancamento
	, e.duracao
	, e.resumo
FROM
	temporada t
JOIN episodio e ON
	e.cod_temporada = t.cod_temporada
ORDER BY
	e.titulo ASC
	, e.dt_lancamento ASC;

-- d) pelo menos uma seleção que apresente o uso de operadores de BETWEEN ou IN nos critérios;
-- Selecionar todos os filmes lançados de 2018 a 2022
SELECT
	o.titulo
	, o.sinopse
	, f.duracao
	, f.nome_diretor
FROM
	filme f
JOIN obra o ON
	o.cod_obra = f.cod_obra
WHERE
	o.dt_lancamento BETWEEN '2018-01-01' AND '2022-12-31'
ORDER BY 
	o.dt_lancamento ASC;
	

-- e) pelo menos uma seleção que use cláusulas de junção (INNER JOIN ou LEFT JOIN ou RIGHT JOIN);
-- Selecionar o usuário e seu plano de assinatura
SELECT
	u.nome_usuario
	, pa.cod_plano
	, pa.valor AS valor_assinatura
FROM
	usuario u
LEFT JOIN plano_assinatura pa ON
	pa.cod_plano = u.cod_plano
ORDER BY
	u.nome_usuario ASC;

-- f) pelo menos uma View que contenha uma estrutura de seleção envolvendo no mínimo duas tabelas.
-- Criar view para retornar o título de uma obra e seus gêneros
CREATE OR REPLACE VIEW bd_flix_database.filme_com_genero_view AS 
SELECT
	o.titulo
	, g.nome
FROM
	obra o
JOIN obra_genero og ON
	og.cod_obra = o.cod_obra
JOIN genero g ON
	og.cod_genero = g.cod_genero
ORDER BY
	o.titulo ASC
	, g.nome ASC;

SELECT
	*
FROM
	filme_com_genero_view;




