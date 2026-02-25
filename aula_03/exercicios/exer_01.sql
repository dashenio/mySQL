-- DROP DATABASE db_generation_game_online;

CREATE DATABASE db_generation_game_online;

USE db_generation_game_online;

CREATE TABLE tb_classes (
		id BIGINT AUTO_INCREMENT PRIMARY KEY,
        classe VARCHAR(255),
        mod_poder_atk DECIMAL(6,2),
        mod_vel_atk DECIMAL(6,2),
        mod_defesa DECIMAL(6,2)
);

CREATE TABLE tb_personagens (
		id BIGINT AUTO_INCREMENT PRIMARY KEY,
        nome VARCHAR(255),
        nivel INT,
        poder_ataque INT GENERATED ALWAYS AS (100 * nivel),
        poder_defesa INT GENERATED ALWAYS AS (50 * nivel),
        velocidade_atk INT GENERATED ALWAYS AS (5 * nivel),
        id_classe BIGINT,
        FOREIGN KEY (id_classe) REFERENCES tb_classes(id)
);

INSERT INTO tb_classes (classe, mod_poder_atk, mod_vel_atk, mod_defesa)
VALUES ('Guerreiro',  0.20, 0.20, 0.20),
				('Paladino',  0.20, 0.20, 0.40),
                ('Caçador',  0.45, 0.35, 0.10),
                ('Assassino',  0.60, 0.50, -0.30),
                ('Lanceiro',  0.20, 0.10, 0.70);

INSERT INTO tb_personagens (nome, nivel, id_classe)
VALUES 
('Thandor o Destemido', 45, 1), 
('Sylaar da Névoa', 22, 4),          
('Kaldor Bloodaxe', 15, 1),         
('Aethelgard o Santo', 38, 2),        
('Nyx a Sombra do Vento', 12, 4),     
('Brynjar da Lança Longa', 30, 5),   
('Elara Arco-Rápido', 25, 3),       
('Gromm o Vigilante', 8, 3),
('Vax\'ildan o Ceifador', 45, 4),      
('Bofur o Pequeno Escudo', 5, 2),     
('Kethra a Lança Veloz', 50, 5),    
('Grog o Aprendiz de Armadura', 3, 1),
('Sylvari o Vento da Morte', 48, 3),  
('Morgra a Sombra Iniciante', 2, 4), 
('Sir Alistair o Veterano', 42, 2),   
('Tarek o Sentinela do Deserto', 10, 5);

SELECT * FROM tb_personagens;

SELECT * FROM tb_classes;

SELECT * FROM tb_personagens WHERE poder_ataque > 2000;

SELECT * FROM tb_personagens WHERE poder_defesa BETWEEN 1000 AND 2000;

SELECT * FROM tb_personagens WHERE nome LIKE "%c%";

SELECT * FROM tb_personagens INNER JOIN tb_classes 
ON tb_personagens.id_classe = tb_classes.id  WHERE tb_classes.id =  1; 


-- Query que utiliza os modificadores de stats (mod_poder_atk, mod_vel_atk, mod_defesa): 
SELECT tb_personagens.nome, 
tb_classes.classe, 
nivel, 
CAST( (poder_ataque * mod_poder_atk + poder_ataque)AS SIGNED) AS poder_mod_classe,
CAST( ( poder_defesa * mod_defesa + poder_defesa) AS SIGNED) AS defesa_mod_classe,
CAST( ( velocidade_atk * mod_vel_atk + velocidade_atk ) AS SIGNED ) AS vel_atk_mod_classe
FROM tb_personagens INNER JOIN tb_classes 
ON tb_personagens.id_classe = tb_classes.id
ORDER BY nivel DESC;






                
                
                
                