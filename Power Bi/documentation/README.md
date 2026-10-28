# Project Documentation

## Project Overview

This project analyses telecom customer churn to identify customer groups associated with higher churn rates and potential retention opportunities.

## Dataset

The project uses the Telco Customer Churn dataset from Kaggle.

Source: https://www.kaggle.com/datasets/blastchar/telco-customer-churn

The dataset contains 7,043 customer records.

## Tools Used

- SQL Server — data profiling, validation, and churn analysis
- Power Query — data preparation and type handling
- Power BI — interactive dashboard and DAX measures
- Excel — independent validation of selected results

## How to Review the Project

1. Review the main README for the business questions, findings, and dashboard previews.
2. Review the SQL folder for the analysis queries and documentation.
3. Open the Power BI report using Power BI Desktop to explore the report pages.
4. Review the documented findings and limitations before interpreting the results.

## Data Quality Notes

Eleven records have missing TotalCharges values. These records have a tenure of zero months, and the missing values were retained rather than replaced with assumed values.

## Analytical Limitations

The analysis identifies associations between customer characteristics and churn. It does not establish causation or prove that a particular intervention will reduce churn.

The original dataset is available through the Kaggle source link. Users should follow the dataset's applicable licence and terms.
