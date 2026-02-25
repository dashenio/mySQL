-- DROP DATABASE db_secretaria;
CREATE DATABASE db_secretaria;

USE db_secretaria;

CREATE TABLE alunos(
			id INT AUTO_INCREMENT,
            PRIMARY KEY(id),
            nome VARCHAR(255) NOT NULL,
            professora ENUM('Tânia', 'Fátima', 'Eunice') NOT NULL,
            nota DECIMAL(3,1) NOT NULL,
            recuperacao VARCHAR(3) AS (IF(nota < 7, 'Sim', 'Não'))
            );
            
INSERT INTO alunos (nome, professora, nota)
VALUES ('Marcio Moura', 'Tânia', 7.30),
				('Fernanda Silva', 'Fátima', 10.00),
				('Caio Lima', 'Eunice', 5.60),   
				('Suzie Vieira', 'Tânia', 7.00),
				('Laura Palmer', 'Fátima', 9.00),
				('Harry Du Bois', 'Eunice', 8.50),
				('Arnold Roberts', 'Tânia', 4.00),  
				('Larissa Souza', 'Fátima', 3.40),  
				('Dale Cooper', 'Eunice', 6.95),     
				('Kim Kitsuragi', 'Tânia', 9.80);

SELECT * FROM alunos;

SELECT * FROM alunos WHERE nota >= 7;

SELECT * FROM alunos WHERE nota < 7;

SET SQL_SAFE_UPDATES = 0;

UPDATE alunos SET nota = 8 WHERE nome = 'Suzie Vieira';
