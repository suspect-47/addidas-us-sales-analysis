-- 02_quality_checks.sql

-- 1) Duplicates by key columns
SELECT retailer, invoice_date, product, city, COUNT(*) AS cnt
FROM sales_adidas_us_2020_2021
GROUP BY 1,2,3,4
HAVING COUNT(*) > 1;

-- 2) Nulls in critical fields
SELECT
    SUM(CASE WHEN units_sold IS NULL THEN 1 ELSE 0 END) AS null_units,
    SUM(CASE WHEN price_per_unit IS NULL THEN 1 ELSE 0 END) AS null_price,
    SUM(CASE WHEN total_sales IS NULL THEN 1 ELSE 0 END) AS null_sales,
    SUM(CASE WHEN operating_profit IS NULL THEN 1 ELSE 0 END) AS null_profit
FROM sales_adidas_us_2020_2021;

-- 3) Consistency: total_sales vs units_sold * price_per_unit
SELECT *
FROM sales_adidas_us_2020_2021
WHERE ABS(total_sales - (units_sold * price_per_unit)) > 0.01;

-- 4) Margin sanity
SELECT *
FROM sales_adidas_us_2020_2021
WHERE operating_margin < -0.2 OR operating_margin > 0.8;
