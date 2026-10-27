# SQL Analysis

This folder contains the SQL scripts used to stage, profile, validate, and analyse the telecom customer churn dataset.

## Planned scripts

- `01_data_profiling.sql` — inspect row counts, missing values, duplicates, data types, and value distributions.
- `02_churn_analysis.sql` — analyse churn by contract, payment method, internet service, and tenure.
- `03_segment_analysis.sql` — investigate combinations of customer characteristics and identify priority retention segments.

All analysis is performed against the staging table in SQL Server. Findings are validated against the Power BI report.
