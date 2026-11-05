DROP TABLE IF EXISTS VENDAS;
DROP TABLE IF EXISTS JOGOS;

CREATE TABLE JOGOS (
    id_jogo INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    genero VARCHAR(50) NOT NULL,
    preco DECIMAL(10,2) NOT NULL CHECK (preco > 0),
    plataforma VARCHAR(30) DEFAULT 'PC'
);

CREATE TABLE VENDAS (
    id_venda INT PRIMARY KEY,
    id_jogo INT NOT NULL,
    quantidade INT NOT NULL CHECK (quantidade > 0),
    data_venda DATE NOT NULL,
    forma_pagamento VARCHAR(30) DEFAULT 'Pix',
    FOREIGN KEY (id_jogo) REFERENCES JOGOS(id_jogo),
    CHECK (forma_pagamento IN ('Pix', 'Cartao', 'Dinheiro'))
);

INSERT INTO JOGOS VALUES
(1, 'Minecraft', 'Sandbox', 99.90, 'PC'),
(2, 'God of War Ragnarok', 'Acao', 199.90, 'PlayStation'),
(3, 'Forza Horizon 5', 'Corrida', 149.90, 'Xbox');

INSERT INTO VENDAS VALUES
(101, 1, 2, '2026-11-01', 'Pix'),
(102, 2, 1, '2026-11-02', 'Cartao'),
(103, 3, 3, '2026-11-03', 'Dinheiro');

SELECT * FROM JOGOS;
SELECT * FROM VENDAS;