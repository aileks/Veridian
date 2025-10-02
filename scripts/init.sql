/*
 Create database and schemas
 
 !!!WARNING: THIS SCRIPT IS DESTRUCTIVE!!!
 
 This script first checks if the database 'Warehouse' exists.
 If it does, it drops the database to then created it. Otherwise,
 it creates a new database named 'Warehouse' and three schemas:
 bronze, silver, and gold.
 */
-- Terminate any active connections
SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname = 'Warehouse';
-- Drop and recreate the database
DROP DATABASE IF EXISTS Warehouse;
CREATE DATABASE Warehouse;
USE Warehouse;
CREATE SCHEMA IF NOT EXISTS bronze;
CREATE SCHEMA IF NOT EXISTS silver;
CREATE SCHEMA IF NOT EXISTS gold;