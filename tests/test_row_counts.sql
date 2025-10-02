-- Test: Check if all tables were loaded with data
-- Purpose: Verifies that the COPY command successfully loaded rows into each table.

DO $$
DECLARE
    v_row_count INT;
BEGIN
    RAISE NOTICE '========================================';
    RAISE NOTICE 'SCRIPT START: Validating Row Counts';
    RAISE NOTICE 'Testing row counts for all tables';
    RAISE NOTICE '========================================';

    BEGIN
        RAISE NOTICE 'Counting rows in bronze.crm_cust_info...';
        SELECT COUNT(*) INTO v_row_count FROM bronze.crm_cust_info;
        RAISE NOTICE 'Table: crm_cust_info, Row count: %', v_row_count;
        
        IF v_row_count = 0 THEN
            RAISE NOTICE 'WARNING: bronze.crm_cust_info has no rows';
        ELSE
            RAISE NOTICE 'PASS: bronze.crm_cust_info contains data';
        END IF;
    EXCEPTION WHEN OTHERS THEN
        RAISE NOTICE 'ERROR counting crm_cust_info: %', SQLERRM;
        RAISE;
    END;

    BEGIN
        RAISE NOTICE 'Counting rows in bronze.crm_prd_info...';
        SELECT COUNT(*) INTO v_row_count FROM bronze.crm_prd_info;
        RAISE NOTICE 'Table: crm_prd_info, Row count: %', v_row_count;
        
        IF v_row_count = 0 THEN
            RAISE NOTICE 'WARNING: bronze.crm_prd_info has no rows';
        ELSE
            RAISE NOTICE 'PASS: bronze.crm_prd_info contains data';
        END IF;
    EXCEPTION WHEN OTHERS THEN
        RAISE NOTICE 'ERROR counting crm_prd_info: %', SQLERRM;
        RAISE;
    END;

    BEGIN
        RAISE NOTICE 'Counting rows in bronze.crm_sales_details...';
        SELECT COUNT(*) INTO v_row_count FROM bronze.crm_sales_details;
        RAISE NOTICE 'Table: crm_sales_details, Row count: %', v_row_count;
        
        IF v_row_count = 0 THEN
            RAISE NOTICE 'WARNING: bronze.crm_sales_details has no rows';
        ELSE
            RAISE NOTICE 'PASS: bronze.crm_sales_details contains data';
        END IF;
    EXCEPTION WHEN OTHERS THEN
        RAISE NOTICE 'ERROR counting crm_sales_details: %', SQLERRM;
        RAISE;
    END;

    BEGIN
        RAISE NOTICE 'Counting rows in bronze.erp_cust_az12...';
        SELECT COUNT(*) INTO v_row_count FROM bronze.erp_cust_az12;
        RAISE NOTICE 'Table: erp_cust_az12, Row count: %', v_row_count;
        
        IF v_row_count = 0 THEN
            RAISE NOTICE 'WARNING: bronze.erp_cust_az12 has no rows';
        ELSE
            RAISE NOTICE 'PASS: bronze.erp_cust_az12 contains data';
        END IF;
    EXCEPTION WHEN OTHERS THEN
        RAISE NOTICE 'ERROR counting erp_cust_az12: %', SQLERRM;
        RAISE;
    END;

    BEGIN
        RAISE NOTICE 'Counting rows in bronze.erp_loc_a101...';
        SELECT COUNT(*) INTO v_row_count FROM bronze.erp_loc_a101;
        RAISE NOTICE 'Table: erp_loc_a101, Row count: %', v_row_count;
        
        IF v_row_count = 0 THEN
            RAISE NOTICE 'WARNING: bronze.erp_loc_a101 has no rows';
        ELSE
            RAISE NOTICE 'PASS: bronze.erp_loc_a101 contains data';
        END IF;
    EXCEPTION WHEN OTHERS THEN
        RAISE NOTICE 'ERROR counting erp_loc_a101: %', SQLERRM;
        RAISE;
    END;

    BEGIN
        RAISE NOTICE 'Counting rows in bronze.px_cat_g1v2...';
        SELECT COUNT(*) INTO v_row_count FROM bronze.px_cat_g1v2;
        RAISE NOTICE 'Table: px_cat_g1v2, Row count: %', v_row_count;
        
        IF v_row_count = 0 THEN
            RAISE NOTICE 'WARNING: bronze.px_cat_g1v2 has no rows';
        ELSE
            RAISE NOTICE 'PASS: bronze.px_cat_g1v2 contains data';
        END IF;
    EXCEPTION WHEN OTHERS THEN
        RAISE NOTICE 'ERROR counting px_cat_g1v2: %', SQLERRM;
        RAISE;
    END;

    RAISE NOTICE '========================================';
    RAISE NOTICE 'SCRIPT END: Validating Row Counts';
    RAISE NOTICE 'Row count test completed';
    RAISE NOTICE '========================================';
END $$;