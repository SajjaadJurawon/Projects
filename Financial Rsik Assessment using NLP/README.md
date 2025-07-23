# 📊 Financial Risk Assessment using NLP

This project explores the automation of financial risk severity classification in corporate disclosures (e.g., SEC filings) using Natural Language Processing (NLP) techniques. It compares traditional machine learning models with transformer-based deep learning models like FinBERT and RoBERTa, incorporating explainability methods to understand model decisions.

## 📌 Objectives

- Automatically classify the **risk severity** of financial disclosures (e.g., HIGH, MEDIUM, LOW, NONE).
- Compare performance of **traditional models** (TF-IDF + SVM/Logistic Regression) with **transformer models** (FinBERT, RoBERTa).
- Apply **explainable AI** (SHAP, LIME) and **KeyBERT** to interpret and validate risk factors identified by the models.

## 📂 Dataset

- **Source**: [Gretel Financial Risk Analysis v1](https://huggingface.co/gretelai/gretel-financial-risk-analysis-v1)
- **Type**: Synthetic dataset based on SEC filings (10-K, 10-Q, 8-K).
- **Size**: 1,034 samples, highly imbalanced across severity classes.

## ⚙️ Methodology

1. **Preprocessing**:
   - Lowercasing, lemmatization, and noise removal
   - Synonym-based data augmentation for minority classes
   - Extended stopword filtering for financial jargon

2. **Modeling**:
   - **Traditional**: TF-IDF + SVM (baseline), Logistic Regression
   - **Deep Learning**: Fine-tuned FinBERT and RoBERTa using HuggingFace Transformers

3. **Explainability**:
   - **LIME**: Local feature contribution for traditional models
   - **SHAP**: Global and local interpretability for FinBERT
   - **KeyBERT**: Unsupervised keyphrase extraction for model-independent validation

## 📈 Results

| Model              | Accuracy | F1 Score |
|--------------------|----------|----------|
| TF-IDF + SVM       | **75.3%** | **77.1%** |
| FinBERT (fine-tuned) | 66.0%   | 51.0%    |
| RoBERTa (fine-tuned)| 71.0%   | -        |

- **Traditional model outperformed FinBERT** on imbalanced data.
- **FinBERT excelled** in detecting **high-severity** cases but struggled with minority classes.
- Explainability tools revealed overreliance on formal financial/legal terms in model predictions.

## 🔍 Key Learnings

- Classical models with careful feature engineering can still outperform deep models on small, imbalanced datasets.
- Explainability is crucial in financial NLP to build **trustworthy AI systems**.
- Domain-specific language models like FinBERT benefit from **additional fine-tuning and context-aware techniques**.

## 🛠️ Technologies

- Python, Scikit-learn, PyTorch, HuggingFace Transformers
- NLTK, SHAP, LIME, KeyBERT, Matplotlib
