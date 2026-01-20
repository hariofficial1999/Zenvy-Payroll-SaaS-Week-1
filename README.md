# Zenvy-Payroll-SaaS-Week-1

## 1. Executive Summary
Zenvy Payroll SaaS is a comprehensive HR and payroll analytics solution designed to streamline workforce management. This project focuses on transforming raw organizational data into actionable insights using a modern data stack. The primary goal is to provide stakeholders with a 360-degree view of workforce dynamics, financial liabilities, and operational efficiency through an interactive dashboard.

## 2. Project Overview
In modern enterprises, Human Resource (HR) management goes beyond simple record-keeping; it requires strategic decision-making based on data. Zenvy Payroll SaaS acts as a bridge between raw employee data and strategic HR insights. By integrating attendance tracking, payroll processing, and employee demographics, we create a unified source of truth for the organization.

**Core Problem:** Organizations often suffer from fragmented data silos where attendance logs, payroll records, and employee details exist in separate systems. This leads to inefficient reporting, payroll errors, and a lack of visibility into high-cost departments.

**Our Solution:** We implement a **Business Intelligence (BI) Dashboard** grounded in a robust data architecture. This solution automates data retrieval, cleanses inconsistencies, and visualizes KPIs to solve these problems effectively.

## 3. Tools & Technologies Utilized
The success of this project relies on a carefully selected stack of modern data tools, each serving a specific purpose in the pipeline:

*   **MySQL (Database Layer):**
    *   *Role:* Acts as the centralized Data Warehouse.
    *   *Usage:* Stores structured data (Employees, Transactions) using a Relational Model to ensure data integrity and fast querying.
*   **Python & Pandas (ETL Layer):**
    *   *Role:* Extract, Transform, and Load (ETL) engine.
    *   *Usage:* Scripts are used to clean raw CSV data, handle missing values, calculate derived metrics (like Net Salary), and load cleaned data into MySQL.
*   **Power BI (Visualization Layer):**
    *   *Role:* Business Intelligence & Reporting Interface.
    *   *Usage:* Connects to MySQL to create interactive visual reports, utilizing DAX for advanced calculations and dynamic filtering.
*   **VS Code (Development Environment):**
    *   *Role:* Code Editor.
    *   *Usage:* Used for writing Python scripts, managing project files, and version control.

## 4. Technical Architecture & Data Modeling
The project follows a standard **Star Schema** design to optimize query performance for analytical workloads.

### 4.1 Fact Table: `fact_transaction`
Contains quantitative data (measurements) of the business process.
*   *Key Attributes:* `gross_salary`, `net_salary`, `tax_deduction`, `overtime_hours`, `present_days`.
*   *Purpose:* Allows for aggregation (SUM, AVG) across various dimensions.

### 4.2 Dimension Table: `dim_employee`
Contains descriptive attributes (context) related to the business entities.
*   *Key Attributes:* `employee_name`, `department`, `designation`, `city`.
*   *Purpose:* Provides filtering and grouping capabilities (e.g., "Show me Salary *by Department*").

## 5. Dashboard Strategy & Analysis
The dashboard is divided into three strategic modules, answering key business questions.

### 5.1 Employee Details (HR Overview)
**Goal:** Complete headcount and hierarchy breakdown.

| Visual Name | Visual Type | Fields Configuration | Insight Derived |
| :--- | :--- | :--- | :--- |
| **Total Workforce** | KPI Card | **Field:** `employee_id` (Count Distinct) | Immediate view of total active staff. |
| **Department Strength** | Treemap | **Cat:** `department` <br> **Val:** `employee_id` | Shows largest departments as biggest boxes. |
| **Role Hierarchy** | Funnel Chart | **Cat:** `designation` <br> **Val:** `employee_id` | Pyramid view of role distribution (Mgr > Intern). |
| **Dept Composition** | Donut Chart | **Legend:** `department` <br> **Val:** `employee_id` | Quick ratio/percentage of teams. |

