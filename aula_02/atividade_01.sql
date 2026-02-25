
CREATE DATABASE rh_tv_guarapari;

USE rh_tv_guarapari;

CREATE TABLE colaboradores(
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cargo VARCHAR(255) NOT NULL,
    salario DECIMAL(10, 2) NOT NULL,
    data_contratacao DATE NOT NULL,
    ultimas_ferias DATE DEFAULT NULL,
    elegivel_ferias DATE AS (DATE_ADD(COALESCE(ultimas_ferias, data_contratacao), INTERVAL 1 YEAR))
);
    
INSERT INTO colaboradores(nome, cargo, salario, data_contratacao, ultimas_ferias)
VALUES
('Wagner Moura', 'Ator Sênior', 5250.23, '2007-01-10', '2024-01-11'),
('Adriana Melo', 'Analista de RH', 1800.99, '2015-01-10', '2025-03-05'),
('Suzana Vieira', 'Diretora Artística', 2540.56, '1999-07-19', '2026-01-11'),
('Fernanda Torres', 'Roteirista', 5250.23, '2004-04-27', '2025-01-11'),
('Maurício de Sousa', 'Roteirista Chefe', 18054.40, '1990-09-07', '2025-09-11'),
('Selton Mello', 'Diretor de Cena', 4800.00, '2010-05-20', '2025-06-15'),
('Taís Araújo', 'Coordenadora de Projetos', 3900.50, '2018-11-12', '2024-12-01'),
('João Silva', 'Estagiário de TI', 1200.00, '2026-02-01', NULL);
    
SELECT nome, cargo, 
CONCAT('R$ ', FORMAT(salario, 2, 'pt_BR')) AS salario_ ,
data_contratacao, ultimas_ferias 
FROM colaboradores;
 
 
SELECT nome, cargo, 
CONCAT('R$ ', FORMAT(salario, 2, 'pt_BR')) AS salario_ ,
data_contratacao, ultimas_ferias
FROM colaboradores WHERE salario > 2000;


SELECT nome, cargo, 
CONCAT('R$ ', FORMAT(salario, 2, 'pt_BR')) AS salario_ ,
data_contratacao, ultimas_ferias 
FROM colaboradores WHERE salario < 2000;
 
 SET SQL_SAFE_UPDATES = 0;
 
UPDATE colaboradores SET salario = 100000.00 WHERE nome = 'Maurício de Sousa';
    
    
    
