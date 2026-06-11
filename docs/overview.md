# 📊 TPC-H Analytics Project (dbt + Snowflake)

## 📌 Project Overview

This project demonstrates how to build a modern analytics warehouse using **dbt** on top of the **Snowflake TPC-H dataset**.

The goal is to transform raw transactional data into **clean, reliable, and analytics-ready tables** using a structured, layered approach.

---

## 🧱 Architecture

The project follows a standard **dbt layered architecture**:

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

## 📂 Project Structure

### 🔹 Staging Layer (`models/staging/`)
- Cleans and standardizes raw source data
- Renames columns into consistent `snake_case`
- Keeps transformations minimal

**Models:**
- `stg_tpch__orders`
- `stg_tpch__customer`
- `stg_tpch__lineitem`
- `stg_tpch__nations`

---

### 🔹 Intermediate Layer (`models/intermediate/`)
- Combines staging models
- Applies business logic and enrichments

**Model:**
- `int_orders_enriched`

---

### 🔹 Marts Layer (`models/marts/`)
- Final tables optimized for analytics

**Models:**
- `fct_orders`
- `dim_customers`

---

## 📂 Data Sources

### ✅ Snowflake Source
- `SNOWFLAKE_SAMPLE_DATA.TPCH_SF1`

### ✅ Seed Data
- `nations.csv`

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

- Incremental fact table (`fct_orders`)
- Surrogate keys using `dbt_utils`
- Customer segmentation logic

---

## ✅ Data Quality

- Primary key tests (`not_null`, `unique`)
- Relationship tests (foreign keys)
- Accepted value checks
- Custom validation tests

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

## 🗂️ Schema Strategy

| Layer        | Schema Example      |
|--------------|-------------------|
| Staging      | HHU_STAGING       |
| Intermediate | HHU_INTERMEDIATE  |
| Marts        | HHU_MARTS         |
| Seeds        | HHU_SEED_DATA     |

---

## 🚀 Conclusion

This project demonstrates a production-style dbt pipeline, including layered modeling, incremental processing, and strong data quality practices.
