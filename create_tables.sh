#!/bin/bash

# Nombre del contenedor donde está PostgreSQL
CONTAINER_NAME=postgres_container

# Archivo SQL con los comandos para crear las tablas
SQL_FILE=create_tables.sql

echo "Iniciando la copia del archivo SQL al contenedor..."

# Nombre de la carpeta que crearemos en la raíz del contenedor
CONTAINER_FOLDER="home/wordbank"

echo "Iniciando la creación de la carpeta 'wordbank' en el contenedor..."

# Crear la carpeta 'wordbank' en la raíz del contenedor
docker exec -i $CONTAINER_NAME mkdir -p $CONTAINER_FOLDER


# Copiar el archivo SQL al contenedor
docker cp $SQL_FILE $CONTAINER_NAME:home/wordbank/$SQL_FILE

echo "Archivo SQL copiado al contenedor. Ahora ejecutando el script..."

# Ejecutar el script SQL dentro del contenedor de PostgreSQL
docker exec -i $CONTAINER_NAME psql -U admin -d wordbank -f home/wordbank/$SQL_FILE

echo "El script SQL ha sido ejecutado."

# Comprobar si la creación fue exitosa
if [ $? -eq 0 ]; then
  echo "Las tablas se crearon correctamente."
else
  echo "Hubo un error al crear las tablas."
fi
