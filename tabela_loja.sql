/* Criando a Base de dados (nesse caso é uma loja)*/

CREATE DATABASE loja;

/*Selecionando a base de dados*/

USE loja;

CREATE TABLE clientes(
	cod_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    cep INT(8)
    );
    
CREATE TABLE pedido(
	cod_cliente INT NOT NULL,
	num_pedido INT PRIMARY KEY AUTO_INCREMENT,
    data_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    item VARCHAR(100) NOT NULL,
    valor FLOAT NOT NULL,
    FOREIGN KEY(cod_cliente) REFERENCES clientes(cod_cliente)
    );
/*------------------- INSERÇÔES -------------------*/

/*Iserindo dados na tabela cliente*/    
INSERT INTO clientes (nome, endereco, cidade, cep)
VALUES ('Carol','rua ficticia 13','São Paulo', '12345678');
/*Inserindo dados na tabela de pedidos*/
INSERT INTO pedido (cod_cliente, item, valor)
VALUES ('3', 'celular', '1800')
