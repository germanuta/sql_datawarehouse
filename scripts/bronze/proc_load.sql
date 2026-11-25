
--CREATE OR ALTER PROCEDURE bronze.load_bronze AS--
--BEGIN--
DECLARE @start_time DATETIME, @end_time DATETIME;
    PRINT'===============================================';
    PRINT 'Loading Bronze Layer';
    PRINT '==============================================';


    PRINT '_______________________________________________';
    PRINT 'Loading CRM Tables';
    PRINT '_______________________________________________';


    PRINT '________________________________________'
    PRINT 'Loading CRM Tables';
    PRINT '________________________________________'

    SET @start_time =GETDATE()

    PRINT '>> Truncating Table: bronze.crm_cust_info;'
    TRUNCATE TABLE bronze.crm_cust_info;

    SET DATEFORMAT ymd;
    PRINT '>> Inserting Data Into: bronze.crm_cust_info';

    BULK INSERT bronze.crm_cust_info
    FROM 'C:\Users\HP\Desktop\dwh\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n',
        TABLOCK
    );
    SET @end_time = GETDATE();

    PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';

    SET @start_time =GETDATE()

    PRINT '>> Truncating Table: bronze.crm_prd_info;'
    TRUNCATE TABLE bronze.crm_prd_info;
    SET DATEFORMAT ymd;
    PRINT '>> Inserting Data Into: bronze.crm_prd_info';
    BULK INSERT bronze.crm_prd_info
    FROM 'C:\Users\HP\Desktop\dwh\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n',
        TABLOCK
    );
    SET @end_time = GETDATE();
    PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';

    SET @start_time =GETDATE()

    PRINT '>> Truncating Table:bronze.crm_sales_details;'
    TRUNCATE TABLE bronze.crm_sales_details;
    SET DATEFORMAT ymd;
    PRINT '>> Inserting Data Into: crm_sales_details'
    BULK INSERT bronze.crm_sales_details
    FROM 'C:\Users\HP\Desktop\dwh\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n',
        TABLOCK
    );
    SET @end_time = GETDATE();
    PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
    SET @start_time =GETDATE()
    PRINT '>> Truncating Table: bronze.erp_loc_a101;'
    TRUNCATE TABLE bronze.erp_loc_a101;
    PRINT '>> Inserting Data Into: bronze.erp_loc_a101'
    SET DATEFORMAT ymd;
    BULK INSERT bronze.erp_loc_a101
    FROM 'C:\Users\HP\Desktop\dwh\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n',
        TABLOCK
    );

    SET @start_time =GETDATE()
    TRUNCATE TABLE bronze.erp_cust_az12;
    SET DATEFORMAT ymd;
    PRINT '>> Inserting Data Into: bronze.erp_cust_az12'
    BULK INSERT bronze.erp_cust_az12
    FROM 'C:\Users\HP\Desktop\dwh\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n',
        TABLOCK
    );
    SET @end_time = GETDATE();
    PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
    SET @start_time =GETDATE()
    TRUNCATE TABLE bronze.erp_px_cat_g1v2;
    SET DATEFORMAT ymd;
    BULK INSERT bronze.erp_px_cat_g1v2
    FROM 'C:\Users\HP\Desktop\dwh\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n',
        TABLOCK
    );
    SET @end_time = GETDATE()
    PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
--END


   
