/* =========================================================
   PROJECT: Customer Churn Analysis & Retention Playbook
   TOOLS: MySQL
   DESCRIPTION:
   This script performs data loading, cleaning, and analysis
   to identify key drivers of customer churn.
   ========================================================= */

-- =========================================================
-- STEP 1: CREATE DATABASE
-- =========================================================

CREATE DATABASE churn_project;
USE churn_project;

-- =========================================================
-- STEP 2: CREATE TABLE
-- =========================================================

CREATE TABLE customers (
    customerID VARCHAR(50),
    gender VARCHAR(10),
    SeniorCitizen INT,
    Partner VARCHAR(10),
    Dependents VARCHAR(10),
    tenure INT,
    PhoneService VARCHAR(10),
    MultipleLines VARCHAR(20),
    InternetService VARCHAR(20),
    OnlineSecurity VARCHAR(20),
    OnlineBackup VARCHAR(20),
    DeviceProtection VARCHAR(20),
    TechSupport VARCHAR(20),
    StreamingTV VARCHAR(20),
    StreamingMovies VARCHAR(20),
    Contract VARCHAR(20),
    PaperlessBilling VARCHAR(10),
    PaymentMethod VARCHAR(50),
    MonthlyCharges DECIMAL(10,2),
    TotalCharges VARCHAR(50),
    Churn VARCHAR(10)
);

-- =========================================================
-- STEP 3: LOAD DATA FROM CSV
-- =========================================================

LOAD DATA LOCAL INFILE "C:\\Users\\praju\\OneDrive\\Desktop\\data analytics\\Customer Churn Analysis & Retention Playbook\\WA_Fn-UseC_-Telco-Customer-Churn.csv"
INTO TABLE customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- =========================================================
-- STEP 4: DATA CLEANING
-- =========================================================

-- Disable safe updates for bulk cleaning
SET SQL_SAFE_UPDATES = 0;

-- Remove hidden carriage return characters
UPDATE customers
SET Churn = REPLACE(Churn, '\r', '');

-- Trim extra spaces
UPDATE customers
SET Churn = TRIM(Churn);

-- Validate cleaned values
SELECT DISTINCT Churn, LENGTH(Churn) FROM customers;

-- =========================================================
-- STEP 5: EXPLORATORY DATA ANALYSIS (EDA)
-- =========================================================

-- 1. Overall Churn Rate
SELECT 
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate_pct
FROM customers;

-- ---------------------------------------------------------

-- 2. Churn by Contract Type
SELECT 
    Contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate_pct
FROM customers
GROUP BY Contract
ORDER BY churn_rate_pct DESC;

-- ---------------------------------------------------------

-- 3. Churn by Customer Tenure Segment
SELECT 
    CASE 
        WHEN tenure <= 12 THEN 'New Customers (0-12 months)'
        WHEN tenure <= 36 THEN 'Mid Customers (13-36 months)'
        ELSE 'Loyal Customers (37+ months)'
    END AS customer_segment,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate_pct
FROM customers
GROUP BY customer_segment
ORDER BY churn_rate_pct DESC;

-- ---------------------------------------------------------

-- 4. Churn by Internet Service Type
SELECT 
    InternetService,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate_pct
FROM customers
GROUP BY InternetService
ORDER BY churn_rate_pct DESC;

-- ---------------------------------------------------------

-- 5. Monthly Charges & Tenure Comparison (Churn vs Retained)
SELECT 
    Churn,
    ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charges,
    ROUND(AVG(tenure), 1) AS avg_tenure
FROM customers
GROUP BY Churn;

-- =========================================================
-- END OF SCRIPT
-- =========================================================