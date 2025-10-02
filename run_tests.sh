#!/bin/bash

set -e

echo "--- Starting Database Test ---"

echo "=> Tearing down existing containers and volumes..."
docker-compose down -v
sleep 2

echo "=> Building and starting the database container..."
docker-compose up -d --build
sleep 2

echo "=> Waiting for PostgreSQL to be ready..."

# This loop will try to connect to the DB. It will wait until the connection is successful.
until docker-compose exec -T db pg_isready -U user -d Warehouse; do
  echo "Postgres is unavailable - sleeping"
  sleep 3
done

echo "=> PostgreSQL is ready. Running tests..."

# The -T flag is important as it disables pseudo-tty allocation, which is needed for automation.
docker-compose exec -T db psql -U user -d Warehouse -f /tests/test_row_counts.sql
docker-compose exec -T db psql -U user -d Warehouse -f /tests/test_no_null_keys.sql

echo "--- Tests Completed Successfully ---"