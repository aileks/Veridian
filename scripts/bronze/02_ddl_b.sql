/*
 Drop and recreate bronze schema DDL for CRM and ERP source tables
 
 !!!WARNING: THIS SCRIPT IS DESTRUCTIVE!!!
 
 This script creates a stored procedure that drops existing bronze tables 
 if they exist and recreates them. It is safe to run repeatedly but will 
 remove any data currently in those tables in the bronze schema.
*/

CREATE OR REPLACE PROCEDURE bronze.create_bronze_tables()
LANGUAGE plpgsql
AS $$
BEGIN
    RAISE NOTICE '========================================';
    RAISE NOTICE 'SCRIPT START: Creating Bronze Layer Tables';
    RAISE NOTICE 'Creating bronze schema tables';
    RAISE NOTICE '========================================';

    -- CRM Tables
    BEGIN
        RAISE NOTICE 'Dropping table bronze.crm_cust_info if exists...';
        DROP TABLE IF EXISTS bronze.crm_cust_info;
        RAISE NOTICE 'Creating table bronze.crm_cust_info...';
        CREATE TABLE bronze.crm_cust_info (
            cst_id INT,
            cst_key VARCHAR(10),
            cst_firstname VARCHAR(50),
            cst_lastname VARCHAR(50),
            cst_marital_status CHAR(1),
            cst_gndr CHAR(1),
            cst_create_date VARCHAR(50)
        );
        RAISE NOTICE 'Table bronze.crm_cust_info created successfully';
    EXCEPTION WHEN OTHERS THEN
        RAISE NOTICE 'ERROR creating bronze.crm_cust_info: %', SQLERRM;
        RAISE;
    END;

    BEGIN
        RAISE NOTICE 'Dropping table bronze.crm_prd_info if exists...';
        DROP TABLE IF EXISTS bronze.crm_prd_info;
        RAISE NOTICE 'Creating table bronze.crm_prd_info...';
        CREATE TABLE bronze.crm_prd_info (
            prd_id INT,
            prd_key VARCHAR(50),
            prd_nm VARCHAR(50),
            prd_cost INT,
            prd_line CHAR,
            prd_start_dt VARCHAR(50),
            prd_end_dt VARCHAR(50)
        );
        RAISE NOTICE 'Table bronze.crm_prd_info created successfully';
    EXCEPTION WHEN OTHERS THEN
        RAISE NOTICE 'ERROR creating bronze.crm_prd_info: %', SQLERRM;
        RAISE;
    END;

    BEGIN
        RAISE NOTICE 'Dropping table bronze.crm_sales_details if exists...';
        DROP TABLE IF EXISTS bronze.crm_sales_details;
        RAISE NOTICE 'Creating table bronze.crm_sales_details...';
        CREATE TABLE bronze.crm_sales_details (
            sls_ord_num VARCHAR(20),
            sls_prd_key VARCHAR(20),
            sls_cust_id INT,
            sls_order_dt VARCHAR(50),
            sls_ship_dt VARCHAR(50),
            sls_due_dt VARCHAR(50),
            sls_sales INT,
            sls_quantity INT,
            sls_price INT
        );
        RAISE NOTICE 'Table bronze.crm_sales_details created successfully';
    EXCEPTION WHEN OTHERS THEN
        RAISE NOTICE 'ERROR creating bronze.crm_sales_details: %', SQLERRM;
        RAISE;
    END;

    -- ERP Tables
    BEGIN
        RAISE NOTICE 'Dropping table bronze.erp_cust_az12 if exists...';
        DROP TABLE IF EXISTS bronze.erp_cust_az12;
        RAISE NOTICE 'Creating table bronze.erp_cust_az12...';
        CREATE TABLE bronze.erp_cust_az12 (
            cid VARCHAR(20),
            bdate VARCHAR(50),
            gen VARCHAR(10)
        );
        RAISE NOTICE 'Table bronze.erp_cust_az12 created successfully';
    EXCEPTION WHEN OTHERS THEN
        RAISE NOTICE 'ERROR creating bronze.erp_cust_az12: %', SQLERRM;
        RAISE;
    END;

    BEGIN
        RAISE NOTICE 'Dropping table bronze.erp_loc_a101 if exists...';
        DROP TABLE IF EXISTS bronze.erp_loc_a101;
        RAISE NOTICE 'Creating table bronze.erp_loc_a101...';
        CREATE TABLE bronze.erp_loc_a101 (
            cid VARCHAR(20),
            cntry VARCHAR(20)
        );
        RAISE NOTICE 'Table bronze.erp_loc_a101 created successfully';
    EXCEPTION WHEN OTHERS THEN
        RAISE NOTICE 'ERROR creating bronze.erp_loc_a101: %', SQLERRM;
        RAISE;
    END;

    BEGIN
        RAISE NOTICE 'Dropping table bronze.px_cat_g1v2 if exists...';
        DROP TABLE IF EXISTS bronze.px_cat_g1v2;
        RAISE NOTICE 'Creating table bronze.px_cat_g1v2...';
        CREATE TABLE bronze.px_cat_g1v2 (
            id VARCHAR(5),
            cat VARCHAR(50),
            subcat VARCHAR(50),
            maintenance VARCHAR(3)
        );
        RAISE NOTICE 'Table bronze.px_cat_g1v2 created successfully';
    EXCEPTION WHEN OTHERS THEN
        RAISE NOTICE 'ERROR creating bronze.px_cat_g1v2: %', SQLERRM;
        RAISE;
    END;

    RAISE NOTICE '========================================';
    RAISE NOTICE 'SCRIPT END: Creating Bronze Layer Tables';
    RAISE NOTICE 'All bronze tables created successfully';
    RAISE NOTICE '========================================';
END;
$$;