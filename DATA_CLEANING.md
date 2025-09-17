# DATA_CLEANING.md

This document records **data preparation** choices for transparency and reproducibility.

## 1) Field Types
- **Invoice Date** → Date
- **Retailer ID** → Integer
- **Price per Unit**, **Total Sales**, **Operating Profit**, **Operating Margin** → Decimal
- **Units Sold** → Integer
- **Region/State/City/Retailer/Product/Gender/Product Type/Sales Method** → Text

## 2) Integrity & Quality Checks
- **Duplicates**: Check duplicate (Retailer, Invoice Date, Product, City) rows.
- **Nulls**: Ensure no nulls in core metrics: `Units Sold`, `Price per Unit`, `Total Sales`, `Operating Profit`.
- **Consistency**: `Total Sales ≈ Units Sold * Price per Unit` (allow small rounding differences).
- **Profitability**: `Operating Margin = Operating Profit / Total Sales` (if provided, validate; otherwise compute).
- **Outliers**: Flag extreme unit prices and margins for review.

## 3) Transformations
- Standardize product & channel labels (trim, case, punctuation).
- Derive **Year**, **Quarter**, **Month**, **Week** from Invoice Date.
- Normalize **State** names (e.g., "CA" vs "California") if inconsistencies exist.
- Create **Channel Group** from Sales Method (Online / In-store / Outlet).

## 4) Power BI Model Notes
- Use a **Star Schema** (FactSales + DimDate + DimProduct + DimGeo + DimRetailer), even if derived from a single table.
- Add relationships by surrogate keys as needed (e.g., City→State→Region).

## 5) Data Quality SQL
See `sql/` for runnables: schema, quality checks, and basic transforms.

## 6) Assumptions & Limitations
- Prices and margins are pre-tax.
- Invoice Date reflects transaction posting date.
- Operating Margin provided is consistent with Profit/Revenue. Recomputation is necessary.
