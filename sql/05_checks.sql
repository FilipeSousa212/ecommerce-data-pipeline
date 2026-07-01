-- 1. Nenhuma linha do fato deve ter preço ou frete nulo
SELECT COUNT(*) AS itens_sem_preco
FROM fato_pedidos
WHERE preco IS NULL OR valor_frete IS NULL;

-- 2. O total de linhas do fato deve bater com o total de order_items
SELECT
    (SELECT COUNT(*) FROM fato_pedidos) AS linhas_fato,
    (SELECT COUNT(*) FROM stg_order_items) AS linhas_origem;

-- 3. Nenhum produto sem categoria tratada (não deveria sobrar nulo puro)
SELECT COUNT(*) AS produtos_sem_categoria_tratada
FROM dim_produto
WHERE categoria IS NULL;