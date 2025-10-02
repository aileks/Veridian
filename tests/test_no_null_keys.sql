-- Test: Check for NULL primary keys
-- Purpose: Ensures key columns essential for joins or identification are not null.

DO $$
DECLARE
    v_null_count INT;
BEGIN
    RAISE NOTICE '========================================';
    RAISE NOTICE 'SCRIPT START: Testing NULL Primary Keys';
    RAISE NOTICE 'Testing for NULL primary keys';
    RAISE NOTICE '========================================';

    BEGIN
        RAISE NOTICE 'Checking bronze.crm_cust_info for NULL cst_id...';
        SELECT COUNT(*) INTO v_null_count
        FROM bronze.crm_cust_info
        WHERE cst_id IS NULL;
        
        RAISE NOTICE 'Table: crm_cust_info, NULL cst_id count: %', v_null_count;
        
        IF v_null_count > 0 THEN
            RAISE NOTICE 'WARNING: Found % NULL values in crm_cust_info.cst_id', v_null_count;
        ELSE
            RAISE NOTICE 'PASS: No NULL values in crm_cust_info.cst_id';
        END IF;
    EXCEPTION WHEN OTHERS THEN
        RAISE NOTICE 'ERROR checking crm_cust_info: %', SQLERRM;
        RAISE;
    END;

    BEGIN
        RAISE NOTICE 'Checking bronze.crm_sales_details for NULL sls_ord_num...';
        SELECT COUNT(*) INTO v_null_count
        FROM bronze.crm_sales_details
        WHERE sls_ord_num IS NULL;
        
        RAISE NOTICE 'Table: crm_sales_details, NULL sls_ord_num count: %', v_null_count;
        
        IF v_null_count > 0 THEN
            RAISE NOTICE 'WARNING: Found % NULL values in crm_sales_details.sls_ord_num', v_null_count;
        ELSE
            RAISE NOTICE 'PASS: No NULL values in crm_sales_details.sls_ord_num';
        END IF;
    EXCEPTION WHEN OTHERS THEN
        RAISE NOTICE 'ERROR checking crm_sales_details: %', SQLERRM;
        RAISE;
    END;

    RAISE NOTICE '========================================';
    RAISE NOTICE 'SCRIPT END: Testing NULL Primary Keys';
    RAISE NOTICE 'NULL key test completed';
    RAISE NOTICE '========================================';
END $$;