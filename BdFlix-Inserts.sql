USE bd_flix_database;

INSERT INTO obra (titulo, sinopse, dt_lancamento, avaliacao)
VALUES
('Morbius', 'O bioquímico Michael Morbius tenta curar-se de uma doença rara no sangue mas, sem perceber, ele fica infectado com uma forma de vampirismo.', '2022-03-31', 0),
('Scott Pilgrim Contra o Mundo', 'Guitarrista de uma banda de rock do colégio, o jovem Scott Pilgrim nunca teve problemas para conseguir namoradas. O problema sempre foi se livrar delas. Mas com Ramona Flowers é diferente, pois ele se apaixona perdidamente por ela e não será nada fácil conquistar seu amor. Ela tem o maior de todos os problemas: um exército de ex-namorados que não medem esforços para eliminar Scott da lista de interessados.', '2010-11-05', 0),
('The Batman', 'Após dois anos espreitando as ruas como Batman, Bruce Wayne se encontra nas profundezas mais sombrias de Gotham City. Com poucos aliados confiáveis, o vigilante solitário se estabelece como a personificação da vingança para a população.', '2022-03-03', 0),
('Stranger Things', 'Em 6 de Novembro, 1983 na pequena cidade de Hawkins, Indiana, o garoto de 12 anos, Will Byers desaparece misteriosamente. A mãe de Will, Joyce, torna-se frenética e tenta encontrar Will enquanto o chefe de polícia Jim Hopper começa a investigar, e assim fazem também os amigos de Will: Dustin, Mike e Lucas.', '2016-07-15', 0),
('Peaky Blinders', 'Situado em 1919, em Birmingham, Inglaterra, o ambicioso líder de gangues dos Peaky Blinders, Thomas Shelby descobre que sua equipe está sob o escrutínio do inspetor-chefe de Belfast Chester Campbell, que foi enviado para limpar a cidade do crime.', '2013-09-12', 0),
('Para todos os garotos que já amei', 'Lara Jean Song Covey escreve cartas de amor secretas para todos os seus antigos paqueras. Um dia, as cartas são misteriosamente enviadas para os destinatários, virando sua vida de cabeça para baixo.', '2018-08-17', 0);

INSERT INTO genero (nome, descricao)
VALUES
('Ação', 'Os filmes de ação são aqueles que geralmente contam histórias envolvendo um protagonista contra um antagonista, que resolvem suas disputas com o uso de força. Geralmente, são superproduções que recorrem frequentemente ao uso de dubles e efeitos especiais. Contam com lutas, guerras e confrontos.'),
('Drama', 'Os filmes dramáticos procuram uma resposta emotiva no público; para o efeito, as cenas são comoventes, com personagens que sofrem grandes problemas ou que vivem conflitos passionais. Regra geral, o drama centra-se no amor e nas suas possíveis consequências trágicas.'),
('Terror', 'Terror ou horror é um gênero literário, cinematográfico ou musical, que está sempre muito ligado à fantasia e à ficção especulativa, e é criado com intuito de causar medo, aterrorizar.'),
('Comédia Romântica', 'Com uma junção entre dois gêneros cinematográficos, essa opção traz histórias que abordam romances de uma forma bem divertida para você dar boas risadas ao longo do filme.');

INSERT INTO obra_genero (cod_obra, cod_genero)
VALUES
(1, 1),
(2, 1),
(2, 4),
(3, 1),
(4, 2),
(4, 3),
(5, 2),
(6, 4);

INSERT INTO filme (cod_obra, duracao, nome_diretor, classificacao_indicativa, nome_roteirista)
VALUES
(1, 108, 'Daniel Espinosa', '+14', 'Burk Sharpless'),
(2, 112, 'Edgar Wright', '+12', 'Edgar Wright e Bryan Lee O Malley'),
(2, 112, 'Edgar Wright', '+12', 'Edgar Wright e Bryan Lee O Malley'),
(3, 176, 'Matt Reeves', 'Livre', 'Matt Reeves e Peter Craig'),
(6, 99, 'Susan Johnson', '+14', 'Sofia Alvarez e Jenny Han');

