/*
Create database and schemas

!!!WARNING: THIS SCRIPT IS DESTRUCTIVE!!!

This script first checks if the database 'Warehouse' exists.
If it does, it drops the database to then created it. Otherwise,
it creates a new database named 'Warehouse' and three schemas:
bronze, silver, and gold.
*/

USE master;

IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'Warehouse')
BEGIN
    ALTER DATABASE Warehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE Warehouse;
END;
GO

CREATE DATABASE Warehouse;
GO

USE Warehouse;
GO

CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO

