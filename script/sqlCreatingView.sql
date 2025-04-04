-- META DATA LAYER FOR LAKE HOUSE

-- CREATE VIEW CALENDAR
CREATE VIEW gold.calendar
AS
SELECT *
FROM
OPENROWSET (
    BULK 'https://storagedatalakeproject1.blob.core.windows.net/silver/AdventureWorks_Calendar',
    FORMAT = 'PARQUET'
) AS Quer1


-- CREATE VIEW CUSTOMER
CREATE VIEW gold.customer
AS
SELECT *
FROM
OPENROWSET (
    BULK 'https://storagedatalakeproject1.blob.core.windows.net/silver/AdventureWorks_Customers',
    FORMAT = 'PARQUET'
) AS Quer1



-- CREATE VIEW PRODUCT CATEGORIES
CREATE VIEW gold.product_categories
AS
SELECT *
FROM
OPENROWSET (
    BULK 'https://storagedatalakeproject1.blob.core.windows.net/silver/AdventureWorks_Product_Categories',
    FORMAT = 'PARQUET'
) AS Quer1

    

-- CREATE VIEW PRODUCT
CREATE VIEW gold.product
AS
SELECT *
FROM
OPENROWSET (
    BULK 'https://storagedatalakeproject1.blob.core.windows.net/silver/AdventureWorks_Products',
    FORMAT = 'PARQUET'
) AS Quer1


-- CREATE VIEW RETURN
CREATE VIEW gold.return
AS
SELECT *
FROM
OPENROWSET (
    BULK 'https://storagedatalakeproject1.blob.core.windows.net/silver/AdventureWorks_Returns',
    FORMAT = 'PARQUET'
) AS Quer1


-- CREATE VIEW SALES
CREATE VIEW gold.sales
AS
SELECT *
FROM
OPENROWSET (
    BULK 'https://storagedatalakeproject1.blob.core.windows.net/silver/AdventureWorks_Sales',
    FORMAT = 'PARQUET'
) AS Quer1

-- CREATE VIEW TERRITORIES
CREATE VIEW gold.territories
AS
SELECT *
FROM
OPENROWSET (
    BULK 'https://storagedatalakeproject1.blob.core.windows.net/silver/AdventureWorks_Territories',
    FORMAT = 'PARQUET'
) AS Quer1


-- CREATE VIEW PRODUCT SUB CATEGORIES
CREATE VIEW gold.product_sub_category
AS
SELECT *
FROM
OPENROWSET (
    BULK 'https://storagedatalakeproject1.blob.core.windows.net/silver/Product_Subcategories',
    FORMAT = 'PARQUET'
) AS Quer1


CREATE EXTERNAL DATA SOURCE sourSilver WITH
(
    LOCATION = 'https://storagedatalakeproject1.blob.core.windows.net/silver'
)


CREATE EXTERNAL FILE FORMAT formatParquet WITH
(
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compresss.SnappyCodec'
)
