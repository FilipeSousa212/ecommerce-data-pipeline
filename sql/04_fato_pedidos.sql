DROP TABLE IF EXISTS fato_pedidos;

CREATE TABLE fato_pedidos AS
SELECT
    oi.order_id,
    oi.order_item_id,
    oi.product_id,
    o.customer_id,
    o.order_purchase_timestamp::date AS data_compra,
    oi.price AS preco,
    oi.freight_value AS valor_frete
FROM stg_order_items oi
JOIN stg_orders o ON o.order_id = oi.order_id;

ALTER TABLE fato_pedidos ADD FOREIGN KEY (product_id) REFERENCES dim_produto(product_id);
ALTER TABLE fato_pedidos ADD FOREIGN KEY (customer_id) REFERENCES dim_cliente(customer_id);
ALTER TABLE fato_pedidos ADD FOREIGN KEY (data_compra) REFERENCES dim_data(data);