INSERT INTO serie (cod_obra, emissora, situacao_serie, nome_criador)
VALUES
(4, 'Netflix', 'EM_ANDAMENTO', 'Matt Duffer e Ross Duffer'),
(5, 'Netflix', 'CANCELADA', 'Steven Knight');

INSERT INTO temporada (cod_serie, cod_obra, dt_lancamento, avaliacao)
VALUES
(1, 4, '2016-07-15', 4.2),
(2, 5, '2013-09-12', 4.7);

INSERT INTO episodio (cod_temporada, titulo, resumo, duracao, nome_diretor, classificacao_indicativa, nome_roteirista, dt_lancamento)
VALUES
(1, 'Capítulo Um: O Desaparecimento de Will Byers', 'No caminho de volta para casa, o jovem Will vê algo terrível. Não muito longe dali, um segredo sinistro se esconde dentro de um laboratório do governo.', 48, 'Matt Duffer e Ross Duffer', '+14', 'Matt Duffer e Ross Duffer', '2016-07-15'),
(1, 'Capítulo Dois: A Estranha da Maple Street', 'Lucas, Mike e Dustin tentam conversar com a menina que encontraram no bosque. Hopper tem perguntas para uma Joyce extremamente ansiosa.', 55, 'Matt Duffer e Ross Duffer', '+14', 'Matt Duffer e Ross Duffer', '2016-07-15'),
(2, NULL, 'Tommy é um veterano da Primeira Guerra e o líder dos Shelby, uma família de gangsters cujo objetivo é dominar a cidade inglesa de Birmingham que sofre com o pós-guerra e uma grave crise econômica.', 51, 'Otto Bathurst', '+16', 'Steven Knight', '2013-09-12'),
(2, NULL, 'A gangue de Thomas se envolve em uma briga com os Lees, uma violenta família que fica enfurecida com o ataque. Ada descobre que está grávida de Freddie, mas não sabe o que fazer em relação a isso.', 58, 'Otto Bathurst', '+16', 'Steven Knight', '2013-09-19');

INSERT INTO plano_assinatura (valor, qtde_perfis, qtde_telas)
VALUES
(25.90, 1, 1),
(32.90, 1, 2),
(35.90, 2, 2),
(39.90, 3, 2),
(50.95, 4, 4),
(55.90, 9, 4),
(59.90, 15, 15);

INSERT INTO usuario (cpf, email, nome_usuario, senha, numero_cartao, cod_seguranca)
VALUES
('2091421031', 'jaq.euline@gmail.com', 'Jaqueline', 'sdasd34n12da', '1478912345652736', 303),
('3103190214', 'livi_@outlook.com.br', 'Lívia', 'ff1ds56fsdf', '5693671223447815', 444),
('9011032143', 'leozin25@gmail.com', 'Leonardo', 'yh,mnrfklg', '2357849215637146', 212),
('1214109203', 'fefemartins@gmail.com.br', 'Felipe', 'dfdhgf35t43', '6752314912857634', 536),
('4213120910', 'brenoot@email.com', 'Breno', 'd21asds4dfg86', '452341576891326', 851);

INSERT INTO lista (cod_obra, cpf, dt_inclusao)
VALUES
(1, '2091421031', '2022-03-21'),
(2, '2091421031', '2022-05-12'),
(2, '9011032143', '2022-06-05'),
(3, '4213120910', '2022-06-14');

UPDATE usuario
SET cod_plano = 1
WHERE cpf = '2091421031';

UPDATE usuario
SET cod_plano = 2
WHERE cpf = '9011032143';

UPDATE usuario
SET cod_plano = 3
WHERE cpf = '4213120910';



