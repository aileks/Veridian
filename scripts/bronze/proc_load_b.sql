/*
 Truncate and load data into bronze schema tables

 !!!NOTE: THIS SCRIPT IS SAFE TO RE-RUN!!!

 This script first truncates all existing data from the bronze tables
 to prevent duplicates. It then uses the COPY command to bulk load
 data from the corresponding CSV files in the /datasets directory.
*/

-- Load CRM Data
TRUNCATE TABLE bronze.crm_cust_info;
COPY bronze.crm_cust_info
FROM '/datasets/source_crm/cust_info.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

TRUNCATE TABLE bronze.crm_prd_info;
COPY bronze.crm_prd_info
FROM '/datasets/source_crm/prd_info.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

TRUNCATE TABLE bronze.crm_sales_details;
COPY bronze.crm_sales_details
FROM '/datasets/source_crm/sales_details.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

-- Load ERP Data
TRUNCATE TABLE bronze.erp_cust_az12;
COPY bronze.erp_cust_az12
FROM '/datasets/source_erp/CUST_AZ12.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

TRUNCATE TABLE bronze.erp_loc_a101;
COPY bronze.erp_loc_a101
FROM '/datasets/source_erp/LOC_A101.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

TRUNCATE TABLE bronze.px_cat_g1v2;
COPY bronze.px_cat_g1v2
FROM '/datasets/source_erp/PX_CAT_G1V2.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');