# Telecom Customer Churn & Retention Analysis

## Problem Statement

Customer churn is an important business problem for telecommunications companies because losing customers can affect customer retention and long-term revenue.

This project analyses customer data to identify patterns associated with churn. It examines contract types, payment methods, internet services, customer tenure, and selected service features.

The objective is to help a business identify customer groups that may warrant further investigation and develop evidence-based retention recommendations.

## Business Questions

This project investigates the following questions:

1. What percentage of customers have churned?
2. How does churn vary across month-to-month, one-year, and two-year contracts?
3. Which payment methods are associated with higher churn rates?
4. How does churn differ between fiber optic, DSL, and customers without internet service?
5. How does customer tenure relate to churn?
6. Which combination of customer characteristics identifies a high-priority retention segment?
7. How can these findings inform customer onboarding and retention strategies?

The analysis focuses on identifying patterns and potential areas for further investigation. The observed relationships do not establish causation.

## Dataset

- **Source:** [Telco Customer Churn — Kaggle](https://www.kaggle.com/datasets/blastchar/telco-customer-churn)
- **Records:** 7,043 customers
- **Target field:** Churn
- **Data domains:** Customer demographics, account information, contract details, services, charges, and churn status

## Tools Used

- **SQL Server:** Data profiling, data-quality checks, and analytical queries
- **Power Query:** Data types and data preparation
- **Power BI:** Data modelling and interactive dashboards
- **DAX:** Measures and calculated columns
- **Excel:** Independent validation of results

## Steps Followed

1. Imported the dataset into SQL Server staging.
2. Profiled customer records and checked for duplicate IDs, missing identifiers, invalid values, and service inconsistencies.
3. Investigated missing values in `TotalCharges`.
4. Preserved 11 missing `TotalCharges` values rather than replacing them with invented amounts.
5. Connected Power BI to SQL Server and checked data types and data quality in Power Query.
6. Created DAX measures for total customers, churned customers, churn rate, and retention rate.
7. Developed an interactive report covering overall churn, contract types, payment methods, internet services, tenure groups, and priority customer segments.
8. Compared key Power BI results with SQL calculations to validate the findings.

## Data Quality and Validation

Before analysing churn, I profiled the dataset in SQL Server to check data completeness, uniqueness, valid ranges, and consistency.

- **Dataset size:** 7,043 customer records.
- **Customer IDs:** No duplicate or blank customer IDs were found.
- **Missing values:** 11 records had missing `TotalCharges` values. These records had a tenure of 0 months and were retained as missing rather than replaced with assumed values.
- **Numeric validation:** Checked tenure and monthly charges for invalid values.
- **Service consistency:** Checked whether internet-related service values aligned with `InternetService`, and whether `MultipleLines` values aligned with `PhoneService`.
- **Cross-tool validation:** Compared key churn metrics from SQL Server with Power BI measures to verify consistency.

These checks helped establish a reliable basis for the churn analysis.

## Key Findings

- **Overall churn rate:** 26.54% (1,869 of 7,043 customers).
- **Month-to-month contracts:** 42.71% churn rate.
- **One-year contracts:** 11.27% churn rate.
- **Two-year contracts:** 2.83% churn rate.
- **Electronic-check customers:** 45.29% churn rate.
- **Fiber-optic customers:** 41.89% churn rate.
- **Customers with 0–12 months of tenure:** 47.44% churn rate.

### Priority Segment

Month-to-month customers with 12 months or less of tenure and no online security:

- Customers in segment: 1,370
- Churned customers: 845
- Segment churn rate: 61.68%
- Share of all churned customers: 45.21%

## Business Recommendations

- Investigate onboarding and early customer experiences.
- Review billing processes and payment-related complaints.
- Examine service adoption, support needs, and cancellation feedback.
- Use customer feedback and further analysis to evaluate potential retention interventions.

These findings indicate associations in the dataset; they do not establish that any particular factor causes churn.

## Project Limitations

- The analysis is based on the supplied dataset and its recorded customer attributes.
- Observed relationships should not be interpreted as proof of causation.
- Retention recommendations require further investigation and testing before their effectiveness can be established.

## Dashboard Preview

### 1. Churn Overview
![Telecom Customer Churn Dashboard](Power%20Bi/Telecom%20customer%20Churn%20Dashboard.png)

### 2. Customer Insights
![Telecom Customer Churn Insights](Power%20Bi/Telecom%20customer%20Churn%20Insights.png)

### 3. Deeper Analysis
![Telecom Customer Churn Deeper Analysis](Power%20Bi/Telecom%20customer%20Churn%20Deeper%20Analysis.png)

## Project Files

- **Power BI Report:** [Download the PBIX report](Power%20Bi/Telecom%20Customer%20Churn%20Analysis.pbix)
- **SQL Analysis:** See the [`sql`](sql/) folder.
- **Power BI Screenshots:** See the [`Power Bi`](Power%20Bi/) folder.
