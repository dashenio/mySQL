-- DROP DATABASE db_cidade_das_carnes;

CREATE DATABASE db_cidade_das_carnes;

USE db_cidade_das_carnes;

CREATE TABLE tb_categorias (
		id INT AUTO_INCREMENT PRIMARY KEY,
        finalidade VARCHAR(255) NOT NULL,
        origem ENUM( 'Bovina', 'Suína', 'Avícola') NOT NULL,
        tipo_corte ENUM('Primeira', 'Segunda') NOT NULL,
        maciez ENUM('Macia', 'Dura') NOT NULL
        );

CREATE TABLE tb_produtos (
		id INT AUTO_INCREMENT PRIMARY KEY,
        nome_corte VARCHAR (255) NOT NULL,
        porcentagem_gordura DECIMAL (6,2),
        quantidade_kg DECIMAL (6.2),
        preco DECIMAL (6,2) NOT NULL,
        categoria_id INT,
        FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
        );
        
INSERT INTO tb_categorias (finalidade, origem, maciez, tipo_corte)
VALUES ('Preparo de Molhos/Recheios', 'Bovina', 'Macia', 'Segunda'),
				('Churrasco', 'Bovina', 'Macia', 'Primeira'),
				('Cozidos e Sopas', 'Bovina', 'Dura', 'Segunda'),
				('Grelhados', 'Avícola', 'Macia', 'Primeira'),
				('Assados no Forno', 'Suína', 'Macia', 'Primeira');
                
INSERT INTO tb_produtos (nome_corte, porcentagem_gordura, quantidade_kg, preco, categoria_id) 
VALUES ('Picanha', 1.5, 150.00, 89.90, 2),
				('Contra Filé', 2.0, 100.00, 55.00, 2),
				('Acém', 3.0, 80.00, 28.50, 3),
				('Peito de Frango', 5.0, 200.00, 19.90, 4),
				('Costelinha', 2.5, 200.00, 35.00, 5),
				('Lombo Suíno', 2.0, 500.00, 32.90, 5),
				('Panceta', 1.5, 300.00, 29.50, 5),
				('Pernil com Osso', 4.0, 150.00, 24.90, 5),
				('Filé Mignon', 1.0, 300.00, 95.00, 2),
				('Cupim', 4.0, 250.00, 45.00, 2),
				('Sobrecoxa', 3.0, 1200.00, 18.00, 4),
				('Músculo', 2.5, 500.00, 26.90, 3),
				('Costela Ponta de Agulha', 5.0, 220.00, 22.50, 3),
				('Paleta', 1.8, 800.00, 29.90, 1),
                ('Patinho', 1.0, 300.00, 49.90, 1),
				('Fraldinha de Segunda', 2.0, 150.00, 31.00, 3);
                
SELECT * FROM tb_produtos;

SELECT * FROM tb_produtos WHERE preco > 50.00;

SELECT * FROM tb_produtos WHERE preco BETWEEN 50.00 AND 150.00;

SELECT * FROM tb_produtos WHERE nome_corte LIKE '%c%';

SELECT * FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id ORDER BY preco ASC;

SELECT * FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id WHERE tb_categorias.id = 3 ORDER BY porcentagem_gordura ASC;













                