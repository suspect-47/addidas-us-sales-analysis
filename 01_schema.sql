-- 01_schema.sql
-- Example schema to stage the Adidas sales table
CREATE TABLE IF NOT EXISTS sales_adidas_us_2020_2021 (
    retailer TEXT,
    retailer_id BIGINT,
    invoice_date DATE,
    region TEXT,
    state TEXT,
    city TEXT,
    product TEXT,
    gender TEXT,
    product_type TEXT,
    price_per_unit NUMERIC(12,2),
    units_sold INTEGER,
    total_sales NUMERIC(14,2),
    operating_profit NUMERIC(14,2),
    operating_margin NUMERIC(6,4),
    sales_method TEXT
);
