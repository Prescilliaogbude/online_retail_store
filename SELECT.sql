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
    TotalQuantitySold DESC
LIMIT 10;