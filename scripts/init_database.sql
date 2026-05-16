/*******************************************************************************
Description:    Initializes the Datawarehouse2026 database and sets up the 
                standard Medallion Architecture schemas (Bronze, Silver, Gold).
Author:         Data Engineering Team
Created:        2026
Version:        1.0
Notes:          Includes idempotency checks (IF NOT EXISTS) to allow safe,
                repeated executions.
*******************************************************************************/

-- Switch to master database to perform administrative tasks
USE master;
GO

-- Create the data warehouse database if it does not exist
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'Datawarehouse2026')
BEGIN
    CREATE DATABASE Datawarehouse2026;
END;
GO

-- Switch to the newly created data warehouse database
USE Datawarehouse2026;
GO

-- Create the Bronze schema (Raw data landing zone)
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'bronze')
BEGIN
    EXEC('CREATE SCHEMA bronze;');
END;
GO

-- Create the Silver schema (Cleaned and conformed data)
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'silver')
BEGIN
    EXEC('CREATE SCHEMA silver;');
END;
GO

-- Create the Gold schema (Business-level aggregated data)
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'gold')
BEGIN
    EXEC('CREATE SCHEMA gold;');
END;
GO
