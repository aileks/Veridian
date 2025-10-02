-- CRM Tables
CREATE TABLE IF NOT EXISTS bronze.crm_cust_info (
    cst_id INT,
    cst_key VARCHAR(10),
    cst_firstname VARCHAR(30),
    cst_lastname VARCHAR(30),
    cst_marital_status CHAR(1),
    cst_gndr CHAR(1),
    cst_create_date DATE
);
CREATE TABLE IF NOT EXISTS bronze.crm_prd_info (
    prd_id INT,
    prd_key VARCHAR(30),
    prd_nm VARCHAR(30),
    prd_cost INT,
    prd_line CHAR,
    prd_start_dt DATE,
    prd_end_dt DATE,
);
CREATE TABLE IF NOT EXISTS bronze.crm_sales_details (
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
CREATE TABLE IF NOT EXISTS bronze.erp_cust_az12 (
    cid VARCHAR(20),
    bdate DATE,
    gen VARCHAR(10)
);
CREATE TABLE IF NOT EXISTS bronze.erp_loc_a101 (cid VARCHAR(20), cntry VARCHAR(20));
CREATE TABLE IF NOT EXISTS bronze.px_cat_g1v2 (
    id VARCHAR(5),
    cat VARCHAR(30),
    subcat VARCHAR(30),
    maintenance VARCHAR(3)
);