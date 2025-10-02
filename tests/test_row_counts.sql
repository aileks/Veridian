-- Test: Check if all tables were loaded with data
-- Purpose: Verifies that the COPY command successfully loaded rows into each table.

SELECT 'crm_cust_info' AS table_name, COUNT(*) AS number_of_rows FROM bronze.crm_cust_info;
SELECT 'crm_prd_info' AS table_name, COUNT(*) AS number_of_rows FROM bronze.crm_prd_info;
SELECT 'crm_sales_details' AS table_name, COUNT(*) AS number_of_rows FROM bronze.crm_sales_details;
SELECT 'erp_cust_az12' AS table_name, COUNT(*) AS number_of_rows FROM bronze.erp_cust_az12;
SELECT 'erp_loc_a101' AS table_name, COUNT(*) AS number_of_rows FROM bronze.erp_loc_a101;
SELECT 'px_cat_g1v2' AS table_name, COUNT(*) AS number_of_rows FROM bronze.px_cat_g1v2;