CREATE DATABASE Loja;

ALTER TABLE Produto
DROP COLUMN Descricao_Produto;
ALTER TABLE Produto
ADD COLUMN Descricao_Produto VARCHAR(50) NOT NULL;
ALTER TABLE Produto
ADD COLUMN Peso FLOAT;
ALTER TABLE Produto
ADD COLUMN Data_Validade DATE;


CREATE TABLE Produto (
    Codigo_Do_Produto INT PRIMARY KEY,
    Descricao_Produto VARCHAR(30) NOT NULL,
    Preco_produto FLOAT NOT NULL
);
SELECT * FROM Produto;


ALTER TABLE Nota_Fiscal
ADD COLUMN ICMS FLOAT;

CREATE TABLE Nota_Fiscal (
    numero_nf INT PRIMARY KEY,
    nota_nf DATE NOT NULL,
    valor_nf INT NOT NULL
);
SELECT * FROM Nota_Fiscal;


CREATE TABLE Itens (
    produto_codigo_produto INT,
    nota_fiscal_numero_nf INT,
    num_item INT NOT NULL,
    qde_item FLOAT NOT NULL,
    FOREIGN KEY (produto_codigo_produto) REFERENCES Produto(Codigo_Do_Produto),
    FOREIGN KEY (nota_fiscal_numero_nf) REFERENCES Nota_Fiscal(numero_nf)
);

DROP TABLE Itens;