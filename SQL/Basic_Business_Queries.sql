--What are the top 10 products with the highest sales amount?
SELECT TOP 10
    p.EnglishProductName,
    SUM(f.SalesAmount) AS TotalSales
FROM FactInternetSales AS f
JOIN DimProduct AS p
ON f.ProductKey = p.ProductKey
GROUP BY p.EnglishProductName
ORDER BY TotalSales DESC;

--Which customers made the highest total purchases?
SELECT TOP 10
    c.FirstName,
    c.LastName,
    SUM(f.SalesAmount) AS TotalPurchases
FROM FactInternetSales AS f
JOIN DimCustomer AS c
ON f.CustomerKey = c.CustomerKey
GROUP BY
    c.FirstName,
    c.LastName
ORDER BY TotalPurchases DESC;

--Which product categories generated the highest sales?
SELECT
c.EnglishProductCategoryName,
SUM(f.SalesAmount) AS HighestSales
FROM FactInternetSales AS f
JOIN DimProduct AS p
ON f.ProductKey = p.ProductKey
JOIN DimProductSubcategory AS s
ON p.ProductSubcategoryKey = s.ProductSubcategoryKey
JOIN DimProductCategory AS c
ON s.ProductCategoryKey = c.ProductCategoryKey
GROUP BY
EnglishProductCategoryName
ORDER BY HighestSales DESC;

--Which sales territory has the highest sales?
SELECT
r.SalesTerritoryRegion,
SUM(f.SalesAmount) AS HighestSales
FROM FactInternetSales AS f
JOIN DimSalesTerritory AS r
ON f.SalesTerritoryKey = r.SalesTerritoryKey
GROUP BY
SalesTerritoryRegion
ORDER BY HighestSales DESC;

--What is the total sales amount for each year?
SELECT
c.CalendarYear,
SUM(f.SalesAmount) AS TotalSales
FROM FactInternetSales AS f
JOIN DimDate AS c
ON f.OrderDateKey = c.DateKey
GROUP BY
CalendarYear

--Which year had the highest sales?
SELECT
c.CalendarYear,
SUM(f.SalesAmount) AS HighestSales
FROM FactInternetSales AS f
JOIN DimDate AS c
ON f.OrderDateKey = c.DateKey
GROUP BY CalendarYear
ORDER BY HighestSales DESC;

--What is the average sales amount per order?
SELECT
AVG(SalesAmount) AS AverageSalesPerOrder
FROM FactInternetSales

SELECT
    SUM(SalesAmount) /
    COUNT(DISTINCT SalesOrderNumber) AS AverageSalesPerOrder
FROM FactInternetSales;

--Which countries have the most customers?
SELECT 
g.EnglishCountryRegionName,
COUNT(c.CustomerKey) AS TotalCustomers
FROM DimCustomer AS c
JOIN DimGeography AS g
ON c.GeographyKey = g.GeographyKey
GROUP BY
g.EnglishCountryRegionName
ORDER BY TotalCustomers DESC;
