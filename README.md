# Veridian — SQL Data Warehouse

Veridian is a containerized SQL data-warehouse project that demonstrates a simple ETL pipeline, database initialization scripts, and automated data-quality tests. The project runs locally inside Docker using the provided Compose configuration and a Postgres database.

## Quickstart (containerized)

Prerequisites: Docker and either the legacy `docker-compose` CLI or the newer integrated `docker compose` command.

1. Start the Compose stack (builds the Postgres image and mounts the SQL/scripts):

```bash
# or the modern command
docker compose up -d --build
```

2. Run the included test runner which will tear down any previous stack, bring it up, wait for Postgres, and execute SQL tests:

```bash
./run_tests.sh
```

Notes:

- `compose.yml` mounts `./scripts` into `/docker-entrypoint-initdb.d` inside the Postgres container so the SQL initialization scripts are executed on container startup.
- `run_tests.sh` currently uses `docker-compose` commands. If you don't have the legacy `docker-compose` binary installed, either install it or edit `run_tests.sh` to use `docker compose ` instead.
- The DB credentials and database name are set in `compose.yml` (POSTGRES_USER, POSTGRES_PASSWORD, POSTGRES_DB).

## Tests

The `tests/` folder contains basic SQL assertions used to validate row counts and null-key constraints. `run_tests.sh` automates bringing up the container, waiting for readiness, and executing these SQL checks.
