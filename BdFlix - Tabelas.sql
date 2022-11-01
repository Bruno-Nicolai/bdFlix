CREATE DATABASE IF NOT EXISTS bd_flix_database;
ALTER DATABASE bd_flix_database CHARSET = UTF8 COLLATE = utf8_general_ci;

USE bd_flix_database;

CREATE TABLE IF NOT EXISTS obra (
	cod_obra INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
    titulo VARCHAR (100) NOT NULL,
    sinopse TEXT NOT NULL,
    dt_lancamento DATE NOT NULL,
    avaliacao FLOAT DEFAULT 0,
    
    PRIMARY KEY (cod_obra)
);

CREATE TABLE IF NOT EXISTS genero (
	cod_genero INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
    nome VARCHAR (32) NOT NULL,
    descricao TEXT NOT NULL,
    
    PRIMARY KEY (cod_genero)
);

CREATE TABLE IF NOT EXISTS obra_genero (
	cod_obra INTEGER NOT NULL,
    cod_genero INTEGER NOT NULL,
    
    FOREIGN KEY (cod_obra) REFERENCES obra (cod_obra),
    FOREIGN KEY (cod_genero) REFERENCES genero (cod_genero)
);

CREATE TABLE IF NOT EXISTS filme (
	cod_filme INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
    cod_obra INTEGER NOT NULL,
	duracao INTEGER NOT NULL,
    nome_diretor VARCHAR (100) NOT NULL,
    classificacao_indicativa VARCHAR(10) NOT NULL,
    nome_roteirista VARCHAR (100) NOT NULL, 
    
	PRIMARY KEY (cod_obra, cod_filme),
    FOREIGN KEY (cod_obra) REFERENCES obra (cod_obra)
);

CREATE TABLE IF NOT EXISTS serie (
	cod_serie INTEGER NOT NULL AUTO_INCREMENT UNIQUE, 
    cod_obra INTEGER NOT NULL,
    emissora VARCHAR (50) NOT NULL, 
    situacao_serie VARCHAR (32) NOT NULL DEFAULT 'EM_ANDAMENTO',
    nome_criador VARCHAR (100) NOT NULL,
    
    PRIMARY KEY (cod_obra, cod_serie),
    FOREIGN KEY (cod_obra) REFERENCES obra (cod_obra)
);

CREATE TABLE IF NOT EXISTS temporada (
	cod_temporada INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
    cod_obra INTEGER NOT NULL,
    cod_serie INTEGER NOT NULL,
    avaliacao FLOAT NOT NULL DEFAULT 0,
    dt_lancamento DATE NOT NULL,

    PRIMARY KEY (cod_temporada),
    FOREIGN KEY (cod_obra, cod_serie) REFERENCES serie (cod_obra, cod_serie)
);

CREATE TABLE IF NOT EXISTS episodio (
    cod_episodio INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
    cod_temporada INTEGER NOT NULL,
	titulo VARCHAR (100), -- Existem eps sem título
    resumo TEXT NOT NULL,
    duracao INTEGER NOT NULL,
    nome_diretor VARCHAR (100) NOT NULL,
    classificacao_indicativa VARCHAR (10) NOT NULL,
    nome_roteirista VARCHAR (100) NOT NULL,
    dt_lancamento DATE NOT NULL,

    PRIMARY KEY (cod_episodio),
    FOREIGN KEY (cod_temporada) REFERENCES temporada (cod_temporada)
);

CREATE TABLE IF NOT EXISTS plano_assinatura (
    cod_plano INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
    valor FLOAT NOT NULL,
    qtde_perfis INTEGER NOT NULL DEFAULT 1,
    qtde_telas INTEGER NOT NULL DEFAULT 1,

    PRIMARY KEY (cod_plano)
);

CREATE TABLE IF NOT EXISTS usuario (
	cpf VARCHAR (10) NOT NULL UNIQUE,
	cod_plano INTEGER,
	nome_usuario VARCHAR (100) NOT NULL,
	senha VARCHAR (32) NOT NULL,
    email VARCHAR (100) NOT NULL,
	numero_cartao VARCHAR (32) NOT NULL,
	cod_seguranca INTEGER NOT NULL,

	PRIMARY KEY (cpf),
	FOREIGN KEY (cod_plano) REFERENCES plano_assinatura (cod_plano)
);

CREATE TABLE IF NOT EXISTS lista (
	cpf VARCHAR (10) NOT NULL,
	cod_obra INTEGER NOT NULL,
	dt_inclusao DATE NOT NULL,

	FOREIGN KEY (cpf) REFERENCES usuario (cpf),
	FOREIGN KEY (cod_obra) REFERENCES obra (cod_obra)
);