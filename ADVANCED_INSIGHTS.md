# ADVANCED_INSIGHTS.md

Ideas to differentiate your analysis (document results later; no EDA here).

## 1) Forecasting (Channel-Level)
- Aggregate monthly `Total Sales` by **Sales Method**.
- Build seasonal models (ARIMA/ETS/Prophet) per channel.
- Output: 3–6 month forecast with accuracy metrics (MAPE).

## 2) Price Elasticity (Category-Level)
- Regress `Units Sold` on `Price per Unit`, controlling for month and region.
- Output: elasticity estimate by Product Type (e.g., Apparel, Footwear).

## 3) Profitability by Channel & Retailer
- Compare `Operating Margin` distributions across Online/In-store/Outlet and by top retailers.
- Flag channels with high revenue but low margin.

## 4) Inventory Signals (Heuristic)
- Compute **turnover proxy**: Units Sold / Month, by Product.
- Highlight SKUs with consistent growth (replenishment candidates).

## 5) Playbook
- Present insights as **actions**: increase online stock for top products in West region; promote bundles where elasticity is low; renegotiate margins with underperforming retailers.
