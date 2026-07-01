# Pipeline de Dados para E-commerce — do zero ao dashboard

Projeto de portfólio de Engenharia de Dados. A ideia é pegar dados brutos de
um e-commerce real (dataset público da Olist, maior marketplace do Brasil),
construir um pipeline de dados completo e terminar com um dashboard no
Power BI respondendo perguntas de negócio: quanto vendemos, quanto tempo
demora a entrega, e como estão os clientes satisfeitos.

## Por que este projeto existe

Mostrar, na prática, o fluxo de trabalho de um(a) engenheiro(a) de dados:
pegar dado bruto → limpar e organizar → modelar → carregar num banco →
disponibilizar para análise em um dashboard.

## Arquitetura

Kaggle (CSVs) → data/raw/ → Python (ETL) → PostgreSQL → SQL (transformação)
→ esquema estrela
→ Power BI

- **Fonte:** dataset público "Brazilian E-Commerce Public Dataset by Olist" (Kaggle)
- **Armazenamento/Transformação:** PostgreSQL (via Docker) + SQL
- **Orquestração do ETL:** Python (pandas + SQLAlchemy)
- **Visualização:** Power BI Desktop

## Roteiro do projeto

- [x] Etapa 0 — Estrutura do projeto e Git
- [ ] Etapa 1 — Obter os dados (dataset Olist)
- [ ] Etapa 2 — Explorar e entender os dados
- [ ] Etapa 3 — Modelagem de dados (esquema estrela)
- [ ] Etapa 4 — Pipeline ETL em Python
- [ ] Etapa 5 — Transformação em SQL (fato e dimensões)
- [ ] Etapa 6 — Qualidade de dados
- [ ] Etapa 7 — Dashboard no Power BI
- [ ] Etapa 8 — Documentação final e publicação no GitHub
- [ ] Etapa 9 — Post de divulgação no LinkedIn

## Estrutura de pastas

data/raw/          # CSVs originais baixados do Kaggle (fora do Git)
data/processed/     # dados tratados (fora do Git)
sql/                # scripts SQL de transformação
src/                # scripts Python do pipeline
docs/               # anotações e decisões do projeto

## Status

 Em construção.

## Autor

Filipe Sousa

