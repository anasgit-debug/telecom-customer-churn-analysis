

--Data Quality Check--

select COUNT(*) as [TotalRows]
from [Telco-Customer-Churn]

SELECT
    COLUMN_NAME,
    DATA_TYPE,
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Telco-Customer-Churn'
ORDER BY ORDINAL_POSITION

select
COUNT(*) as [Total_Rows],
SUM(case when customerID IS NULL then 1
else 0
end) as [Missing_Customers],
SUM(case when TotalCharges IS NULL then 1
else 0
end) as [Missing_totalCharges],
SUM(case when Churn IS NULL then 1
else 0
end) as [Missing_Churn]
from [Telco-Customer-Churn]

select * from [Telco-Customer-Churn]
where TotalCharges is null;

SELECT
    tenure,
    COUNT(*) AS CustomerCount,
    SUM(CASE
        WHEN TotalCharges IS NULL THEN 1
        ELSE 0
    END) AS MissingTotalCharges
FROM [Telco-Customer-Churn]
GROUP BY tenure
ORDER BY tenure;

select 
customerID,
COUNT(*) as Occurrences
from
dbo.[Telco-Customer-Churn]
group by customerID
having COUNT(*) >1
order by Occurrences DESC

SELECT
    Churn,
    COUNT(*) AS CustomerCount
FROM [Telco-Customer-Churn]
GROUP BY Churn
ORDER BY Churn;


SELECT
    SUM(CASE
        WHEN TotalCharges IS NULL THEN 1
        ELSE 0
    END) AS NullValues,

    SUM(CASE
        WHEN TotalCharges IS NOT NULL
         AND LTRIM(RTRIM(TotalCharges)) = ''
        THEN 1
        ELSE 0
    END) AS BlankValues,

    SUM(CASE
        WHEN NULLIF(LTRIM(RTRIM(TotalCharges)), '') IS NOT NULL
         AND TRY_CONVERT(
             DECIMAL(10,2),
             LTRIM(RTRIM(TotalCharges))
         ) IS NULL
        THEN 1
        ELSE 0
    END) AS NonNumericValues,

    SUM(CASE
        WHEN TRY_CONVERT(
             DECIMAL(10,2),
             NULLIF(LTRIM(RTRIM(TotalCharges)), '')
        ) IS NOT NULL
        THEN 1
        ELSE 0
    END) AS ValidNumericValues

FROM [Telco-Customer-Churn];


SELECT
    v.ColumnName,
    SUM(v.IsMissing) AS MissingValues
FROM [Telco-Customer-Churn]
CROSS APPLY (VALUES
    ('customerID',       CASE WHEN customerID IS NULL THEN 1 ELSE 0 END),
    ('gender',           CASE WHEN gender IS NULL THEN 1 ELSE 0 END),
    ('SeniorCitizen',    CASE WHEN SeniorCitizen IS NULL THEN 1 ELSE 0 END),
    ('Partner',          CASE WHEN Partner IS NULL THEN 1 ELSE 0 END),
    ('Dependents',       CASE WHEN Dependents IS NULL THEN 1 ELSE 0 END),
    ('tenure',           CASE WHEN tenure IS NULL THEN 1 ELSE 0 END),
    ('PhoneService',     CASE WHEN PhoneService IS NULL THEN 1 ELSE 0 END),
    ('MultipleLines',    CASE WHEN MultipleLines IS NULL THEN 1 ELSE 0 END),
    ('InternetService',  CASE WHEN InternetService IS NULL THEN 1 ELSE 0 END),
    ('OnlineSecurity',   CASE WHEN OnlineSecurity IS NULL THEN 1 ELSE 0 END),
    ('OnlineBackup',     CASE WHEN OnlineBackup IS NULL THEN 1 ELSE 0 END),
    ('DeviceProtection', CASE WHEN DeviceProtection IS NULL THEN 1 ELSE 0 END),
    ('TechSupport',      CASE WHEN TechSupport IS NULL THEN 1 ELSE 0 END),
    ('StreamingTV',      CASE WHEN StreamingTV IS NULL THEN 1 ELSE 0 END),
    ('StreamingMovies',  CASE WHEN StreamingMovies IS NULL THEN 1 ELSE 0 END),
    ('Contract',         CASE WHEN Contract IS NULL THEN 1 ELSE 0 END),
    ('PaperlessBilling', CASE WHEN PaperlessBilling IS NULL THEN 1 ELSE 0 END),
    ('PaymentMethod',    CASE WHEN PaymentMethod IS NULL THEN 1 ELSE 0 END),
    ('MonthlyCharges',   CASE WHEN MonthlyCharges IS NULL THEN 1 ELSE 0 END),
    ('TotalCharges',     CASE WHEN TotalCharges IS NULL THEN 1 ELSE 0 END),
    ('Churn',            CASE WHEN Churn IS NULL THEN 1 ELSE 0 END)
) AS v(ColumnName, IsMissing)
GROUP BY v.ColumnName
ORDER BY MissingValues DESC, v.ColumnName;

