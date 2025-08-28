DROP TABLE ambulatorio;
DROP TABLE Pacientes;

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
	ALTER TABLE Medicos ADD COLUMN salario NUMERIC(10,2);

    INSERT INTO Medicos (codm, nome, idade, especialidade, RG, cidade, nro)
    VALUES

        (1, 'João', 40, 'ortopedia', '1000010000', 'Fpolis', 1),
        (2, 'Maria', 42, 'traumatologia', '1000011000', 'Blumenau', 2),
        (3, 'Pedro', 51, 'pediatria', '1100010000', 'Fpolis', 2),
        (4, 'Carlos', 28, 'ortopedia', '1100011000', 'Joinville', NULL),
        (5, 'Márcia', 33, 'neurologia', '1100011100', 'Biguaçu', 3)
    ;


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

	ALTER TABLE pacientes ALTER COLUMN RG TYPE VARCHAR;


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
	
	
	UPDATE Medicos 
    SET cidade = 'Itajai' 
    WHERE nome = 'Maria'
    ;

    DELETE FROM Medicos
    WHERE cidade IN ('Biguaçu', 'Palhoça')
    ;

	
    UPDATE pacientes
    SET problema = 'tendinite'
    WHERE nome = 'Ana'
    ;

    DELETE FROM pacientes
    WHERE problema = 'câncer' AND idade < 10
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

	UPDATE medicos
	SET salario = 1900
	WHERE codm = 5
	;

SELECT * FROM ambulatorio;
SELECT * FROM Medicos;
SELECT * FROM pacientes;
SELECT * FROM consultas;

SELECT * FROM Medicos WHERE idade < 40 OR especialidade <>'traumatologia';

SELECT nome, problema FROM pacientes WHERE cidade = 'Fpolis' AND idade < 24;

SELECT codm, codp FROM consultas WHERE data = '2003-05-14' AND hora > '14:00';

SELECT nro FROM ambulatorio WHERE andar <> 1 AND capacidade > 30;

SELECT data, hora FROM consultas WHERE codp = 4 AND data > '2003-05-14';

SELECT data FROM consultas WHERE hora < '13:00';

SELECT DISTINCT cidade FROM pacientes;

SELECT andar FROM ambulatorio WHERE andar IS NOT NULL;




SELECT nome, idade * 12 AS meses FROM paciente;

SELECT AVG(salario) AS media_salarial  FROM Medicos;

SELECT MAX (hora) AS horarrio_mais_tarde FROM consultas WHERE data = '2003-05-13';

SELECT MIN(capacidade) AS menor_capacidade FROM Ambulatorio;

SELECT COUNT(*) AS qtd_pacientes FROM pacientes WHERE cidade = 'Fpolis' AND idade > 21;

SELECT SUM(salario) AS total_salarios, COUNT(*) AS qtd_medicos FROM medicos;

SELECT AVG(idade) AS media_idade, COUNT(DISTINCT nro) AS total_ambulatorios FROM Medicos;

SELECT nome, rg FROM Medicos WHERE nome BETWEEN 'A' AND 'Mzzzz';

SELECT nome FROM Pacientes WHERE rg LIKE '2%20000';

SELECT nome FROM Medicos WHERE salario NOT BETWEEN 1000.00 AND 1999.99;

SELECT nro FROM Ambulatorio WHERE capacidade BETWEEN 30 AND 50;

SELECT nome, rg, problema FROM pacientes WHERE nome BETWEEN 'L' AND 'Zzzzz';

SELECT nro, capacidade FROM Ambulatorio WHERE nro IN (1, 3, 5) AND andar = 1;



--Exercicio 1
SELECT pacientes.nome FROM pacientes, consultas WHERE pacientes.codp = consultas.codp 
	AND consultas.hora > '14:00:00';

SELECT Medicos.nome FROM Medicos, Ambulatorio WHERE Medicos.nro = Ambulatorio.nro 
	AND Ambulatorio.capacidade < 50;

SELECT Medicos.nome, Medicos.idade FROM Medicos, Pacientes, Consultas WHERE Medicos.codm = Consultas.codm 
	AND Pacientes.codp = Consultas.codp 
	AND Pacientes.nome = 'Ana';

SELECT DISTINCT p.nome, p.rg, p.idade FROM pacientes p, medicos m, consultas c WHERE p.codp = c.codp
	AND m.codm = c.codm
	AND m.especialidade = 'ortopedia'
	AND p.codp NOT IN (
SELECT p2.codp FROM pacientes p2, medicos m2, consultas c2 WHERE p2.codp = c2.codp
    AND m2.codm = c2.codm
    AND m2.especialidade = 'ortopedia'
    AND c2.data >= '2003-05-16'
);

--Exercicio 2
SELECT m.nome, m.rg FROM Medicos m INNER JOIN Medicos f ON m.rg = f.rg;

SELECT DISTINCT a.nro, a.andar FROM Medicos m INNER JOIN Ambulatorio a ON m.nro = a.nro WHERE m.especialidade = 'ortopedia';

SELECT DISTINCT p.nome, p.rg FROM pacientes p INNER JOIN consultas c ON p.codp = c.codp WHERE c.data BETWEEN '2003-05-14' AND '2003-05-16';

SELECT DISTINCT p.nome, p.cidade FROM pacientes p INNER JOIN consultas c ON p.codp = c.codp INNER JOIN medicos m ON c.codm = m.codm WHERE m.especialidade = 'ortopedia';

--Exercicio 3
SELECT * FROM consultas WHERE codm = (
    SELECT codm FROM Medicos WHERE nome = 'Maria'
);

SELECT nro, andar FROM Ambulatorio WHERE nro NOT IN (
    SELECT DISTINCT nro FROM Medicos WHERE nro IS NOT NULL
);

SELECT * FROM pacientes WHERE codp NOT IN (
    SELECT codp FROM consultas WHERE codm = (
        SELECT codm FROM Medicos WHERE nome = 'Pedro'
    )
);

SELECT DISTINCT m.nome, m.rg FROM Medicos m WHERE m.codm IN (
    SELECT codm FROM Consultas WHERE hora < '12:00:00'
)
AND m.nro NOT IN (
    SELECT nro FROM Ambulatorio WHERE capacidade > 40
);