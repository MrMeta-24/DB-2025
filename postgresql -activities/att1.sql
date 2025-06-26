CREATE TABLE estado (
    ID int primary key,
    nome VARCHAR(50),
    UF CHAR(2)
);


CREATE TABLE municipio(

    ID int primary key,
    estado_ID INT,
    Nome VARCHAR(80),
    codIBGE INT,
    CONSTRAINT fk_Municipio_Estado1_idx´ FOREIGN KEY (estado_ID) REFERENCES estado(ID)
);


CREATE TABLE cliente(

    ID int primary key,
    nome VARCHAR(80),
    cpf CHAR(11),
    celular CHAR(11),
    endLogradouro VARCHAR(100),
    endNumero VARCHAR(10),
    endMunicipio int,
    endCEP CHAR(8),
    municipio_ID int,
    CONSTRAINT fk_Cliente_Municipio1_idx´ FOREIGN KEY (municipio_ID) REFERENCES municipio(ID)
);

CREATE TYPE mood AS ENUM ('1', '2', '3');

CREATE TABLE contaAReceber(

    ID int primary key,
    cliente_ID INT,
    faturaVendaID INT,
    dataConta DATE,
    dataVencimento DATE,
    valor DECIMAL(18,2),
    situacao mood,
    CONSTRAINT fk_ContaAReceber_Clinete_idx´ FOREIGN KEY (cliente_ID) REFERENCES cliente(ID)
);