# 📊 Customer Churn Analysis & Retention Playbook

## 🚀 Project Overview

This project analyzes customer churn behavior using SQL, Python, and Power BI to identify key drivers of customer attrition and propose actionable retention strategies.

The goal is to move beyond analysis and provide **business-driven insights** through a structured **Retention Playbook**.

---

## 🎯 Objectives

* Analyze customer churn patterns
* Identify high-risk customer segments
* Perform root cause analysis using SQL & Python
* Build an interactive Power BI dashboard
* Develop a retention playbook with actionable strategies

---

## 🧰 Tools & Technologies

* **SQL (MySQL)** → Data extraction & analysis
* **Python (Pandas, Seaborn, Matplotlib)** → Data cleaning & visualization
* **Power BI** → Interactive dashboard
* **GitHub** → Project documentation

---

## 📂 Dataset

* Telco Customer Churn Dataset (Kaggle)
* Contains customer demographics, services, charges, and churn status

---

## 🔍 Key Insights

### 📉 Overall Churn

* **Churn Rate: ~26.5%**
* ~1 in 4 customers are leaving

---

### 📊 Contract Type Impact

* Month-to-month: **42.71% churn** 🚨
* One-year: 11.27%
* Two-year: 2.83%

👉 Customers without long-term commitment churn the most

---

### ⏳ Tenure Impact

* New customers (<12 months): **47.44% churn**
* Mid tenure: 25.54%
* Loyal customers: 11.93%

👉 Early-stage engagement is critical

---

### 🌐 Internet Service Impact

* Fiber optic: **41.89% churn**
* DSL: 18.96%
* No internet: 7.40%

👉 High churn may indicate pricing or service quality issues

---

### 💰 Pricing Impact

* Churned customers: **₹74 avg charges**
* Retained customers: ₹61 avg charges

👉 Higher pricing correlates with higher churn

---

## 📊 Power BI Dashboard

The dashboard provides:

* Overall churn KPI
* Churn by contract type
* Churn by tenure segment
* Churn by internet service
* Monthly charges comparison
* Interactive slicers (Contract, Internet Service)

---

## 📘 Retention Playbook

| Churn Indicator      | Insight                   | Retention Strategy              |
| -------------------- | ------------------------- | ------------------------------- |
| Month-to-month       | Highest churn (42.71%)    | Offer annual plan discounts     |
| New customers        | Highest churn (47.44%)    | Improve onboarding experience   |
| Fiber optic users    | High churn (41.89%)       | Improve service quality/pricing |
| High monthly charges | Higher churn (₹74 vs ₹61) | Provide loyalty discounts       |

---

## 📁 Project Structure

```
customer-churn-analysis/
│
├── data/
│   └── WA_Fn-UseC_-Telco-Customer-Churn.csv
│
├── sql/
│   └── churn_analysis.sql
│
├── notebook/
│   └── churn_analysis.ipynb
│
├── dashboard/
│   └── churn_dashboard.png
│
├── playbook/
│   └── churn_playbook.pdf
│
└── README.md
```

---

## 💡 Key Takeaways

* Churn is driven by **contract type, tenure, pricing, and service quality**
* Early customer lifecycle is the most critical retention phase
* Data-driven strategies can significantly reduce churn

---

## 🚀 Future Improvements

* Build churn prediction model (Machine Learning)
* Add customer segmentation (RFM analysis)
* Deploy dashboard using Power BI Service

---

## 👨‍💻 Author

**Prajuval**
Aspiring Data Analyst | SQL • Python • Power BI

---

## ⭐ If you like this project

Give it a ⭐ on GitHub and feel free to connect!
