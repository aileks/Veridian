/*
 Drop and recreate bronze schema DDL for CRM and ERP source tables
 
 !!!WARNING: THIS SCRIPT IS DESTRUCTIVE!!!
 
 This script drops existing bronze tables if they exist and recreates them.
 It is safe to run repeatedly but will remove any data currently in those
 tables in the bronze schema.
 */
-- CRM Tables
DROP TABLE IF EXISTS bronze.crm_cust_info;
CREATE TABLE bronze.crm_cust_info (
    cst_id INT,
    cst_key VARCHAR(10),
    cst_firstname VARCHAR(30),
    cst_lastname VARCHAR(30),
    cst_marital_status CHAR(1),
    cst_gndr CHAR(1),
    cst_create_date DATE
);
DROP TABLE IF EXISTS bronze.crm_prd_info;
CREATE TABLE bronze.crm_prd_info (
    prd_id INT,
    prd_key VARCHAR(30),
    prd_nm VARCHAR(30),
    prd_cost INT,
    prd_line CHAR,
    prd_start_dt DATE,
    prd_end_dt DATE
);
DROP TABLE IF EXISTS bronze.crm_sales_details;
CREATE TABLE bronze.crm_sales_details (
    sls_ord_num VARCHAR(20),
    sls_prd_key VARCHAR(20),
    sls_cust_id INT,
    sls_order_dt DATE,
    sls_ship_dt DATE,
    sls_due_dt DATE,
    sls_sales INT,
    sls_quantity INT,
    sls_price INT
);
-- ERP Tables
DROP TABLE IF EXISTS bronze.erp_cust_az12;
CREATE TABLE bronze.erp_cust_az12 (
    cid VARCHAR(20),
    bdate DATE,
    gen VARCHAR(10)
);
DROP TABLE IF EXISTS bronze.erp_loc_a101;
CREATE TABLE bronze.erp_loc_a101 (cid VARCHAR(20), cntry VARCHAR(20));
DROP TABLE IF EXISTS bronze.px_cat_g1v2;
CREATE TABLE bronze.px_cat_g1v2 (
    id VARCHAR(5),
    cat VARCHAR(30),
    subcat VARCHAR(30),
    maintenance VARCHAR(3)
);