SELECT
    InternetService,
    COUNT(*) AS CustomerCount
FROM [Telco-Customer-Churn]
GROUP BY InternetService
ORDER BY CustomerCount DESC;

SELECT TOP 10
    InternetService,
    OnlineSecurity,
    OnlineBackup,
    DeviceProtection,
    TechSupport,
    StreamingTV,
    StreamingMovies
FROM [Telco-Customer-Churn]
WHERE InternetService = 'No';

Select 
OnlineSecurity,
COUNT(*) as CustomerCount
from 
[Telco-Customer-Churn]
group by OnlineSecurity
order by CustomerCount DESC;

SELECT
    COLUMN_NAME,
    DATA_TYPE,
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Telco-Customer-Churn'
  AND COLUMN_NAME IN (
      'OnlineSecurity',
      'OnlineBackup',
      'DeviceProtection',
      'TechSupport',
      'StreamingTV',
      'StreamingMovies',
      'MultipleLines'
  )
ORDER BY COLUMN_NAME;

SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Telco-Customer-Churn'
ORDER BY ORDINAL_POSITION;

SELECT
    COLUMN_NAME,
    DATA_TYPE,
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Telco-Customer-Churn_Staging'
ORDER BY ORDINAL_POSITION;

SELECT
OnlineSecurity,
COUNT(*) as CustomerCount
from 
[dbo].[Telco-Customer-Churn_Staging]
group by onlinesecurity
order by CustomerCount DESC

SELECT
    MultipleLines,
    COUNT(*) AS CustomerCount
FROM [dbo].[Telco-Customer-Churn_Staging]
GROUP BY MultipleLines
ORDER BY CustomerCount DESC;

SELECT
    COUNT(*) AS TotalRows
FROM [dbo].[Telco-Customer-Churn_Staging]

Select 
SUM(case when customerID is null then 1 else 0
end) as MissingCustomerID,
SUM(case when MultipleLines is null then 1 else 0
end) as MissingMultipleLines,
SUM(case when OnlineSecurity is null then 1 else 0
end) as MissingOnlineSecurity,
SUM(case when OnlineBackup is null then 1 else 0
end) as MissingOnlineBackup,
SUM(case when DeviceProtection is null then 1 else 0
end) as MissingDeviceProtection,
SUM(case when TechSupport is null then 1 else 0
end) as MissingTechSupport,
SUM(case when StreamingTV is null then 1 else 0
end) as MissingStreamingTV,
SUM(case when StreamingMovies is null then 1 else 0
end) as MissingTotalCharges,
SUM(case when TotalCharges is null then 1 else 0
end) as MissingTotalCharges,
SUM(case when Churn is null then 1 else 0
end) as MissingChurn
from 
[dbo].[Telco-Customer-Churn_Staging]

SELECT
    customerID,
    tenure,
    MonthlyCharges,
    TotalCharges,
    Churn
FROM [dbo].[Telco-Customer-Churn_Staging]
WHERE TotalCharges IS NULL;

SELECT
    customerID,
    COUNT(*) AS RecordCount
FROM [dbo].[Telco-Customer-Churn_Staging]
GROUP BY customerID
HAVING COUNT(*) > 1;

select
churn,
COUNT(*) as CustomerCount
from
[dbo].[Telco-Customer-Churn_Staging]
group by churn
order by CustomerCount DESC

SELECT
    Contract,
    COUNT(*) AS CustomerCount