### 5.2 Payroll Management (Finance)
**Goal:** Track company spending, tax liabilities, and top earners.

| Visual Name | Visual Type | Fields Configuration | Insight Derived |
| :--- | :--- | :--- | :--- |
| **Cost vs Payout** | Clustered Bar Chart | **Y-Axis:** `department` <br> **X-Axis:** `gross`, `net_salary` | Compares Company Cost vs Employee Take-home. |
| **Role-wise Cost** | Funnel Chart | **Cat:** `designation` <br> **Val:** `gross_salary` | Identifies which role consumes the most budget. |
| **Earnings vs Effort** | Scatter Plot | **X:** `overtime_hours` <br> **Y:** `net_salary` | Correlation: Does high work equal high pay? |
| **Top 5 Earners** | Stacked Bar Chart | **Y:** `employee_name` <br> **Filter:** Top 5 Net Salary | Instantly identifies highest paid staff. |

### 5.3 Attendance Tracking (Operations)
**Goal:** Monitor employee presence, leave trends, and overtime.

| Visual Name | Visual Type | Fields Configuration | Insight Derived |
| :--- | :--- | :--- | :--- |
| **Attendance Trends** | Line & Stacked Column | **Shared Axis:** `month` <br> **Line:** `present_days` | Visualizes attendance consistency over time. |
| **OT Leaders** | Stacked Bar Chart | **Y-Axis:** `employee_name` <br> **X-Axis:** `overtime_hours` | Highlights hardworking employees for rewards. |
| **Operational Grid** | Matrix Table | **Rows:** `dept` > `name` <br> **Val:** `working_days`, `OT` | Detailed granular view for daily operations. |
| **Avg Consistency** | Gauge Chart | **Value:** `present_days` (Avg) | Overall team availability score (Target vs Actual). |

## 6. Business Impact
Implementing the Zenvy Payroll SaaS Dashboard delivers tangible value to the organization:

1.  **Data-Driven Decision Making:**
    *   *Impact:* Shifts HR strategy from "gut feeling" to fact-based decisions. Management can now instantly see which departments are over-budget or under-performing.
2.  **Cost Optimization:**
    *   *Impact:* precise tracking of Overtime (OT) costs vs. output allows the company to optimize workforce allocation and reduce unnecessary expenditure.
3.  **Operational Efficiency:**
    *   *Impact:* Automating the reporting process saves HR teams countless hours previously spent on manual Excel consolidation. What used to take days now takes seconds.
4.  **Transparency & Trust:**
    *   *Impact:* A unified system ensures that Finance, HR, and Operations are all looking at the same numbers, reducing internal friction and discrepancies.

## 7. Conclusion
The Zenvy Payroll SaaS project successfully demonstrates how data engineering and visualization concepts converge to solve real-world business problems. By moving from manual spreadsheets to a Star Schema-backed dashboard, the organization achieves data integrity, faster reporting, and a scalable platform for future growth.

## 8. Visualizations

Below are the snapshots of the Power BI Dashboards and Data Model designed for Zenvy Payroll SaaS.

### 8.1 Data Model View
The **Star Schema** consisting of `fact_transaction` table linked with `dim_employee` table.
![Data Model View](Power%20bi%20visualization/Model%20View.png)

### 8.2 Employee Overview (Workforce)
A complete overview of workforce distribution across departments and heirarchy.
![Employee Overview](Power%20bi%20visualization/Employee%20Overview%20(Workforce).png)

### 8.3 Payroll Analytics (Finance)
Detailed financial analysis showcasing cost vs payout, tax liabilities and top earners.
![Payroll Analytics](Power%20bi%20visualization/Payroll%20Analytics%20(Finance).png)

### 8.4 Attendance Analytics (Operations)
Operational insights into employee attendance trends, overtime and presence consistency.
![Attendance Analytics](Power%20bi%20visualization/Attendance%20Analytics%20(Operations).png)
