# Etapa 3 — Modelagem de dados (esquema estrela)

## Objetivo do dashboard nesta fase

Responder: faturamento ao longo do tempo, por categoria de produto e por
estado do cliente.

## Grão do fato

Uma linha do fato representa **um item dentro de um pedido** (não o pedido
inteiro). Motivo: preço e frete estão registrados por item em
`order_items` — um pedido com 3 produtos gera 3 linhas.

## Desenho

                  dim_data
                     │
dim_produto ──── fato_pedidos ──── dim_cliente
(grão: item do pedido)

## Tabelas

**`fato_pedidos`**
| Coluna | Origem | Descrição |
|---|---|---|
| order_id | orders / order_items | identifica o pedido |
| order_item_id | order_items | número do item dentro do pedido |
| product_id | order_items | chave para dim_produto |
| customer_id | orders | chave para dim_cliente |
| data_compra | orders.order_purchase_timestamp | chave para dim_data |
| preco | order_items.price | valor do item |
| valor_frete | order_items.freight_value | valor do frete |

**`dim_produto`**
| Coluna | Origem |
|---|---|
| product_id | products |
| categoria | products.product_category_name |

**`dim_cliente`**
| Coluna | Origem |
|---|---|
| customer_id | customers |
| cidade | customers.customer_city |
| estado | customers.customer_state |

**`dim_data`** (gerada, não vem de nenhum CSV — uma linha por dia cobrindo
o período dos pedidos)
| Coluna |
|---|
| data |
| ano |
| mes |
| nome_mes |
| trimestre |

## Próximos passos

- Etapa 4: subir um banco PostgreSQL e carregar os CSVs brutos como tabelas
  de staging via Python.
- Etapa 5: escrever o SQL que transforma o staging nessas 4 tabelas finais.