FROM [dbo].[Telco-Customer-Churn_Staging]
GROUP BY Contract
ORDER BY CustomerCount DESC;

SELECT
    PaymentMethod,
    COUNT(*) AS CustomerCount
FROM [dbo].[Telco-Customer-Churn_Staging]
GROUP BY PaymentMethod
ORDER BY CustomerCount DESC;

SELECT
    InternetService,
    COUNT(*) AS CustomerCount
FROM [dbo].[Telco-Customer-Churn_Staging]
GROUP BY InternetService
ORDER BY CustomerCount DESC;

SELECT
    gender,
    COUNT(*) AS CustomerCount
FROM [dbo].[Telco-Customer-Churn_Staging]
GROUP BY gender
ORDER BY CustomerCount DESC;

SELECT
    Partner,
    COUNT(*) AS CustomerCount
FROM [dbo].[Telco-Customer-Churn_Staging]
GROUP BY Partner
ORDER BY CustomerCount DESC;

SELECT
    Dependents,
    COUNT(*) AS CustomerCount
FROM [dbo].[Telco-Customer-Churn_Staging]
GROUP BY Dependents
ORDER BY CustomerCount DESC;

SELECT
    PhoneService,
    COUNT(*) AS CustomerCount
FROM [dbo].[Telco-Customer-Churn_Staging]
GROUP BY PhoneService
ORDER BY CustomerCount DESC;


SELECT
    PaperlessBilling,
    COUNT(*) AS CustomerCount
FROM [dbo].[Telco-Customer-Churn_Staging]
GROUP BY PaperlessBilling
ORDER BY CustomerCount DESC;

SELECT
    SeniorCitizen,
    COUNT(*) AS CustomerCount
FROM [dbo].[Telco-Customer-Churn_Staging]
GROUP BY SeniorCitizen
ORDER BY CustomerCount DESC;

select
MIN(tenure) as Minimumtenure,
MAX(tenure) as Maximumtenure,
AVG(cast(tenure as decimal(10,2))) as Averagetenure,
COUNT(*) as TotalCustomers
from
[dbo].[Telco-Customer-Churn_Staging]

SELECT
    MIN(MonthlyCharges) AS MinimumMonthlyCharges,
    MAX(MonthlyCharges) AS MaximumMonthlyCharges,
    AVG(MonthlyCharges) AS AverageMonthlyCharges,
    SUM(CASE WHEN MonthlyCharges IS NULL THEN 1 ELSE 0 END) AS MissingMonthlyCharges
FROM 
[dbo].[Telco-Customer-Churn_Staging];

SELECT
    COUNT(*) AS TotalRows,
    SUM(CASE
        WHEN TotalCharges IS NULL THEN 1
        ELSE 0
    END) AS MissingTotalCharges,
    SUM(CASE
        WHEN TotalCharges IS NOT NULL
             AND TRY_CONVERT(DECIMAL(10,2), TotalCharges) IS NULL
        THEN 1
        ELSE 0
    END) AS NonNumericTotalCharges
FROM 
[dbo].[Telco-Customer-Churn_Staging];

SELECT
    Contract,
    COUNT(*) AS CustomerCount
FROM [dbo].[Telco-Customer-Churn_Staging]
GROUP BY Contract
ORDER BY CustomerCount DESC;

SELECT
    OnlineBackup,
    COUNT(*) AS CustomerCount
FROM [dbo].[Telco-Customer-Churn_Staging]
GROUP BY OnlineBackup
ORDER BY CustomerCount DESC;

SELECT
    OnlineBackup,
    COUNT(*) AS CustomerCount
FROM [dbo].[Telco-Customer-Churn_Staging]
GROUP BY OnlineBackup
ORDER BY CustomerCount DESC;

SELECT
    DeviceProtection,
    COUNT(*) AS CustomerCount
FROM [dbo].[Telco-Customer-Churn_Staging]
GROUP BY DeviceProtection
ORDER BY CustomerCount DESC;

SELECT
    TechSupport,
    COUNT(*) AS CustomerCount
FROM [dbo].[Telco-Customer-Churn_Staging]
GROUP BY TechSupport
ORDER BY CustomerCount DESC;

SELECT
    StreamingTV,
    COUNT(*) AS CustomerCount
