/*
 Truncate and load data into bronze schema tables

 !!!NOTE: THIS SCRIPT IS SAFE TO RE-RUN!!!

 This script creates a stored procedure that first truncates all existing 
 data from the bronze tables to prevent duplicates. It then uses the COPY 
 command to bulk load data from the corresponding CSV files in the /datasets directory.
*/

CREATE OR REPLACE PROCEDURE bronze.load_bronze_data()
LANGUAGE plpgsql
AS $$
BEGIN
    RAISE NOTICE '========================================';
    RAISE NOTICE 'SCRIPT START: Loading Bronze Layer';
    RAISE NOTICE 'Loading data into bronze tables';
    RAISE NOTICE '========================================';

    -- Load CRM Data
    BEGIN
        RAISE NOTICE 'Truncating bronze.crm_cust_info...';
        TRUNCATE TABLE bronze.crm_cust_info;
        RAISE NOTICE 'Loading data into bronze.crm_cust_info from CSV...';
        COPY bronze.crm_cust_info
        FROM '/datasets/source_crm/cust_info.csv'
        WITH (FORMAT csv, HEADER true, DELIMITER ',');
        RAISE NOTICE 'Data loaded successfully into bronze.crm_cust_info';
    EXCEPTION WHEN OTHERS THEN
        RAISE NOTICE 'ERROR loading bronze.crm_cust_info: %', SQLERRM;
        RAISE;
    END;

    BEGIN
        RAISE NOTICE 'Truncating bronze.crm_prd_info...';
        TRUNCATE TABLE bronze.crm_prd_info;
        RAISE NOTICE 'Loading data into bronze.crm_prd_info from CSV...';
        COPY bronze.crm_prd_info
        FROM '/datasets/source_crm/prd_info.csv'
        WITH (FORMAT csv, HEADER true, DELIMITER ',');
        RAISE NOTICE 'Data loaded successfully into bronze.crm_prd_info';
    EXCEPTION WHEN OTHERS THEN
        RAISE NOTICE 'ERROR loading bronze.crm_prd_info: %', SQLERRM;
        RAISE;
    END;

    BEGIN
        RAISE NOTICE 'Truncating bronze.crm_sales_details...';
        TRUNCATE TABLE bronze.crm_sales_details;
        RAISE NOTICE 'Loading data into bronze.crm_sales_details from CSV...';
        COPY bronze.crm_sales_details
        FROM '/datasets/source_crm/sales_details.csv'
        WITH (FORMAT csv, HEADER true, DELIMITER ',');
        RAISE NOTICE 'Data loaded successfully into bronze.crm_sales_details';
    EXCEPTION WHEN OTHERS THEN
        RAISE NOTICE 'ERROR loading bronze.crm_sales_details: %', SQLERRM;
        RAISE;
    END;

    -- Load ERP Data
    BEGIN
        RAISE NOTICE 'Truncating bronze.erp_cust_az12...';
        TRUNCATE TABLE bronze.erp_cust_az12;
        RAISE NOTICE 'Loading data into bronze.erp_cust_az12 from CSV...';
        COPY bronze.erp_cust_az12
        FROM '/datasets/source_erp/CUST_AZ12.csv'
        WITH (FORMAT csv, HEADER true, DELIMITER ',');
        RAISE NOTICE 'Data loaded successfully into bronze.erp_cust_az12';
    EXCEPTION WHEN OTHERS THEN
        RAISE NOTICE 'ERROR loading bronze.erp_cust_az12: %', SQLERRM;
        RAISE;
    END;

    BEGIN
        RAISE NOTICE 'Truncating bronze.erp_loc_a101...';
        TRUNCATE TABLE bronze.erp_loc_a101;
        RAISE NOTICE 'Loading data into bronze.erp_loc_a101 from CSV...';
        COPY bronze.erp_loc_a101
        FROM '/datasets/source_erp/LOC_A101.csv'
        WITH (FORMAT csv, HEADER true, DELIMITER ',');
        RAISE NOTICE 'Data loaded successfully into bronze.erp_loc_a101';
    EXCEPTION WHEN OTHERS THEN
        RAISE NOTICE 'ERROR loading bronze.erp_loc_a101: %', SQLERRM;
        RAISE;
    END;

    BEGIN
        RAISE NOTICE 'Truncating bronze.px_cat_g1v2...';
        TRUNCATE TABLE bronze.px_cat_g1v2;
        RAISE NOTICE 'Loading data into bronze.px_cat_g1v2 from CSV...';
        COPY bronze.px_cat_g1v2
        FROM '/datasets/source_erp/PX_CAT_G1V2.csv'
        WITH (FORMAT csv, HEADER true, DELIMITER ',');
        RAISE NOTICE 'Data loaded successfully into bronze.px_cat_g1v2';
    EXCEPTION WHEN OTHERS THEN
        RAISE NOTICE 'ERROR loading bronze.px_cat_g1v2: %', SQLERRM;
        RAISE;
    END;

    RAISE NOTICE '========================================';
    RAISE NOTICE 'SCRIPT END: Loading Bronze Layer';
    RAISE NOTICE 'All data loaded successfully';
    RAISE NOTICE '========================================';
END;
$$;