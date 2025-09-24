#!/bin/bash

# Mostrar comandos antes de ejecutarlos
set -e  # Detiene si algún comando falla
set -x  # Muestra los comandos mientras se ejecutan

# 1. Levantar la base de datos
docker-compose up db -d

# Esperar a que la base de datos esté lista
echo "Esperando a que PostgreSQL esté listo..."
until docker exec $(docker-compose ps -q db) pg_isready -U admin > /dev/null 2>&1; do
    sleep 1
done
echo "PostgreSQL está listo."

# 2. Crear tablas
./create_tables.sh

# 3. Cargar los datos
docker-compose up load_data -d

echo "✅ Todo listo: DB levantada, tablas creadas y datos cargados."
