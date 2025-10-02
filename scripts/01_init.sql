/*
 Create database and schemas
 
 This script creates the bronze, silver, and gold schemas.
 The 'Warehouse' database itself is created automatically
 by the Docker entrypoint process based on the POSTGRES_DB
 environment variable in docker-compose.yml.
*/

CREATE SCHEMA IF NOT EXISTS bronze;
CREATE SCHEMA IF NOT EXISTS silver;
CREATE SCHEMA IF NOT EXISTS gold;