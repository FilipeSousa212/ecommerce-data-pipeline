DROP TABLE IF EXISTS dim_data;

CREATE TABLE dim_data AS
SELECT
    d::date AS data,
    EXTRACT(YEAR FROM d)::int AS ano,
    EXTRACT(MONTH FROM d)::int AS mes,
    TO_CHAR(d, 'TMMonth') AS nome_mes,
    EXTRACT(QUARTER FROM d)::int AS trimestre
FROM generate_series(
    (SELECT MIN(order_purchase_timestamp)::date FROM stg_orders),
    (SELECT MAX(order_purchase_timestamp)::date FROM stg_orders),
    interval '1 day'
) AS d;

ALTER TABLE dim_data ADD PRIMARY KEY (data);