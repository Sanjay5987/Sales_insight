--Looking at the whole dataset

SELECT * FROM portfolioproject..salesdata

--Making required updates

ALTER TABLE portfolioproject..salesdata
DROP COLUMN order_date

--Lokking at year-wise Sales data

SELECT Year, AVG(CAST(sales_amount AS NUMERIC(38))) as avgsales_in_rupees, SUM(CAST(sales_amount AS NUMERIC(38))) AS totalsales_in_rupees
, AVG(CAST(sales_qty AS NUMERIC(5))) AS avgsalesqty, SUM(sales_qty) AS totalsalesqty
FROM portfolioproject..salesdata
GROUP BY Year
ORDER BY Year DESC

--Month-wise Sales data

SELECT Month, AVG(CAST(sales_amount AS NUMERIC(38))) AS avgsales_in_rupees, SUM(CAST(sales_amount AS NUMERIC(38))) AS totalsales_in_rupees
FROM portfolioproject..salesdata
GROUP BY Month
ORDER BY avgsales_in_rupees DESC

--Customers
SELECT customer_name, market_zone, SUM(CAST(sales_amount AS NUMERIC(38))) AS totalsales_in_rupees
, AVG(CAST(sales_amount AS NUMERIC(38))) AS avgsales_in_rupees
FROM portfolioproject..salesdata
where sales_amount <> 0
GROUP BY customer_name, market_zone
ORDER BY totalsales_in_rupees DESC

--City-wise Sales report
SELECT markets_name, SUM(CAST(sales_amount AS NUMERIC(38))) AS totalsales_in_rupees
, AVG(CAST(sales_amount AS NUMERIC(38))) AS avgsales_in_rupees
FROM portfolioproject..salesdata
GROUP BY markets_name
ORDER BY totalsales_in_rupees DESC

--Looking at foreign sales
SELECT product_code, sales_qty, sales_amount,currency,Year,Month,markets_name,customer_name,market_zone,Product_type,customer_type
FROM portfolioproject..salesdata
WHERE currency = 'USD'