# ZENVY Payroll SaaS

## 🚀 Project Overview
**ZENVY Payroll SaaS** is a comprehensive HR and payroll analytics solution designed to streamline workforce management. This project focuses on transforming raw organizational data into actionable insights using a modern data stack. The primary goal is to provide stakeholders with a 360-degree view of workforce dynamics, financial liabilities, and operational efficiency through an interactive dashboard.

---

## 🛠️ Tech Stack
*   **Database:** MySQL (Centralized Data Warehouse)
*   **ETL Engine:** Python & Pandas (Data Cleaning & Transformation)
*   **BI Tool:** Power BI (Interactive Dashboards & Visualization)
*   **Environment:** VS Code

---

## 📊 Data Architecture
The project follows a standard **Star Schema** design to optimize query performance for analytical workloads.

*   **Fact Table:** `fact_transaction` (Gross Salary, Net Salary, OT Hours, Present Days)
*   **Dimension Table:** `dim_employee` (Employee Name, Department, Designation, City)

---

## 📈 Dashboard Visualizations

Below are the snapshots of the Power BI Dashboards and Data Model designed for Zenvy Payroll SaaS.

### 1. Data Model View
The **Star Schema** consisting of `fact_transaction` table linked with `dim_employee` table.
![Data Model View](<Power bi visualization/Model View.png>)

### 2. Employee Overview (Workforce)
A complete overview of workforce distribution across departments and hierarchy.
![Employee Overview](<Power bi visualization/Employee Overview (Workforce).png>)

### 3. Payroll Analytics (Finance)
Detailed financial analysis showcasing cost vs payout, tax liabilities, and top earners.
![Payroll Analytics](<Power bi visualization/Payroll Analytics (Finance).png>)

### 4. Attendance Analytics (Operations)
Operational insights into employee attendance trends, overtime, and presence consistency.
![Attendance Analytics](<Power bi visualization/Attendance Analytics (Operations).png>)

---

## 💡 Key Business Insights
1.  **Workforce Strength:** Instant breakdown of headcount by department and role.
2.  **Budget Control:** Identification of high-cost departments and roles.
3.  **Operational Efficiency:** Precise tracking of Overtime (OT) costs vs. productivity.
4.  **Attendance Trends:** Visualizing consistency and identifying top attendance performers.

---

## 🏁 Conclusion
The Zenvy Payroll SaaS project successfully demonstrates how data engineering and visualization concepts converge to solve real-world business problems. By moving from manual spreadsheets to a Star Schema-backed dashboard, the organization achieves data integrity, faster reporting, and a scalable platform for future growth.
