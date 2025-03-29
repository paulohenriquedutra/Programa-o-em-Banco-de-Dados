/*Criando o Banco de Dados*/
CREATE DATABASE empresa;

/*Selecionando o Banco de Dados*/
USE empresa;

/*------------------------------CRIAÇÃO DAS TABELAS------------------------------*/

/*Tabela de departamentos*/
CREATE TABLE departamento(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
    );
    
/*Tabela de Cargos*/
CREATE TABLE cargos(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    nivel VARCHAR(50) NOT NULL
	);

/*Tabela de Funcionários*/
CREATE TABLE funcionarios(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    salario DECIMAL (10,2) NOT NULL,
    departamento_id  INT NOT NULL,
    cargo_id INT NOT NULL,
    FOREIGN KEY (departamento_id) REFERENCES departamento(id), 
    FOREIGN KEY (cargo_id) REFERENCES cargos(id) 
	);

/*------------------------------INSERÇÔES------------------------------*/

/*Inserindo na tabela Departamentos*/
INSERT INTO departamento (nome)
VALUES ('TI'), ('RH'), ('FINACEIRO'), ('MARKETING'), ('VENDAS');

/*Inserindo na tabela Cargos*/
INSERT INTO cargos (nome, nivel)
VALUES ('ANALISTA', 'PLENO'), ('GERENTE', 'SENIOR'), ('ASSISTENTE', 'JUNIOR'), ('COORDENADOR', 'SENIOR'), ('DESENVOLVEDOR', 'PLENO');

/*Inserindo na tabela Funcionários*/
INSERT INTO funcionarios (nome, data_nascimento, salario, departamento_id, cargo_id)
VALUES 
('Ana Silva', '1985-06-15', 5500.00, 1, 5), 
('Carlos Santos', '1990-03-22', 4800.00, 2, 1), 
('Bruna Costa', '1987-12-10', 6000.00, 3, 2), 
('Daniel Oliveira', '1992-08-05', 5200.00, 1, 5), 
('Fernanda Lima', '1995-09-30', 4500.00, 2, 3), 
('Gustavo Souza', '1980-01-25', 7000.00, 3, 2), 
('Helena Martins', '1983-11-17', 5300.00, 1, 4), 
('Igor Ferreira', '1991-07-08', 4900.00, 2, 1), 
('Juliana Rocha', '1989-04-19', 5600.00, 3, 2), 
('Lucas Mendes', '1993-06-23', 5100.00, 1, 5);

/*1) Encontrar o maior salário*/
SELECT MAX(salario) as Maior_Salario FROM funcionarios ;
/*2) Encontrar o menor salário*/
SELECT MIN(salario) as Menor_Salario FROM funcionarios;
/*3) Encontrar a Quantidade de funcionários*/
SELECT COUNT(id) as Quantidade_Funcionarios FROM funcionarios;
/*4)Filtrar funcionários nascidos apartir de 1990 CORRIGIR*/
SELECT nome, data_nascimento FROM funcionarios
WHERE YEAR(data_nascimento) >= 1990;
/*5)Encontre a media salarial*/
SELECT ROUND(AVG(salario),2) as Media FROM funcionarios;
/*6)Extração dos primeiros caracteres de um nome*/
SELECT SUBSTRING('Ricardo',2,4);
/*7) Quantidade de Funcionários por departamento*/
SELECT COUNT(a.id) as Quantidade_Funcionários, b.nome as Departamento FROM funcionarios a
JOIN departamento b ON a.departamento_id = b.id
GROUP BY b.nome;
/*8)Quantidades de funcionários nos cargos*/
SELECT COUNT(a.id) as Quantidade_Funcionários, b.nome as Cargos FROM funcionarios a
JOIN cargos b ON a.cargo_id = b.id
GROUP BY b.nome;