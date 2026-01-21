# ❤️ Heart Attack Risk Prediction using SVM and MLP

This project investigates the use of machine learning models to predict heart attack risk using clinical and biometric features. The models—**Support Vector Machine (SVM)** and **Multilayer Perceptron (MLP)**—are trained and optimized to classify patients at risk, with extensive feature engineering, hyperparameter tuning, and model comparison.

## 📌 Objectives

- Predict heart attack risk based on clinical indicators from the Mendeley dataset.
- Compare performance between **SVM** and **MLP** using both **Scikit-learn** and **PyTorch** implementations.
- Apply **feature engineering**, **permutation importance**, and **Grid Search** to improve accuracy and generalization.

## 🧠 Key Features & Techniques

- **Pulse Pressure** was engineered from systolic and diastolic blood pressure to reflect heart contraction force.
- **Feature selection** using Permutation Importance reduced input dimensionality without sacrificing accuracy.
- **Stratified 10-fold Cross-Validation** was used to handle mild class imbalance and ensure robust performance.
- **Hyperparameter Tuning** via Grid Search (C, gamma, kernel for SVM; layers, neurons, activation, etc. for MLP).
- Implemented **MLP in both Scikit-learn and PyTorch** to compare frameworks.

## 🩺 Dataset

- **Source**: [Mendeley Heart Attack Dataset](https://data.mendeley.com/datasets/vxv2bb0jgr/1)
- **Size**: 1,319 instances, 9 clinical features (e.g., Age, Heart Rate, Blood Sugar, CK-MB, Troponin)
- **Target**: Binary classification (heart attack: yes/no)

## 📈 Results

| Model              | Accuracy | AUC Score |
|--------------------|----------|-----------|
| Base SVM           | 66.6%    | ~0.75     |
| Optimized SVM      | 95.9%    | 0.93      |
| Base MLP (Sklearn) | 75.9%    | ~0.84     |
| Optimized MLP      | **96.6%**| **0.97**  |
| PyTorch MLP (tuned)| 96.5%    | ~0.96     |

- **MLP slightly outperformed SVM**, especially in AUC, showing better discriminative power.
- Feature reduction improved generalization and helped mitigate overfitting.

## 🧪 Methodology

### Preprocessing
- Removed missing/duplicate values, normalized outliers using **RobustScaler**.
- Created **Pulse Pressure** as a new feature.
- Checked multicollinearity between systolic and diastolic pressure.

### Modeling
- SVM with RBF and Linear kernels tested.
- MLP with varying depth, ReLU/Tanh activations, L2 regularization, and early stopping.
- Custom MLP implemented in **PyTorch** with manual backpropagation and mini-batch gradient descent.

### Evaluation Metrics
- Accuracy, Precision, Recall, F1-Score
- AUC-ROC Curve for overall model discrimination