FROM [dbo].[Telco-Customer-Churn_Staging]
GROUP BY StreamingTV
ORDER BY CustomerCount DESC;

SELECT
    StreamingMovies,
    COUNT(*) AS CustomerCount
FROM [dbo].[Telco-Customer-Churn_Staging]
GROUP BY StreamingMovies
ORDER BY CustomerCount DESC;

SELECT COUNT(*) AS InconsistentInternetRecords
FROM [dbo].[Telco-Customer-Churn_Staging]
WHERE
    (InternetService = 'No'
     AND (
         OnlineSecurity <> 'No internet service'
         OR OnlineBackup <> 'No internet service'
         OR DeviceProtection <> 'No internet service'
         OR TechSupport <> 'No internet service'
         OR StreamingTV <> 'No internet service'
         OR StreamingMovies <> 'No internet service'
     ))
    OR
    (InternetService <> 'No'
     AND (
         OnlineSecurity = 'No internet service'
         OR OnlineBackup = 'No internet service'
         OR DeviceProtection = 'No internet service'
         OR TechSupport = 'No internet service'
         OR StreamingTV = 'No internet service'
         OR StreamingMovies = 'No internet service'
     ));

     SELECT COUNT(*) AS InconsistentPhoneRecords
FROM [dbo].[Telco-Customer-Churn_Staging]
WHERE
    (PhoneService = 0
     AND MultipleLines <> 'No phone service')
    OR
    (PhoneService = 1
     AND MultipleLines = 'No phone service');

     SELECT COUNT(*) AS InvalidMonthlyCharges
FROM [dbo].[Telco-Customer-Churn_Staging]
WHERE MonthlyCharges <= 0;

SELECT COUNT(*) AS BlankCustomerIDs
FROM [dbo].[Telco-Customer-Churn_Staging]
WHERE customerID IS NULL
   OR LTRIM(RTRIM(customerID)) = '';

   SELECT COUNT(*) AS InvalidTenureRecords
FROM [dbo].[Telco-Customer-Churn_Staging]
WHERE tenure < 0 OR tenure > 72;

SELECT COUNT(*) AS ZeroTotalChargesWithPositiveTenure
FROM [dbo].[Telco-Customer-Churn_Staging]
WHERE tenure > 0
  AND TRY_CONVERT(DECIMAL(10,2), TotalCharges) = 0;

  SELECT
    Churn,
    COUNT(*) AS CustomerCount
FROM [dbo].[Telco-Customer-Churn_Staging]
GROUP BY Churn
ORDER BY CustomerCount DESC;

SELECT COUNT(*) AS UnexpectedChurnRecords
FROM [dbo].[Telco-Customer-Churn_Staging]
WHERE Churn IS NULL
   OR LTRIM(RTRIM(Churn)) NOT IN ('Yes', 'No');

   SELECT
    TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
  AND TABLE_NAME IN (
      'Telco-Customer-Churn',
      'Telco-Customer-Churn_Staging'
  );

  drop table [Telco-Customer-Churn]

--Data Validation--



select * from [Telco-Customer-Churn_Staging]

select 
Contract,
COUNT(*) as [Churn-Rate]
from [Telco-Customer-Churn_Staging]
where Churn = 'Yes'
Group by Contract
order by [Churn-Rate] DESC

SELECT
    Contract,
    COUNT(*) AS [Total Customers],
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        AS [Churned Customers],
    CAST(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*)
        AS DECIMAL(5,2)
    ) AS [Churn Rate Percent]
FROM [Telco-Customer-Churn_Staging]
GROUP BY Contract
ORDER BY [Churn Rate Percent] DESC;

select
PaymentMethod,
COUNT(*) as [Total Customers],
SUM( case when churn = 'yes' then 1 else 0
end) as [Churned Customers],
CAST( 100.0 * SUM( case when churn = 'yes' then 1 else 0
end)/count(*)as decimal(5,2)) as [Churn Rate Percent]
from
[Telco-Customer-Churn_Staging]
Group by PaymentMethod
order by [Total Customers] DESC

SELECT
    InternetService,
    COUNT(*) AS [Total Customers],
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        AS [Churned Customers],
    CAST(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*) AS DECIMAL(6,2)
    ) AS [Churn Rate Percent]
