# Airline Passenger Satisfaction Analysis
### Predicting Dissatisfaction Before It Costs the Business

![Python](https://img.shields.io/badge/Python-3.9-blue)
![SQL](https://img.shields.io/badge/SQL-SQLite-orange)
![PowerBI](https://img.shields.io/badge/Power%20BI-Dashboard-yellow)
![ML](https://img.shields.io/badge/ML-Random%20Forest-green)

## Project Overview

This project analyzes 103,904 airline passenger survey responses to identify 
who is most dissatisfied, what drives that dissatisfaction, and what it costs 
the airline in lost revenue.

A Random Forest ML model was built to predict passenger dissatisfaction with 
**94.48% accuracy** — beating the 56.6% baseline by 37.88 percentage points.

The analysis identified **$14.7M in revenue at risk** from dissatisfied passengers, 
with Business class accounting for 51.6% of that figure despite having the lowest 
dissatisfaction rate — proving that dissatisfaction rate alone is a misleading metric.

## Business Questions Answered

| # | Question | Method |
|---|---|---|
| BQ1 | What type of passengers are most dissatisfied? | Python EDA + SQL |
| BQ2 | What service factors drive dissatisfaction? | Correlation Analysis + ML Feature Importance |
| BQ3 | Can we predict who will be dissatisfied? | Random Forest Classifier |
| BQ4 | What is the financial cost of dissatisfaction? | Revenue Modeling + SQL CTE |

## Key Findings

### Who is most dissatisfied? (BQ1)
- **Economy class** passengers have an 81.4% dissatisfaction rate — 2.7x higher than Business class (30.6%)
- **Personal travelers** are nearly twice as dissatisfied as business travelers (89.8% vs 41.7%)
- **Under 18 and 60+** age groups are most at risk (82.7% and 79.2% respectively)
- Middle-aged business travelers (46-60) are the most satisfied segment at 42.6%

### What drives dissatisfaction? (BQ2)
- **Online boarding** is the #1 driver (correlation: -0.504) — confirmed by both correlation analysis and ML feature importance
- **Inflight entertainment** is the #2 driver (correlation: -0.398)
- **Seat comfort** is the #3 driver (correlation: -0.349)
- **Gate location** has near-zero impact (-0.001) — lowest priority for improvement
- 3 of the top 5 ML features are technology-related — the airline's biggest problem is its digital experience

### ML Model Performance (BQ3)
- Random Forest Classifier: **94.48% accuracy** vs 56.6% baseline
- Correctly identified 10,574 out of 11,403 dissatisfied passengers (92.7%)
- Precision: 95% — when model flags dissatisfied, it's right 95% of the time
- Both correlation analysis and ML feature importance independently rank Online boarding #1

### Financial Impact (BQ4)
- Total revenue at risk: **$14,711,600**
- Business class: $7,592,500 (51.6% of total) despite only 30.6% dissatisfaction rate
- Each dissatisfied Business passenger represents $500 in lost revenue
- Fixing online boarding would have the highest financial return as it affects all classes equally

## Tools & Technologies

| Tool | Purpose |
|---|---|
| Python (pandas, matplotlib, seaborn) | Data cleaning, EDA, visualisation |
| scikit-learn | Random Forest ML model |
| SQL (SQLite) | Business queries, CTEs, window functions |
| Power BI | Interactive 3-page dashboard |
| Jupyter Notebook | Analysis environment |
| GitHub | Version control and portfolio hosting |

## Project Structure

airline-passenger-satisfaction/
├── data/
│   ├── cleaned_data.csv          # Cleaned training dataset
│   ├── correlations.csv          # Service factor correlations
│   ├── feature_importance.csv    # ML model feature importance scores
│   └── revenue_summary.csv       # Revenue at risk by class
├── notebook/
│   ├── 01_eda.ipynb              # EDA, correlation analysis, financial impact
│   ├── 02_sql_analysis.ipynb     # SQL queries via SQLite
│   └── 03_ml_model.ipynb         # Random Forest model, evaluation, feature importance
├── sql/
│   └── analysis_queries.sql      # All SQL queries with comments
├── dashboard/
│   └── satisfaction_dashboard.pbix  # Power BI dashboard (3 pages)
└── README.md

## How to Run

### Prerequisites
pip install pandas numpy matplotlib seaborn scikit-learn jupyter

### Steps
1. Clone the repository:
git clone https://github.com/Likhitha37/airline-passenger-satisfaction.git
2. Download the dataset from Kaggle:
   - [Airline Passenger Satisfaction](https://www.kaggle.com/datasets/teejmahal20/airline-passenger-satisfaction)
   - Place `train.csv` and `test.csv` in the `data/` folder

3. Run notebooks in order:
   - `01_eda.ipynb` — EDA and financial analysis
   - `02_sql_analysis.ipynb` — SQL queries
   - `03_ml_model.ipynb` — ML model

4. Open `dashboard/satisfaction_dashboard.pbix` in Power BI Desktop

### Data Source
Kaggle — [Airline Passenger Satisfaction](https://www.kaggle.com/datasets/teejmahal20/airline-passenger-satisfaction) by TJ Klein

> **Note:** Revenue per passenger is estimated using industry averages
> (Business: $500, Eco Plus: $250, Eco: $150). Actual figures would
> require ticket price data not available in this dataset.


