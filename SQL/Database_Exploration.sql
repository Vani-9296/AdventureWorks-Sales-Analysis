--Viewing all Schemas
Select * 
From sys.schemas;

--How many schemas are available in the AdventureWorks2019 database?
SELECT COUNT(*)  AS TotalSchemas
FROM sys.schemas

--List all tables available in the AdventureWorks2019 database along with their schema names.
SELECT*
FROM sys.schemas;  --where schema information is stored

SELECT*
FROM sys.tables;  --where table information is stored

--Joining the table
SELECT
s.name AS SchemaName,
t.name AS TableName
FROM sys.tables AS t
INNER JOIN sys.schemas AS s
ON t.schema_id = s.schema_id
ORDER BY
s.name,
t.name;

--How many tables are there in each schema?
SELECT 
s.name AS SchemaName,
Count(t.object_id) AS TotalTables
FROM sys.tables AS t
INNER JOIN sys.schemas AS s
ON t.schema_id = s.schema_id
GROUP BY s.name
ORDER BY TotalTables DESC;

--Identify all Dimension tables (Dim) and Fact tables (Fact).
SELECT name
FROM sys.tables
WHERE name LIKE 'Dim%'
   OR name LIKE 'Fact%';
