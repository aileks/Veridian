/*
 Execute bronze layer procedures
 
 This script calls the stored procedures to create and load bronze tables.
 It should be run after the stored procedures have been defined.
*/

DO $$
BEGIN
    RAISE NOTICE '========================================';
    RAISE NOTICE 'Executing Bronze Layer Procedures';
    RAISE NOTICE '========================================';

    -- Create bronze tables
    BEGIN
        RAISE NOTICE 'Calling bronze.create_bronze_tables()...';
        CALL bronze.create_bronze_tables();
        RAISE NOTICE 'Bronze tables created successfully';
    EXCEPTION WHEN OTHERS THEN
        RAISE NOTICE 'ERROR calling bronze.create_bronze_tables(): %', SQLERRM;
        RAISE;
    END;

    -- Load bronze data
    BEGIN
        RAISE NOTICE 'Calling bronze.load_bronze_data()...';
        CALL bronze.load_bronze_data();
        RAISE NOTICE 'Bronze data loaded successfully';
    EXCEPTION WHEN OTHERS THEN
        RAISE NOTICE 'ERROR calling bronze.load_bronze_data(): %', SQLERRM;
        RAISE;
    END;

    RAISE NOTICE '========================================';
    RAISE NOTICE 'Bronze Layer Procedures Completed';
    RAISE NOTICE '========================================';
END $$;
