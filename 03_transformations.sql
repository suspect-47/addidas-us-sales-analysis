-- 03_transformations.sql

-- computed/standardized fields into a clean view
CREATE OR REPLACE VIEW sales_clean AS
SELECT
    retailer,
    retailer_id,
    invoice_date,
    EXTRACT(YEAR FROM invoice_date)::INT AS year,
    TO_CHAR(invoice_date, 'YYYY-MM') AS year_month,
    region,
    state,
    city,
    TRIM(product) AS product,
    TRIM(gender) AS gender,
    TRIM(product_type) AS product_type,
    price_per_unit,
    units_sold,
    (units_sold * price_per_unit) AS total_sales_calc,
    COALESCE(operating_profit, 0) AS operating_profit,
    CASE
        WHEN total_sales IS NOT NULL AND total_sales <> 0 THEN operating_profit / total_sales
        WHEN (units_sold * price_per_unit) <> 0 THEN operating_profit / (units_sold * price_per_unit)
        ELSE NULL
    END AS operating_margin_calc,
    CASE
        WHEN LOWER(sales_method) LIKE '%online%' THEN 'Online'
        WHEN LOWER(sales_method) LIKE '%store%' THEN 'In-store'
        WHEN LOWER(sales_method) LIKE '%outlet%' THEN 'Outlet'
        ELSE 'Other'
    END AS channel_group
FROM sales_adidas_us_2020_2021;
