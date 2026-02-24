CREATE DATABASE secretaria;
USE secretaria;
CREATE TABLE alunos(
			id INT AUTO_INCREMENT,
            PRIMARY KEY(id),
            nome VARCHAR(255) NOT NULL,
            ano CHAR(2) NOT NULL,
            nota DECIMAL(4,2) NOT NULL,
            recuperacao VARCHAR(3) AS (IF(nota < 7, 'Sim', 'Não'))
            );

DROP TABLE alunos;
            
INSERT INTO alunos (nome, ano, nota)
VALUES ('Marcio Moura', '02', 7.3),
				('Fenanda Silva', '01', 10),
                ('Caio Lima', '05', 5.6),
                ('Suzie Vieira', '03', 7),
                ('Laura Palmer', '02', 9),
                ('Harry Du Bois', '01', 8.5),
                ('Arnold Roberts', '04', 4),
                ('Larrisa Souza', '04', 3.4);

SELECT * FROM alunos;
SELECT * FROM alunos WHERE nota > 7;
SELECT * FROM alunos WHERE nota < 7;

SET SQL_SAFE_UPDATES = 0;

UPDATE alunos SET nota = 7.1 WHERE nome = 'Suzie Vieira';
