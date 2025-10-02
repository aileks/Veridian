#!/bin/bash
set -e

# Find and execute all .sql files within the entrypoint directory and its subdirectories.

echo "--- Running database initialization scripts ---"

# The find command is now restricted to the correct directory.
for f in $(find /docker-entrypoint-initdb.d -type f -name "*.sql" | sort); do
    echo "Processing $f file..."
    psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" -f "$f"
done

echo "--- Database initialization complete ---"