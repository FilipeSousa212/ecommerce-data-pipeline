DROP TABLE IF EXISTS dim_produto;

CREATE TABLE dim_produto AS
SELECT DISTINCT
    product_id,
    COALESCE(product_category_name, 'sem_categoria') AS categoria
FROM stg_products;

ALTER TABLE dim_produto ADD PRIMARY KEY (product_id);