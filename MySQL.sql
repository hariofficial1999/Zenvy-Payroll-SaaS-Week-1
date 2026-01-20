-- MySQL Table Creation Queries for Zenvy Payroll SaaS - Star Schema Version

-- 1. Create/Use Database
CREATE DATABASE IF NOT EXISTS zenvy_payroll_db;
USE zenvy_payroll_db;

-- ---------------------------------------------------------
-- CLEANUP SECTION (Run this to fix "Many-to-Many" errors)
-- ---------------------------------------------------------
-- This will wipe existing tables so we can start fresh with clean data.
DROP TABLE IF EXISTS fact_transaction;
DROP TABLE IF EXISTS dim_employee;
-- Also dropping old table names if they exist
DROP TABLE IF EXISTS payroll;
DROP TABLE IF EXISTS attendance;
DROP TABLE IF EXISTS employees;

-- ---------------------------------------------------------
-- 1. Create Dimension Table (Dim_Employee)
-- ---------------------------------------------------------
CREATE TABLE dim_employee (
    employee_id INT PRIMARY KEY, -- Primary Key ensures NO duplicates
    employee_name VARCHAR(100),
    department VARCHAR(50),
    designation VARCHAR(50),
    base_salary DECIMAL(10, 2),
    joining_date DATE
);

-- ---------------------------------------------------------
-- 2. Create Fact Table (Fact_Transaction)
-- ---------------------------------------------------------
CREATE TABLE fact_transaction (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    working_days INT,
    present_days INT,
    overtime_hours INT,
    gross_salary DECIMAL(10, 2),
    tax_deduction DECIMAL(10, 2),
    pf_deduction DECIMAL(10, 2),
    net_salary DECIMAL(10, 2),
    FOREIGN KEY (employee_id) REFERENCES dim_employee(employee_id)
);

-- ---------------------------------------------------------
-- 3. Data Verification Queries
-- ---------------------------------------------------------

SELECT 'Checking Dim_Employee Table' AS Info;
SELECT * FROM dim_employee LIMIT 5;

SELECT 'Checking Fact_Transaction Table' AS Info;
SELECT * FROM fact_transaction LIMIT 5;

-- ---------------------------------------------------------
-- 4. KEY DASHBOARD QUERIES (Updated for Star Schema)
-- ---------------------------------------------------------

-- Metric A: Total Monthly Payroll Cost
SELECT 
    SUM(gross_salary) AS Total_Gross_Payroll,
    SUM(net_salary) AS Total_Net_Payout
FROM fact_transaction;

-- Metric B: Total Overtime Hours
SELECT SUM(overtime_hours) AS Total_Overtime_Hours 
FROM fact_transaction;

-- Metric C: Salary Breakdown by Department
SELECT 
    d.department, 
    SUM(f.gross_salary) AS Department_Total_Cost,
    AVG(f.gross_salary) AS Avg_Salary_in_Dept
FROM dim_employee d
JOIN fact_transaction f ON d.employee_id = f.employee_id
GROUP BY d.department
ORDER BY Department_Total_Cost DESC;

-- Metric D: Employee Count per Department
SELECT 
    department, 
    COUNT(employee_id) AS Employee_Count
FROM dim_employee
GROUP BY department;

-- Metric E: Top 5 Highest Paid Employees 
SELECT 
    d.employee_name, 
    d.designation, 
    f.net_salary
FROM dim_employee d
JOIN fact_transaction f ON d.employee_id = f.employee_id
ORDER BY f.net_salary DESC
LIMIT 5;

-- ---------------------------------------------------------
-- 5. PAGE 2: ATTENDANCE ANALYTICS QUERIES
-- ---------------------------------------------------------

-- KPI A: Total Overtime Hours
SELECT SUM(overtime_hours) AS Total_OT_Hours
FROM fact_transaction;

-- KPI B: Average Present Days
SELECT AVG(present_days) AS Avg_Present_Days
FROM fact_transaction;

-- Chart A: Top 5 OT Performers (Bar Chart)
SELECT 
    d.employee_name,
    SUM(f.overtime_hours) AS Total_OT_Hours
FROM dim_employee d
JOIN fact_transaction f ON d.employee_id = f.employee_id
GROUP BY d.employee_name
ORDER BY Total_OT_Hours DESC
LIMIT 5;

-- Chart B: Attendance Ratio (Clustered Column Chart)
-- Shows working_days vs present_days for each employee
SELECT 
    d.employee_name,
    f.working_days,
    f.present_days
FROM dim_employee d
JOIN fact_transaction f ON d.employee_id = f.employee_id
ORDER BY d.employee_name;

SHOW TABLES;

