--Rank the top 10 customers by total sales.
SELECT TOP 10
    RANK() OVER (ORDER BY SUM(f.SalesAmount) DESC) AS CustomerRank,
    c.CustomerKey,
    c.FirstName,
    c.LastName,
    SUM(f.SalesAmount) AS TotalSales
FROM FactInternetSales AS f
JOIN DimCustomer AS c
    ON f.CustomerKey = c.CustomerKey
GROUP BY
    c.CustomerKey,
    c.FirstName,
    c.LastName
ORDER BY
    TotalSales DESC;

--Find the top-selling product in each product category.
WITH ProductSales AS
(
    SELECT
        pc.EnglishProductCategoryName AS ProductCategory,
        p.EnglishProductName AS ProductName,
        SUM(f.SalesAmount) AS TotalSales,
        RANK() OVER
        (
            PARTITION BY pc.EnglishProductCategoryName
            ORDER BY SUM(f.SalesAmount) DESC
        ) AS SalesRank
    FROM FactInternetSales AS f
    JOIN DimProduct AS p
        ON f.ProductKey = p.ProductKey
    JOIN DimProductSubcategory AS ps
        ON p.ProductSubcategoryKey = ps.ProductSubcategoryKey
    JOIN DimProductCategory AS pc
        ON ps.ProductCategoryKey = pc.ProductCategoryKey
    GROUP BY
        pc.EnglishProductCategoryName,
        p.EnglishProductName
)

SELECT
    ProductCategory,
    ProductName,
    TotalSales
FROM ProductSales
WHERE SalesRank = 1
ORDER BY TotalSales DESC;

--Find the total sales for each year using a CTE.
WITH YearlySales AS
(
    SELECT
        YEAR(OrderDate) AS SalesYear,
        SUM(SalesAmount) AS TotalSales
    FROM FactInternetSales
    GROUP BY YEAR(OrderDate)
)

SELECT
    SalesYear,
    TotalSales
FROM YearlySales
ORDER BY SalesYear;
