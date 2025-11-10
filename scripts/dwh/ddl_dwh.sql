/*
===============================================================================
DDL Script: Create DWH Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'dwh' schema, dropping existing tables 
    if they already exist.
	  Run this script to re-define the DDL structure of 'stg' Tables
===============================================================================
*/

IF OBJECT_ID('dwh.dim_date', 'U') IS NOT NULL
    DROP TABLE dwh.dim_date;
GO

CREATE TABLE dwh.dim_date (
    date_key INT PRIMARY KEY,       
    full_date DATE,
    day INT,
    month INT,
    month_name NVARCHAR(20),
    quarter INT,
    year INT,
    day_of_week INT,
    day_name NVARCHAR(20),
    is_weekend BIT
);
