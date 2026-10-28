# SQL Analysis

This folder contains the SQL scripts used to profile, validate, and analyse the telecom customer churn dataset in SQL Server.

## Analysis Areas

- Data profiling and quality checks
- Overall customer churn rate
- Churn by contract type
- Churn by payment method
- Churn by internet service
- Churn by tenure group
- Combined segment analysis to identify retention priorities

## Example: Overall Churn Rate

The following query calculates the number of customers, the number who churned, and the overall churn rate.

```sql
SELECT
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS ChurnedCustomers,
    CAST(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0)
        AS DECIMAL(5,2)
    ) AS ChurnRatePercent
FROM [Telco-Customer-Churn_Staging];
```

## Example: Churn by Contract Type

```sql
SELECT
    Contract,
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS ChurnedCustomers,
    CAST(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0)
        AS DECIMAL(5,2)
    ) AS ChurnRatePercent
FROM [Telco-Customer-Churn_Staging]
GROUP BY Contract
ORDER BY ChurnRatePercent DESC;
```

## Key Validated Findings

- Overall churn rate: **26.54%**
- Month-to-month contract churn rate: **42.71%**
- One-year contract churn rate: **11.27%**
- Two-year contract churn rate: **2.83%**

## Validation

Key churn rates were compared with the Power BI measures to verify consistency. The analysis identifies associations in the data; it does not establish that any single customer characteristic causes churn.
