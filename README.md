# AdventureWorks Internet Sales Analysis

## Project Overview

This project analyses internet sales data from the **AdventureWorksDW2019** database using SQL Server and Power BI.

The objective of the project was to explore the database, answer key business questions using SQL, and build an interactive Power BI dashboard to present sales performance, customer behaviour, product performance, and regional sales trends.

The project demonstrates an end-to-end data analysis workflow including:

- Database exploration
- SQL querying and business analysis
- Data cleaning using Power Query
- Data modelling in Power BI
- DAX measure creation
- Interactive dashboard development
- Business insight generation


## Tools Used

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- Power BI Desktop
- Power Query
- DAX
- GitHub


## Dataset

The project uses the AdventureWorksDW2019 sample data warehouse.

The main tables used in the analysis were:

- FactInternetSales
- DimProduct
- DimProductSubcategory
- DimProductCategory
- DimCustomer
- DimGeography
- DimDate
- DimSalesTerritory


## SQL Analysis

### 1. Database Exploration

The first stage involved understanding the structure of the AdventureWorksDW2019 database.

Analysis included:

- Viewing all database schemas
- Counting the number of schemas
- Listing tables with their schema names
- Counting tables within each schema
- Identifying Fact and Dimension tables


### 2. Basic Business Analysis

SQL queries were created to answer business questions such as:

- What are the top 10 products by sales?
- Which customers generated the highest total sales?
- Which product categories generated the highest sales?
- Which sales territories generated the highest revenue?
- What were total sales by year?
- Which year generated the highest sales?
- What was the average order value?
- Which countries had the most customers?


### 3. Intermediate SQL Analysis

Intermediate SQL techniques were used to perform more detailed analysis.

Examples include:

- Ranking the top 10 customers by total sales
- Finding the top-selling product within each product category
- Calculating yearly sales using Common Table Expressions (CTEs)

SQL concepts demonstrated include:

- JOINs
- GROUP BY
- Aggregate functions
- TOP
- ORDER BY
- CTEs
- RANK()
- Window functions
- PARTITION BY


## Power BI Data Preparation

The required AdventureWorks tables were imported from SQL Server into Power BI.

Power Query was used to:

- Remove unnecessary columns
- Retain fields required for analysis
- Check data types
- Prepare dimension and fact tables for modelling


## Data Model

A relational model was created around `FactInternetSales`.

Relationships were established between:

- FactInternetSales and DimProduct
- FactInternetSales and DimCustomer
- FactInternetSales and DimDate
- FactInternetSales and DimSalesTerritory
- DimProduct and DimProductSubcategory
- DimProductSubcategory and DimProductCategory
- DimCustomer and DimGeography

This allows dimension tables to filter the internet sales fact table throughout the dashboard.


## DAX Measures

The following key measures were created:

- Total Sales
- Total Orders
- Total Customers
- Total Quantity
- Average Order Value


## Dashboard

The Power BI dashboard provides an interactive overview of AdventureWorks internet sales.

### KPI Summary

- **Total Sales:** $29.36M
- **Total Customers:** 18K
- **Total Orders:** 28K
- **Total Quantity:** 60K
- **Average Order Value:** $1,061.45

### Dashboard Visuals

The dashboard includes:

- Sales by Year
- Top 10 Products by Sales
- Sales by Product Category
- Sales by Territory
- Top 10 Customers by Total Sales
- Top-Selling Product by Category

Interactive slicers allow users to filter the dashboard by:

- Year
- Product Category


## Key Insights

Some of the main findings from the analysis include:

- Internet sales totalled approximately **$29.36 million**.
- **2013 generated the highest annual sales**, at approximately **$16.4 million**.
- **Bikes were the dominant product category**, generating substantially more revenue than Accessories and Clothing.
- **Australia was the highest-performing sales territory**.
- Several **Mountain-200** bicycle models appeared among the highest-selling individual products.
- The interactive dashboard allows product and sales performance to be analysed dynamically by year and product category.


## Project Structure

```text
AdventureWorks-Sales-Analysis/
│
├── README.md
│
├── SQL/
│   ├── 01_Database_Exploration.sql
│   ├── 02_Basic_Business_Queries.sql
│   └── 03_Intermediate_SQL_Analysis.sql
│
├── PowerBI/
│   └── AdventureWorks_Internet_Sales_Dashboard.pbix
│
└── Images/
    ├── Dashboard_Overview.png
    └── Data_Model.png
