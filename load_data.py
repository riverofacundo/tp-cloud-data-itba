import psycopg2
import os
import csv

# Variables de entorno
db_host = "db"
db_port = "5432"
db_name = "wordbank"
db_user = "admin"
db_password = "admin"

# Conectar a PostgreSQL
conn = psycopg2.connect(
    host=db_host,
    port=db_port,
    dbname=db_name,
    user=db_user,
    password=db_password
)
cur = conn.cursor()

def load_csv_to_table(csv_path, table_name, columns):
    with open(csv_path, 'r', encoding='utf-8') as f:
        reader = csv.reader(f)
        next(reader)  # saltar encabezado
        for row in reader:
            # Convertir "" a None para cada valor en la fila
            row = [None if val == '' else val for val in row]

            placeholders = ','.join(['%s'] * len(columns))
            query = f"INSERT INTO {table_name} ({','.join(columns)}) VALUES ({placeholders})"
            cur.execute(query, row)
    conn.commit()

col_df1 = [
    'Country_Name',
    'Country_Code',
    'Region',
    'IncomeGroup',
    'Year',
    'Birth_rate_crude',
    'Death_rate_crude',
    'Electric_power_consumption',
    'GDP',
    'GDP_per_capita',
    'Individuals_using_Internet',
    'Infant_mortality_rate',
    'Life_expectancy_at_birth',
    'Population_density',
    'Unemployment'
]

col_df2 = [
    'iso3',
    'country',
    'hdicode',
    'hdi_rank_2021'
]



# Cargar datos (ajustá nombres de columnas según tu tabla real)
load_csv_to_table('/app/worldbank_data.csv', 'worldbank', col_df1)
load_csv_to_table('/app/hdi_data.csv', 'hdi', col_df2)

cur.close()
conn.close()
