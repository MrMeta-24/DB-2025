CREATE TABLE estado(

    ID int primary key,
    nome VARCHAR (50),
    UF CHAR(2)
);

    INSERT INTO estado(id,nome,uf)
    VALUES(
        1,
        'Santa Catarina',
        'SC'
    );

CREATE TABLE municipio(

    ID int primary key,
    estado_ID INT,
    Nome VARCHAR(80),
    codIBGE INT,
    CONSTRAINT fk_Municipio_Estado1_idx´ FOREIGN KEY (estado_ID) REFERENCES
    estado(ID)
);

    INSERT INTO municipio(id,estado_id,nome,codIBGE)
    VALUES(
        1,
        1,
        'Itapema',
        2442
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
    CONSTRAINT fk_Cliente_Municipio1_idx´ FOREIGN KEY (municipio_ID) REFERENCES
    municipio(ID)
);

    INSERT INTO cliente(id,nome,cpf,celular,endlogradouro,endNumero,endMunicipio,endCEP,municipio_id)
    VALUES(
        1,
        'marcio',
        '1234567-8',
        '21323231',
        '616342',
        '278135872',
        123,
        '131',
        1
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
    CONSTRAINT fk_ContaAReceber_Clinete_idx´ FOREIGN KEY (cliente_ID) REFERENCES
    cliente(ID)
);

    INSERT INTO contaAReceber(id, cliente_id,faturaVendaID,dataConta,dataVencimento,valor)
    VALUES(
        1,
        1,
        1212,
        '1222:14:21',
        '2133:32:23',
        0.43
    );

select * from estado;
select * from municipio;
select * from cliente;
select * from contaAReceber;