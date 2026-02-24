CREATE DATABASE rh_empresarial;

USE rh_empresarial;

CREATE TABLE colaboradores(
	id BIGINT AUTO_INCREMENT,
    PRIMARY KEY (id),
    nome VARCHAR(255) NOT NULL,
    salario DECIMAL(6, 2) NOT NULL,
    data_contratacao DATE NOT NULL,
    ultimas_ferias DATE DEFAULT NULL,
    elegivel_ferias DATE AS (DATE_ADD(COALESCE(ultimas_ferias, data_contratacao), INTERVAL 1 YEAR))
);
    
INSERT INTO colaboradores(nome, salario, data_contratacao, ultimas_ferias)
VALUES('Wagner Moura', 5250.23, '2007-01-10','2024-01-11'),
				('Adriana Melo', 1800.99, '2015-01-10','2025-03-05'),
                ('Suzana Vieira', 2540.56, '1999-07-19','2026-01-11'),
                ('Fernanda Torres', 5250.23, '2004-04-27','2025-01-11'),
                ('Maurício de Sousa', 1854.4, '1990-09-07','2025-09-11');
    
SELECT * FROM colaboradores;
 
INSERT INTO colaboradores(nome, salario, data_contratacao, ultimas_ferias)
VALUES('Clóvis Merry', 1560.30, '2025-11-01', NULL);
 
SELECT * FROM colaboradores WHERE salario > 2000;
SELECT * FROM colaboradores WHERE salario < 2000;
 
 SET SQL_SAFE_UPDATES = 0;
 
UPDATE colaboradores SET salario = 9999.99 WHERE nome = 'Maurício de Sousa';
    
    
    
