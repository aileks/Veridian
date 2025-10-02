#!/bin/bash

set -e

# This script will be run by the official postgres entrypoint.
# It iterates through all .sql files in this directory and its subdirectories,
# sorted alphabetically, and executes them.

echo "--- Running all .sql scripts ---"

for f in $(find . -type f -name "*.sql" | sort); do
    echo "Processing $f file..."
    psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" -f "$f"
done

echo "--- All .sql scripts executed successfully ---"