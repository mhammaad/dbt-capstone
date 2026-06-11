{% docs __overview__ %}

# 📊 TPC-H Analytics Project (dbt + Snowflake)

## 📌 Project Overview

This project demonstrates a modern analytics pipeline built with **dbt** on top of the **Snowflake TPC-H sample dataset**.

The objective is to transform raw transactional data into **clean, structured, and analytics-ready datasets** using a layered architecture and best practices in data modeling.

---

## 🧱 Architecture

The project follows a standard dbt layered approach:

```
Sources
  ↓
Staging
  ↓
Intermediate
  ↓
Marts
```

---

## 📂 Layers

### 🔹 Staging
- Cleans and standardizes raw data
- Renames columns to `snake_case`
- Minimal transformations

### 🔹 Intermediate
- Combines staging models
- Applies business logic and enrichment

### 🔹 Marts
- Final analytics-ready models

---

## 🔄 Data Flow

```
Raw Source Tables
      ↓
Staging Models
      ↓
Intermediate Model
      ↓
Mart Models
```

---

## ⚙️ Key Features

- Incremental processing
- Surrogate keys
- Customer segmentation

---

## ✅ Data Quality

- Primary key tests
- Relationship tests
- Accepted values
- Custom SQL tests

---

## 🧪 Running the Project

```bash
dbt seed
dbt run
dbt test
dbt docs generate
dbt docs serve
```

---

## 🚀 Summary

Production-style dbt project with layered modeling, incremental pipelines, and strong data quality practices.

{% enddocs %}

