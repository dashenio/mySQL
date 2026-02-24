CREATE database ecommerce;

USE ecommerce;

CREATE TABLE produtos(
	id BIGINT AUTO_INCREMENT,
    PRIMARY KEY (id),
    nome VARCHAR(255) NOT NULL,
    quantidade INT,
    preco DECIMAL(6, 2) NOT NULL,
    descricao VARCHAR(255)
    );
    
INSERT INTO produtos(nome, quantidade, preco, descricao)
VALUES ('Lápiseira', 300, 10.99, 'Lapiseira ponta 0.3'),
				('Caderno', 132, 20.95, 'Caderno de 20 matérias'),
                ('Estojo Tinker Bell', 164, 15.00, 'Estojo com gravura Tinker Bell'),
                ('Estojo Batman', 121, 15.00, 'Estojo com gravura Batman'),
                ('Lapis de cor', 280, 9.99, 'Caixa com 12 lápis'),
                ('Giz de cera colorido', 427, 6.99, 'Caixa com 12 giz'),
                ('Borracha', 1060, 3.99, 'Borracha com duas cores'),
                ('Caneta Bic', 10000, 1.99, 'Caneta Azul Bic');
    
SELECT * FROM produtos;

UPDATE produtos SET preco = 501.99 WHERE id = 4;
 
SELECT * FROM produtos WHERE preco > 500;
SELECT * FROM produtos WHERE preco < 500;
 
 