#!/usr/bin/env bash

# Esperar a que mariadb esté listo
/wait-for-it.sh mariadb:3306 --timeout=60 --strict -- echo "MariaDB is up"

# Ejecutar la aplicación
exec java -jar /home/app/product-example-0.0.1-SNAPSHOT.jar


