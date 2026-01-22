# 🛰️ Building Damage Assessment from Satellite Imagery

## 📌 Overview
This project focuses on **automated post-disaster building damage assessment** using **high-resolution satellite imagery**.  
A **two-stage deep learning pipeline** is developed to **localize buildings** and **classify damage severity**, supporting rapid disaster response and humanitarian decision-making.

The project is based on the **xBD dataset**, one of the largest publicly available datasets for disaster damage assessment.


**If you need the python script for the code, please contact me (sajjaad.jurawon@gmail.com).**
---

## 📊 Summary

- **Dataset:** xBD – Post-Disaster Satellite Imagery
- **Approach:** Two-stage Computer Vision pipeline
- **Key Contributions:**
  - Building localisation using **object detection and segmentation** models
  - Damage severity classification (**No Damage, Minor, Major, Destroyed**)
  - Comparison of **CNNs and Vision Transformers** under class imbalance
  - Model interpretability using **explainability techniques**

---

## 🏆 Key Analyses

- **Building Localisation:** Evaluating object detection and segmentation models using IoU and mAP.
- **Damage Classification:** Training CNNs (ResNet, EfficientNet) and Vision Transformers (ViT, DeiT).
- **Imbalance Handling:** Applying class weighting and data augmentation strategies.
- **Model Explainability:** Using SHAP-based analysis to interpret predictions.

---

## 📜 Report

🔗 **[Full Report](Advancing%20Building%20Damage%20Assessment%20from%20Satellite%20Imagery.pdf)**

---

## 🚀 Future Work

- End-to-end joint detection and damage classification
- Temporal change detection across disaster timelines
- Deployment as a web-based inference system

