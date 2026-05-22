# 🏦 LendIQ — Credit Risk Analytics Pipeline

## 📌 Overview
LendIQ is an end-to-end credit risk analytics project built on 2.26 million real loan records from Lending Club (2007–2018). The project simulates the full workflow of a credit risk analyst at a fintech lender — from raw data engineering through SQL analytics, Power BI dashboards, and a predictive default model.

The central business question: **given historical loan performance, which borrowers are most likely to default — and can we predict it before approving a loan?**

## 📊 Summary

- **Dataset:** Lending Club Loan Data (2007–2018), 2.26M records
- **Approach:** End-to-end pipeline — data engineering, SQL analytics, visualisation, machine learning
- **Key Contributions:**
  - Normalised a 145-column raw CSV into a structured PostgreSQL relational database
  - Advanced SQL analytics using CTEs, window functions, and vintage analysis
  - Interactive Power BI dashboard covering portfolio risk, default trends, and borrower segmentation
  - LightGBM binary classifier predicting probability of default

## 🏆 Key Analyses

- **Portfolio Overview:** Loan volume, interest rate, and default rate by grade (A–G risk ladder)
- **Default Rate by Purpose:** Separated probability of default from absolute default volume — debt consolidation drives the most losses despite a moderate rate
- **DTI Analysis:** Confirmed a clean monotonic relationship between debt-to-income ratio and default rate across four buckets
- **Window Functions:** Month-over-month default rate trends (LAG), rolling 3-month rates by grade (AVG OVER), and vintage analysis comparing loan cohorts by issue year
- **Predictive Modelling:** LightGBM classifier achieving **AUC 0.71** with interest rate, loan amount, and DTI as top predictors

## 🗂️ Stack

| Layer | Tools |
|---|---|
| Data Engineering | Python, Pandas |
| Database | PostgreSQL, DBeaver |
| Analytics | SQL (CTEs, window functions) |
| Visualisation | Power BI |
| Modelling | LightGBM, Scikit-learn, Jupyter |

## 📜 Dashboard
🔗 [Power BI Dashboard (PDF)](LendIQ/LendIQ_Dashboard.pdf)

## 🚀 Future Work
- Incorporate bureau data and behavioural features to push AUC beyond 0.80
- Build a loan scoring API to serve predictions at inference time
- Extend vintage analysis with macroeconomic overlay (interest rate cycles, unemployment)

## 📧 Code Availability
If you need the SQL scripts, Python notebooks, or Power BI file, feel free to contact me at [sajjaad.jurawon@gmail.com](mailto:sajjaad.jurawon@gmail.com)

