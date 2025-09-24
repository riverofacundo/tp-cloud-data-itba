FROM python:3.8-slim

# Carpeta de trabajo dentro del contenedor
WORKDIR /app

# Copiamos el script de carga
COPY load_data.py .

RUN pip install psycopg2-binary


# Comando que se ejecuta cuando el contenedor corre
CMD ["python", "load_data.py"]