FROM [Telco-Customer-Churn_Staging]
GROUP BY InternetService
ORDER BY [Churn Rate Percent] DESC;

SELECT
    CASE
        WHEN tenure <= 12 THEN '0-12 months'
        WHEN tenure <= 24 THEN '13-24 months'
        WHEN tenure <= 48 THEN '25-48 months'
        ELSE '49-72 months'
    END AS [Tenure Group],
    COUNT(*) AS [Total Customers],
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        AS [Churned Customers],
    CAST(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*) AS DECIMAL(6,2)
    ) AS [Churn Rate Percent]
FROM [Telco-Customer-Churn_Staging]
GROUP BY
    CASE
        WHEN tenure <= 12 THEN '0-12 months'
        WHEN tenure <= 24 THEN '13-24 months'
        WHEN tenure <= 48 THEN '25-48 months'
        ELSE '49-72 months'
    END
ORDER BY MIN(tenure);

select
Contract,
COUNT(*) as [Total Customers],
SUM(case
    when churn = 'yes' then 1 else 0
    end) as [Churned Customers],

    CASE
        WHEN tenure <= 12 THEN '0-12 months'
        WHEN tenure <= 24 THEN '13-24 months'
        WHEN tenure <= 48 THEN '25-48 months'
        ELSE '49-72 months'
    END AS [Tenure Group],
CAST(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*) AS DECIMAL(6,2)
    ) AS [Churn Rate Percent]
from
[Telco-Customer-Churn_Staging]
group by Contract,
CASE
        WHEN tenure <= 12 THEN '0-12 months'
        WHEN tenure <= 24 THEN '13-24 months'
        WHEN tenure <= 48 THEN '25-48 months'
        ELSE '49-72 months'
    END
ORDER BY
    Contract,
    MIN(tenure);

    SELECT
    Contract,
    PaymentMethod,
    COUNT(*) AS [Total Customers],
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        AS [Churned Customers],
    CAST(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*) AS DECIMAL(6,2)
    ) AS [Churn Rate Percent]
FROM [Telco-Customer-Churn_Staging]
GROUP BY
    Contract,
    PaymentMethod
ORDER BY
    Contract,
    [Churn Rate Percent] DESC;

    SELECT
    OnlineSecurity,
    COUNT(*) AS [Total Customers],
    SUM(
        CASE
            WHEN Churn = 'Yes' THEN 1
            ELSE 0
        END
    ) AS [Churned Customers],
    CAST(
        100.0 * SUM(
            CASE
                WHEN Churn = 'Yes' THEN 1
                ELSE 0
            END
        ) / COUNT(*) AS DECIMAL(6,2)
    ) AS [Churn Rate Percent]
FROM [Telco-Customer-Churn_Staging]
GROUP BY OnlineSecurity
ORDER BY [Churn Rate Percent] DESC;

SELECT
    TechSupport,
    COUNT(*) AS [Total Customers],
    SUM(
        CASE
            WHEN Churn = 'Yes' THEN 1
            ELSE 0
        END
    ) AS [Churned Customers],
    CAST(
        100.0 * SUM(
            CASE
                WHEN Churn = 'Yes' THEN 1
                ELSE 0
            END
        ) / COUNT(*) AS DECIMAL(6,2)
    ) AS [Churn Rate Percent]
FROM [Telco-Customer-Churn_Staging]
GROUP BY TechSupport
ORDER BY [Churn Rate Percent] DESC;

SELECT
    OnlineBackup,
    COUNT(*) AS [Total Customers],
    SUM(
        CASE
            WHEN Churn = 'Yes' THEN 1
            ELSE 0
        END
    ) AS [Churned Customers],
    CAST(
        100.0 * SUM(
            CASE
                WHEN Churn = 'Yes' THEN 1
                ELSE 0
            END
        ) / COUNT(*) AS DECIMAL(6,2)
    ) AS [Churn Rate Percent]
FROM [Telco-Customer-Churn_Staging]
GROUP BY OnlineBackup
ORDER BY [Churn Rate Percent] DESC;

SELECT
    DeviceProtection,
    COUNT(*) AS [Total Customers],
    SUM(
        CASE
            WHEN Churn = 'Yes' THEN 1
            ELSE 0
        END
    ) AS [Churned Customers],
    CAST(
        100.0 * SUM(
            CASE
                WHEN Churn = 'Yes' THEN 1
                ELSE 0
            END
        ) / COUNT(*) AS DECIMAL(6,2)
    ) AS [Churn Rate Percent]
