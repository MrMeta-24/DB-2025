-- questão 1
CREATE DATABASE loja;

CREATE TABLE produto (
	codigo INT primary key,
	nome VARCHAR(50),
	categoria VARCHAR(30),
	preco DECIMAL(10,2),
	estoque INT
);

INSERT INTO produto (codigo,nome,categoria,preco,estoque)
	VALUES 
	(1,'notebook dell','informatica',3500,12),
	(2,'teclado mecanico','informatica',250,40),
	(3,'cadeira gamer','moveis',1200,8),
	(4,'mesa escritorio','moveis',800,15),
	(5,'mouse optico','informatica',100,60),
	(6,'impressora hp','periferico',900,5),
	(7,'headset jbl','audio',600,25);

SELECT * FROM produto;

--questão 2
SELECT * FROM produto WHERE categoria = 'informatica';

--questão 3
SELECT * FROM produto WHERE categoria = 'moveis' ORDER BY preco ASC;

--questão 4
SELECT AVG(preco) AS media_preco FROM produto;

--questão 5
SELECT MAX(preco) FROM produto;

--questão 6
SELECT COUNT(*) FROM produto WHERE estoque < 10;

--questão 7
SELECT nome,codigo FROM produto WHERE nome = 'headset jbl';

--questão 8
SELECT * FROM Produto WHERE estoque = (SELECT MIN(estoque) FROM produto);

--questão 9
SELECT * FROM produto WHERE preco BETWEEN 500 and 2000; 

--questão 10
SELECT estoque FROM produto WHERE categoria = 'informatica';