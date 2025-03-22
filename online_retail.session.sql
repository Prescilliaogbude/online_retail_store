SELECT
    StockCode,
    Description,
    SUM(Quantity) AS TotalQuantitySold
FROM
    online_retail.csv
GROUP BY
    StockCode,
    Description
ORDER BY
    TotalQuantitySold DESC
LIMIT 10;