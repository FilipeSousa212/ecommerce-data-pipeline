import pandas as pd
from pathlib import Path

RAW_DIR = Path("data/raw")

arquivos = [
    "olist_customers_dataset.csv",
    "olist_geolocation_dataset.csv",
    "olist_order_items_dataset.csv",
    "olist_order_payments_dataset.csv",
    "olist_order_reviews_dataset.csv",
    "olist_orders_dataset.csv",
    "olist_products_dataset.csv",
    "olist_sellers_dataset.csv",
    "product_category_name_translation.csv",
]

for nome_arquivo in arquivos:
    caminho = RAW_DIR / nome_arquivo
    df = pd.read_csv(caminho)

    print(f"\n=== {nome_arquivo} ===")
    print(f"Linhas: {df.shape[0]}   Colunas: {df.shape[1]}")

    nulos = df.isnull().sum()
    nulos = nulos[nulos > 0]
    if not nulos.empty:
        print("Colunas com nulos:")
        print(nulos)
    else:
        print("Nenhuma coluna com valores nulos.")