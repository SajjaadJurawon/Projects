# 😷 Face Mask Detection using Classical and Deep Learning Methods

This project investigates mask-wearing detection (proper, improper, no mask) in facial images using multiple computer vision techniques — from traditional feature extraction (SIFT, HOG) to deep learning with transfer learning (CNNs like VGG and MobileNetV3). Special focus is placed on **handling class imbalance** and optimizing models through augmentation, sampling, and loss strategies.

## 📌 Objectives

- Detect mask-wearing status across 3 classes: **Mask**, **No Mask**, **Improper Mask**.
- Compare **traditional models** (SIFT + SVM, HOG + SVM/MLP) with **CNNs** (VGG, MobileNetV3) for performance and generalizability.
- Implement **data augmentation**, **class weighting**, **SMOTE**, and **focal loss** to address **class imbalance**.

## 🧠 Models & Methods

| Model           | Accuracy | F1 Score | Key Notes |
|----------------|----------|----------|-----------|
| SIFT + SVM     | 68%      | 0.47     | Struggled with global context, minority classes poorly predicted. |
| HOG + SVM      | 70%      | 0.50     | Improved spatial understanding, still weak recall for minority classes. |
| CNN (VGG)      | **93%**  | **0.77** | Best performance using class weights, focal loss, and fine-tuning. |

## 🛠️ Approach

### 📷 Preprocessing
- **SIFT**: Greyscale, no resize (local features).
- **HOG**: Resize to 128×128, grayscale, normalization.
- **CNN**: Resize to 224×224, RGB, normalized using ImageNet stats.

### 🔍 Techniques
- **BoVW** (Bag of Visual Words) for SIFT with MiniBatch KMeans.
- **HOG** feature vectors with SVM and MLP.
- **CNN** with MobileNetV3 and VGGNet (fine-tuned last conv block).
- **Data Imbalance Handling**:
  - `class_weight='balanced'`
  - **SMOTE** oversampling
  - **Data augmentation** using Keras `ImageDataGenerator`
  - **Focal Loss** for CNN training

### 🧪 Training Highlights
- Grid Search CV for SVM and MLP hyperparameter tuning.
- Early stopping for MLPs to prevent overfitting.
- Validation on class distribution-sensitive metrics (recall_macro, F1).

## 📈 Observations

- SIFT struggled due to lack of global structure understanding.
- HOG performed reasonably but couldn't separate subtle mask misuse cases.
- CNN with **focal loss** and **fine-tuning** proved robust to class imbalance and image noise.
- Class 2 (Improper Mask) remained most challenging across models.
