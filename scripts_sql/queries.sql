
-- Total de clientes por cidade
SELECT cidade, COUNT(*) AS total_clientes
FROM clientes
GROUP BY cidade;

-- Média de score por cidade
SELECT cidade, AVG(score_inicial) AS media_score
FROM clientes
GROUP BY cidade;

-- Percentual de inadimplência por cidade
SELECT 
    c.cidade,
    COUNT(*) AS total_pagamentos,
    SUM(CASE WHEN p.pago_em_dia = 'Não' THEN 1 ELSE 0 END) AS pagamentos_atrasados,
    ROUND(100.0 * SUM(CASE WHEN p.pago_em_dia = 'Não' THEN 1 ELSE 0 END) / COUNT(*), 2) AS percentual_inadimplencia
FROM pagamentos p
JOIN clientes c ON p.id_cliente = c.id_cliente
GROUP BY c.cidade;

-- Score médio por faixa etária
SELECT 
    CASE 
        WHEN idade < 25 THEN 'Menor que 25'
        WHEN idade BETWEEN 25 AND 40 THEN '25-40'
        WHEN idade BETWEEN 41 AND 60 THEN '41-60'
        ELSE 'Acima de 60'
    END AS faixa_etaria,
    AVG(score_inicial) AS score_medio
FROM clientes
GROUP BY faixa_etaria
ORDER BY faixa_etaria;

-- Evolução mensal do total de pagamentos e inadimplência
SELECT 
    DATE_TRUNC('month', data_pagamento) AS mes,
    COUNT(*) AS total_pagamentos,
    SUM(CASE WHEN pago_em_dia = 'Não' THEN 1 ELSE 0 END) AS atrasos
FROM pagamentos
GROUP BY mes
ORDER BY mes;
