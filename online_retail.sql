CREATE TABLE online_retail (
    InvoiceNo VARCHAR(20),
    StockCode VARCHAR(20),
    Description VARCHAR(255),
    Quantity INTEGER,
    InvoiceDate TIMESTAMP,
    UnitPrice NUMERIC,
    CustomerID NUMERIC, -- Changed to NUMERIC
    Country VARCHAR(50)
);

COPY online_retail
FROM 'C:\retail store\online_retail.csv'
DELIMITER ','
CSV HEADER;

SELECT *
       FROM online_retail;

   --Top 10 Products by Revenue:-- 
   


SELECT
    StockCode,
    Description,
    SUM(quantity) AS total_quantity,
    SUM(Quantity * UnitPrice) AS TotalRevenue
FROM
    online_retail
GROUP BY
    StockCode,
    Description
ORDER BY
    TotalRevenue DESC
LIMIT 10;

--Top 10 Selling Products (Quantity):

SELECT
    StockCode,
    Description,
   SUM(Quantity) AS TotalQuantitySold
FROM
    online_retail
GROUP BY
    StockCode,
    Description
ORDER BY
    TotalQuantitySold DESC,

LIMIT 10;

--Monthly Sales Trend (Revenue)

SELECT
    EXTRACT(YEAR FROM InvoiceDate) AS Year,
    EXTRACT(MONTH FROM InvoiceDate) AS Month,
    SUM(Quantity * UnitPrice) AS MonthlyRevenue
FROM
    online_retail
GROUP BY
    Year,
    Month
ORDER BY
    MonthlyRevenue DESC;

---Daily Sales Trend (Quantity)
SELECT
    EXTRACT(DAY FROM InvoiceDate) AS SaleDay,  -- Extracts only the day of the month
    SUM(Quantity) AS DailyQuantitySold
FROM
    online_retail
GROUP BY
    EXTRACT(DAY FROM InvoiceDate)  -- Must match the SELECT clause
ORDER BY
    DailyQuantitySold DESC;


--Top 5 Cancelled Products


SELECT
    StockCode,
    Description,
    COUNT(*) AS CancellationCount
FROM
    online_retail
WHERE
    InvoiceNo LIKE 'C%'
GROUP BY
    StockCode,
    Description
ORDER BY
    CancellationCount DESC
LIMIT 5;


--Top 10 Countries by Total Quantity Sold

SELECT
    Country,
    SUM(Quantity) AS TotalQuantity
FROM
    online_retail
GROUP BY
    Country
ORDER BY
    TotalQuantity DESC
LIMIT 10;