FROM [Telco-Customer-Churn_Staging]
GROUP BY DeviceProtection
ORDER BY [Churn Rate Percent] DESC;

SELECT
    MultipleLines,
    COUNT(*) AS [Total Customers],
    SUM(
        CASE
            WHEN Churn = 'Yes' THEN 1
            ELSE 0
        END
    ) AS [Churned Customers],
    CAST(
        100.0 * SUM(
            CASE
                WHEN Churn = 'Yes' THEN 1
                ELSE 0
            END
        ) / COUNT(*) AS DECIMAL(6,2)
    ) AS [Churn Rate Percent]
FROM [Telco-Customer-Churn_Staging]
GROUP BY MultipleLines
ORDER BY [Churn Rate Percent] DESC;

Select
COLUMN_NAME,
DATA_TYPE,
IS_NULLABLE
from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME = '[Telco-Customer-Churn_Staging]'
order by ORDINAL_POSITION

SELECT
    Contract,
    OnlineSecurity,
    COUNT(*) AS [Total Customers],
    SUM(
        CASE
            WHEN Churn = 'Yes' THEN 1
            ELSE 0
        END
    ) AS [Churned Customers],
    CAST(
        100.0 * SUM(
            CASE
                WHEN Churn = 'Yes' THEN 1
                ELSE 0
            END
        ) / COUNT(*) AS DECIMAL(6,2)
    ) AS [Churn Rate Percent]
FROM [Telco-Customer-Churn_Staging]
GROUP BY
    Contract,
    OnlineSecurity
ORDER BY
    Contract,
    OnlineSecurity;

    SELECT
    Contract,
    TechSupport,
    COUNT(*) AS [Total Customers],
    SUM(
        CASE
            WHEN Churn = 'Yes' THEN 1
            ELSE 0
        END
    ) AS [Churned Customers],
    CAST(
        100.0 * SUM(
            CASE
                WHEN Churn = 'Yes' THEN 1
                ELSE 0
            END
        ) / COUNT(*) AS DECIMAL(6,2)
    ) AS [Churn Rate Percent]
FROM [Telco-Customer-Churn_Staging]
GROUP BY
    Contract,
    TechSupport
ORDER BY
Contract,
    [Churn Rate Percent] DESC;

    SELECT
    CASE
        WHEN tenure <= 12 THEN '0-12 months'
        WHEN tenure <= 24 THEN '13-24 months'
        WHEN tenure <= 48 THEN '25-48 months'
        ELSE '49-72 months'
    END AS [Tenure Group],
    OnlineSecurity,
    COUNT(*) AS [Total Customers],
    SUM(
        CASE
            WHEN Churn = 'Yes' THEN 1
            ELSE 0
        END
    ) AS [Churned Customers],
    CAST(
        100.0 * SUM(
            CASE
                WHEN Churn = 'Yes' THEN 1
                ELSE 0
            END
        ) / COUNT(*) AS DECIMAL(6,2)
    ) AS [Churn Rate Percent]
FROM [Telco-Customer-Churn_Staging]
WHERE Contract = 'Month-to-month'
GROUP BY
    CASE
        WHEN tenure <= 12 THEN '0-12 months'
        WHEN tenure <= 24 THEN '13-24 months'
        WHEN tenure <= 48 THEN '25-48 months'
        ELSE '49-72 months'
    END,
    OnlineSecurity
ORDER BY
    MIN(tenure),
    [Churn Rate Percent] DESC;

    SELECT
    COUNT(*) AS [Total Customers],
    SUM(
        CASE
            WHEN Churn = 'Yes' THEN 1
            ELSE 0
        END
    ) AS [Churned Customers],
    CAST(
        100.0 * SUM(
            CASE
                WHEN Churn = 'Yes' THEN 1
                ELSE 0
            END
        ) / COUNT(*) AS DECIMAL(6,2)
    ) AS [Churn Rate Percent]
FROM [Telco-Customer-Churn_Staging]
WHERE Contract = 'Month-to-month'
  AND tenure <= 12
  AND OnlineSecurity = 'No';