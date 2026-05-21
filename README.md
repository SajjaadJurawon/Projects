# 🚀 Data Science Projects Portfolio

Welcome to my Data Science & Machine Learning portfolio! This repository contains various projects showcasing my skills in data analysis, machine learning, and predictive modeling.

## 🔹 Projects Included:
### 📌 [1. Road Accident Severity Prediction](UK%20Road%20Accidents%20Analysis/README.md)
- Predicting accident severity using **Machine Learning models** (LightGBM, Random Forest).
- **Data Preprocessing, EDA, Feature Engineering**.
- **85.5% Accuracy & SHAP Analysis** to interpret model decisions.

### 📌 [2. Bike Rental Demand Prediction](Bike%20Rentals%20Prediction/README.md)
- Forecasting bike rentals using **Multiple Linear Regression & Random Forest**.
- **Hyperparameter tuning & feature engineering**.
- **Seasonality & peak-hour analysis for better insights**.

### 📌 [3. Evolution of the Olympic Games](Olympic%20Evolution%20Analysis/README.md)
- **Clustering athletes using K-Means** to analyze physical attributes.
- **GeoPandas & Tableau visualizations** for Olympic history.
- **Trends in gender participation & sports diversity over 120 years**.

### 📌 [4. Financial Risk Assessment using NLP](Financial%20Risk%20Assessment%20using%20NLP/README.md)
- **Classified financial risk severity** in SEC filings using **TF-IDF + SVM** and **FinBERT** for domain-specific deep learning.
- Applied **explainable AI (SHAP & LIME)** and **KeyBERT** to interpret model predictions and extract key financial risk terms.
- **Achieved 75.3% accuracy** with traditional models, outperforming fine-tuned transformers on imbalanced financial datasets.

### 📌 [5. Face Mask Detection using Classical and Deep Learning](Face%20Mask%20Detection%20Pipeline/README.md)
- Built models using **SIFT + SVM**, **HOG + SVM/MLP**, and **CNN (VGG & MobileNetV3)** to classify mask usage into 3 categories.
- Tackled **class imbalance** with SMOTE, data augmentation, focal loss, and class-weighted training for robust performance.
- Achieved **93% accuracy** with VGG-based CNN, outperforming traditional models on both precision and generalization.

### 📌 [6. Heart Attack Risk Prediction using SVM and MLP](Heart%20Attack%20Risk%20Prediction/README.md)
- Compared **SVM and MLP models** for heart attack risk prediction using clinical features from the Mendeley dataset.
- Engineered features like **Pulse Pressure**, applied **permutation importance**, and used **Grid Search** for tuning.
- Achieved up to **96.6% accuracy**, with MLP slightly outperforming SVM and **AUC scores up to 0.97**.

### 📌 [7. LendIQ — Credit Risk Analytics Pipeline](LendIQ/README.md)
- End-to-end credit risk pipeline on **2.26 million real Lending Club loan records** (2007-2018), simulating the workflow of a fintech credit risk analyst.
- Built a **normalised PostgreSQL schema**, performed advanced **SQL analytics** (window functions, CTEs, vintage analysis), and visualised insights in a **Power BI dashboard**.
- Trained a **LightGBM classifier** to predict borrower default, achieving **AUC 0.71** with DTI, interest rate, and loan grade as the strongest predictors.

### 📌 [8. DamageVisionAI — Satellite Building Damage Assessment](Building%20Damage%20Assessment/README.md)
- Two-stage deep learning pipeline for **post-disaster building damage assessment** from satellite imagery, simulating real-world humanitarian response workflows.
- **Stage 1 (Detection):** Compared ResNet50V2, FCOS, and YOLOv8 for building detection — YOLOv8 selected and optimised for best precision-recall balance.
- **Stage 2 (Classification):** Progressive fine-tuning across ResNet-50, EfficientNet-B3, ViT-B/16, and DeiT-B across four damage classes (no-damage, minor, major, destroyed). EfficientNet-B3 selected as best overall model with a custom OrdinalLoss function to enforce damage severity ordering.

