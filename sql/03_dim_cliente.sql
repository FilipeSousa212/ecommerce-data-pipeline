DROP TABLE IF EXISTS dim_cliente;

CREATE TABLE dim_cliente AS
SELECT DISTINCT
    customer_id,
    customer_city AS cidade,
    customer_state AS estado
FROM stg_customers;

ALTER TABLE dim_cliente ADD PRIMARY KEY (customer_id);