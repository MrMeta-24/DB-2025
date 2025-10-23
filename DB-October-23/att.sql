--ATT 1
CREATE DATABASE CLIENTEDOSMUNICIPIOS

CREATE TABLE Municipio (
    ID_Municipio INT PRIMARY KEY,
    Nome_Municipio VARCHAR(100),
    UF_Municipio CHAR(2)
	);
	
INSERT INTO Municipio (ID_Municipio, Nome_Municipio, UF_Municipio)
	VALUES
	(1, 'Sao Paulo', 'SP'),
	(2, 'Rio de Janeiro', 'RJ'),
	(3, 'Belo Horizonte', 'MG'),
	(4, 'Curitiba', 'PR'),
	(5, 'Campinas', 'SP'),
	(6, 'Angra dos Reis', 'RJ'),
	(7, 'Niteroi', 'RJ'),
	(8, 'Salvador', 'BA'),
	(9, 'Feira de Santana', 'BA'),
	(10, 'Porto Seguro', 'BA'),
	(11, 'Guarulhos', 'SP'),
	(12, 'Cuiaba', 'MT'),
	(13, 'Barra do Garça', 'MT'),
	(14, 'Porto Alegre', 'RS'),
	(15, 'Uruguaiana', 'RS'),
	(16, 'Caxias do Sul', 'RS');

CREATE TABLE Clientes (
    ID_Cliente INT PRIMARY KEY,
    Nome_Cliente VARCHAR(100),
    ID_Municipio INT,
    FOREIGN KEY (ID_Municipio) REFERENCES Municipio(ID_Municipio)
	);

INSERT INTO Clientes (ID_Cliente, Nome_Cliente, ID_Municipio)
	VALUES
	(1, 'CLIENTE A', 3),
	(2, 'CLIENTE B', 2),
	(3, 'CLIENTE C', 2),
	(4, 'CLIENTE D', 1),
	(5, 'CLIENTE E', 4),
	(6, 'CLIENTE F', 5);

SELECT * FROM Municipio;
SELECT * FROM Clientes;

--ATT2
SELECT c.ID_Cliente,
       c.Nome_Cliente,
       m.Nome_Municipio,
       m.UF_Municipio
FROM Clientes c, Municipio m
WHERE c.ID_Municipio = m.ID_Municipio;

SELECT c.ID_Cliente,
       c.Nome_Cliente,
       m.Nome_Municipio,
       m.UF_Municipio
FROM Clientes c, Municipio m
WHERE c.ID_Municipio = m.ID_Municipio
AND m.UF_Municipio = 'SP';

--ATT3
SELECT 
    c.ID_Cliente,
    c.Nome_Cliente,
    m.Nome_Municipio,
    m.UF_Municipio
FROM Clientes c
LEFT OUTER JOIN Municipio m ON c.ID_Municipio = m.ID_Municipio;

SELECT 
    c.ID_Cliente,
    c.Nome_Cliente,
    m.Nome_Municipio,
    m.UF_Municipio
FROM Clientes c
RIGHT OUTER JOIN Municipio m ON c.ID_Municipio = m.ID_Municipio;

SELECT 
    c.ID_Cliente,
    c.Nome_Cliente,
    m.Nome_Municipio,
    m.UF_Municipio
FROM Municipio m
INNER JOIN Clientes c ON c.ID_Municipio = m.ID_Municipio;
