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
GO
IF OBJECT_ID('dwh.dim_customer', 'U') IS NOT NULL
    DROP TABLE dwh.dim_customer;
GO	
CREATE TABLE dwh.dim_customer (
    customer_key INT IDENTITY(1,1) PRIMARY KEY,
    customer_name NVARCHAR(255),
    customer_segment NVARCHAR(100) NULL,
    is_active BIT DEFAULT 1,
    inserted_at DATETIME DEFAULT GETDATE()
);
GO
IF OBJECT_ID('dwh.dim_title', 'U') IS NOT NULL
    DROP TABLE dwh.dim_title;	
GO
CREATE TABLE dwh.dim_title (
    title_key INT IDENTITY(1,1) PRIMARY KEY,
    title_name NVARCHAR(255) NOT NULL
);
GO
	IF OBJECT_ID('dwh.dim_recruiter', 'U') IS NOT NULL
    DROP TABLE dwh.dim_recruiter;
GO
CREATE TABLE dwh.dim_recruiter (
    recruiter_key INT IDENTITY(1,1) PRIMARY KEY,
    recruiter_firstname NVARCHAR(100),
    recruiter_lastname NVARCHAR(100),
    email NVARCHAR(255) UNIQUE,
    phone_number NVARCHAR(50) NULL
);

