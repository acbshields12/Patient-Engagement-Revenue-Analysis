# 🏥 Healthcare Data Analysis Project (Excel → MySQL → Power BI)

## 📌 Project Overview

This project demonstrates an end-to-end healthcare data analysis workflow—from **data generation in Excel**, to **data storage and querying in MySQL**, and finally to **interactive visualization in Power BI**.

The goal is to analyze patient behavior, operational performance, and revenue trends using real-world analytical techniques.

---

## 🎯 Objectives

* Analyze **patient engagement and retention**
* Identify **top-performing departments and doctors**
* Evaluate **regional performance**
* Track **temporal trends in visits and revenue**

---

## 🛠️ Tools & Technologies

* **Excel** – Data generation, cleaning, feature engineering
* **MySQL** – Data storage, transformation, and querying
* **Power BI** – Dashboard creation and data visualization

---

## 📊 Dataset Description

The dataset simulates hospital patient records with the following fields:

* Patient_ID
* Visit_ID
* Full Name
* Gender
* Age
* Age Group
* Department
* Doctor
* Visit_Date
* Month-Year
* State
* Region (derived from State)
* Appointment_Status (Completed / No-show)
* Revenue
* Patient Type (New / Returning)

---

## 🔄 Data Workflow

### 1. Excel

* Generated synthetic healthcare dataset using formulas
* Cleaned and standardized data
* Created derived columns (Age Group, Month-Year, Patient Type)

### 2. MySQL

* Imported dataset into database
* Performed data validation and transformation
* Wrote SQL queries for analysis:

  * Aggregations (SUM, COUNT)
  * Subqueries
  * Window functions (RANK, LAG)

### 3. Power BI

* Connected directly to MySQL database
* Created data model and DAX measures
* Built interactive dashboard with filters and KPIs

---

## 📈 Key Analyses & Reports

### 🔹 1. Engagement & Retention Analysis

* Total Patients
* Total Visits
* Returning vs New Patients
* No-show Rate

### 🔹 2. Category Contribution

* Revenue by Department
* Visit distribution by Department

### 🔹 3. Regional / Hierarchical Ranking

* Revenue by Region
* Top-performing Doctors
* Region and Doctor ranking

### 🔹 4. Temporal Growth / Trend Analysis

* Monthly Revenue Trend
* Monthly Visit Trend
* Month-over-Month Growth
* No-show trend over time

---

## 📊 Dashboard Features

* KPI Cards (Patients, Revenue, No-show Rate)
* Line charts for trend analysis
* Bar charts for ranking
* Donut chart for contribution analysis
* Slicers (Region, Department, Date, Gender)

---

## 🔍 Key Insights (Example)

* Revenue shows consistent monthly growth
* Certain departments contribute the majority of revenue
* No-show rates highlight operational inefficiencies
* Regional differences indicate performance gaps

---

## 📁 Project Structure

```id="2l7b7i"
/data        → Excel dataset  
/sql         → MySQL queries  
/dashboard   → Power BI (.pbix file)  
/images      → Dashboard screenshots  
```

---

## 🚀 How to Run This Project

1. Open Excel file and review dataset
2. Import data into MySQL using CSV
3. Run SQL queries for analysis
4. Connect Power BI to MySQL database
5. Build visuals using provided measures

---

## 💡 Skills Demonstrated

* Data Cleaning & Preparation
* SQL Querying (Aggregations, Window Functions)
* Data Modeling in Power BI
* DAX Calculations
* Data Visualization & Storytelling

---

## 🔮 Future Improvements

* Add predictive analytics (forecasting trends)
* Include patient diagnosis and treatment data
* Implement cohort analysis for deeper retention insights

---

## 📸 Dashboard Preview

*(Insert screenshot here)*

---

## 👤 Author

Adriane Clark Ballesteros-Shields  
Healthcare Data Analyst Trainee

* 🔗 GitHub: https://github.com/acbshields12

---
