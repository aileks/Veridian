-- Test: Check for NULL primary keys
-- Purpose: Ensures key columns essential for joins or identification are not null.

SELECT 'crm_cust_info' AS table_name,
    COUNT(*) AS null_cst_id_count
FROM bronze.crm_cust_info
WHERE cst_id IS NULL;
SELECT 'crm_sales_details' AS table_name,
    COUNT(*) AS null_sls_ord_num_count
FROM bronze.crm_sales_details
WHERE sls_ord_num IS NULL;