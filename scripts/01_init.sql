/*
 Create database and schemas
 
 This script creates the bronze, silver, and gold schemas.
 The 'Warehouse' database itself is created automatically
 by the Docker entrypoint process based on the POSTGRES_DB
 environment variable in docker-compose.yml.
*/

DO $$
BEGIN
    RAISE NOTICE '========================================';
    RAISE NOTICE 'SCRIPT START: Initialization';
    RAISE NOTICE 'Creating database schemas';
    RAISE NOTICE '========================================';

    BEGIN
        RAISE NOTICE 'Creating bronze schema...';
        CREATE SCHEMA IF NOT EXISTS bronze;
        RAISE NOTICE 'Bronze schema created successfully';
    EXCEPTION WHEN OTHERS THEN
        RAISE NOTICE 'ERROR creating bronze schema: %', SQLERRM;
        RAISE;
    END;

    BEGIN
        RAISE NOTICE 'Creating silver schema...';
        CREATE SCHEMA IF NOT EXISTS silver;
        RAISE NOTICE 'Silver schema created successfully';
    EXCEPTION WHEN OTHERS THEN
        RAISE NOTICE 'ERROR creating silver schema: %', SQLERRM;
        RAISE;
    END;

    BEGIN
        RAISE NOTICE 'Creating gold schema...';
        CREATE SCHEMA IF NOT EXISTS gold;
        RAISE NOTICE 'Gold schema created successfully';
    EXCEPTION WHEN OTHERS THEN
        RAISE NOTICE 'ERROR creating gold schema: %', SQLERRM;
        RAISE;
    END;

    RAISE NOTICE '========================================';
    RAISE NOTICE 'SCRIPT END: Initialization';
    RAISE NOTICE 'All schemas created successfully';
    RAISE NOTICE '========================================';
END $$;