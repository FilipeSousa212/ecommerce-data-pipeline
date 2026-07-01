import os
from pathlib import Path

import pandas as pd
from dotenv import load_dotenv
from sqlalchemy import create_engine

load_dotenv()

usuario = os.getenv("POSTGRES_USER")
senha = os.getenv("POSTGRES_PASSWORD")
banco = os.getenv("POSTGRES_DB")

url_conexao = f"postgresql://{usuario}:{senha}@localhost:5432/{banco}"
engine = create_engine(url_conexao)

RAW_DIR = Path("data/raw")

arquivos = {
    "olist_customers_dataset.csv": "stg_customers",
    "olist_geolocation_dataset.csv": "stg_geolocation",
    "olist_order_items_dataset.csv": "stg_order_items",
    "olist_order_payments_dataset.csv": "stg_order_payments",
    "olist_order_reviews_dataset.csv": "stg_order_reviews",
    "olist_orders_dataset.csv": "stg_orders",
    "olist_products_dataset.csv": "stg_products",
    "olist_sellers_dataset.csv": "stg_sellers",
    "product_category_name_translation.csv": "stg_category_translation",
}

for nome_arquivo, nome_tabela in arquivos.items():
    caminho = RAW_DIR / nome_arquivo
    df = pd.read_csv(caminho)
    df.to_sql(nome_tabela, engine, if_exists="replace", index=False)
    print(f"{nome_tabela}: {len(df)} linhas carregadas")

print("Carga concluída.")