DROP TABLE 	ambulatorio;
CREATE TABLE ambulatorio(

	nro int primary key,
	andar int NOT NULL,
	capacidade int
);

    INSERT INTO ambulatorio (nro, andar, capacidade) 
    VALUES

        (1, 1, 30),
        (2, 1, 50),
        (3, 2, 40),
        (4, 2, 25),
        (5, 2, 50)
    ;

CREATE TABLE Medicos (

    codm INT PRIMARY KEY,
    nome VARCHAR(40) NOT NULL,
    idade INT NOT NULL,
    especialidade varchar(20),
    RG int UNIQUE,
    cidade VARCHAR(30),
    nro INT,
    FOREIGN KEY (nro) REFERENCES ambulatorio
);

    INSERT INTO Medicos (codm, nome, idade, especialidade, RG, cidade, nro)
    VALUES

        (1, 'João', 40, 'ortopedia', '1000010000', 'Fpolis', 1),
        (2, 'Maria', 42, 'traumatologia', '1000011000', 'Blumenau', 2),
        (3, 'Pedro', 51, 'pediatria', '1100010000', 'Fpolis', 2),
        (4, 'Carlos', 28, 'ortopedia', '1100011000', 'Joinville', NULL),
        (5, 'Márcia', 33, 'neurologia', '1100011100', 'Biguaçu', 3)
    ;

    UPDATE Medicos 
    SET cidade = 'Itajai' 
    WHERE nome = 'Maria'
    ;

    DELETE FROM Medicos
    WHERE cidade IN ('Biguaçu', 'Palhoça')
    ;

DROP TABLE Pacientes;
CREATE TABLE pacientes (

    codp INT PRIMARY KEY,
    nome VARCHAR(40) NOT NULL,
    idade INT NOT NULL,
    cidade CHAR(30),
    RG int UNIQUE,
    problema VARCHAR(40) NOT NULL
);

    INSERT INTO pacientes (codp, nome, idade, cidade, RG, problema)
    VALUES

        (1, 'Ana', 20, 'Fpolis', '200002000', 'gripe'),
        (2, 'Paulo', 24, 'Palhoça', '200002200', 'fratura'),
        (3, 'Lúcia', 30, 'Fpolis', '220002000', 'tendinite'),
        (4, 'Carlos', 28, 'Joinville', '110001100', 'sarampo')
    ;

    UPDATE pacientes
    SET problema = 'tendinite'
    WHERE nome = 'Ana'
    ;

    DELETE FROM pacientes
    WHERE problema = 'câncer' AND idade < 10
    ;

CREATE TABLE consultas (

    codm INT,
    codp INT,
    data DATE,
    hora TIME,
    FOREIGN KEY (codm) REFERENCES Medicos(codm),
    FOREIGN KEY (codp) REFERENCES Pacientes(codp)
	
);

    INSERT INTO consultas (codm, codp, data, hora)
    VALUES
        (1, 1, '2003-05-12', '14:00'),
        (1, 4, '2003-05-13', '10:00'),
        (2, 1, '2003-05-13', '09:00'),
        (2, 2, '2003-05-13', '11:00'),
        (2, 3, '2003-05-14', '14:00'),
        (2, 4, '2003-05-14', '17:00'),
        (3, 1, '2003-05-17', '18:00'),
        (3, 3, '2003-05-12', '10:00'),
        (3, 4, '2003-05-15', '13:00'),
        (4, 4, '2003-05-16', '13:00'),
        (4, 4, '2003-05-18', '19:30')
    ;

    UPDATE consultas
    SET data = '2003-05-15', hora = '12:00'
    WHERE codm = 1 AND codp = 4
    ;

    UPDATE consultas
    SET hora = hora + INTERVAL '1:30'
    WHERE codm = 3 AND codp = 4
    ;

    DELETE FROM consultas
    WHERE hora > '19:00:00'
    ;

SELECT * FROM ambulatorio;
SELECT * FROM Medicos;
SELECT * FROM pacientes;
SELECT * FROM consultas;