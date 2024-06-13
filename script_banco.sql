CREATE DATABASE delphi;
USE delphi;

CREATE TABLE Usuario (
    codigo_usuario INT AUTO_INCREMENT PRIMARY KEY,
    login VARCHAR(50) NOT NULL UNIQUE,
    nome_completo VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    indicador_administrador BOOLEAN NOT NULL,
    indicador_usuario_ativo BOOLEAN DEFAULT FALSE
);

CREATE TABLE Estado (
    codigo_estado INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    sigla VARCHAR(2) NOT NULL UNIQUE,
    codigo_usuario INT,
    FOREIGN KEY (codigo_usuario) REFERENCES Usuario(codigo_usuario)
);

CREATE TABLE Cidade (
    codigo_cidade INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    populacao INT NOT NULL,
    codigo_estado INT,
    codigo_usuario INT,
    FOREIGN KEY (codigo_estado) REFERENCES Estado(codigo_estado),
    FOREIGN KEY (codigo_usuario) REFERENCES Usuario(codigo_usuario)
);

CREATE TABLE Instituicao (
    codigo_instituicao INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cnpj VARCHAR(14) NOT NULL UNIQUE,
    responsavel VARCHAR(100) NOT NULL,
    codigo_cidade INT,
    codigo_usuario INT,
    FOREIGN KEY (codigo_cidade) REFERENCES Cidade(codigo_cidade),
    FOREIGN KEY (codigo_usuario) REFERENCES Usuario(codigo_usuario)
);

CREATE TABLE TipoItem (
    codigo_tipo_item INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL,
    codigo_usuario INT,
    FOREIGN KEY (codigo_usuario) REFERENCES Usuario(codigo_usuario)
);

CREATE TABLE Item (
    codigo_item INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL,
    unidade VARCHAR(20) NOT NULL,
    codigo_tipo_item INT,
    data_validade DATE NOT NULL,
    codigo_usuario INT,
    FOREIGN KEY (codigo_tipo_item) REFERENCES TipoItem(codigo_tipo_item),
    FOREIGN KEY (codigo_usuario) REFERENCES Usuario(codigo_usuario)
);

CREATE TABLE Doacao (
    codigo_doacao INT AUTO_INCREMENT PRIMARY KEY,
    data DATE NOT NULL,
    codigo_instituicao INT,
    codigo_usuario INT,
    FOREIGN KEY (codigo_instituicao) REFERENCES Instituicao(codigo_instituicao),
    FOREIGN KEY (codigo_usuario) REFERENCES Usuario(codigo_usuario)
);

CREATE TABLE ItemDoacao (
    codigo_doacao INT,
    codigo_item INT,
    quantidade INT NOT NULL,
    peso DECIMAL(10, 2) NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (codigo_doacao, codigo_item),
    FOREIGN KEY (codigo_doacao) REFERENCES Doacao(codigo_doacao),
    FOREIGN KEY (codigo_item) REFERENCES Item(codigo_item)
);
