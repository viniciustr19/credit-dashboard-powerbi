CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(100),
    idade INT,
    renda_mensal DECIMAL(10,2),
    cidade VARCHAR(50),
    score_inicial INT
);

CREATE TABLE pagamentos (
    id_pagamento INT PRIMARY KEY,
    id_cliente INT,
    valor_fatura DECIMAL(10,2),
    pago_em_dia VARCHAR(3),
    data_pagamento DATE,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);
