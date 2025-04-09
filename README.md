# 🚀 AZ Adventure Works Project
**Project Type:** End-to-End Azure Data Engineering Part 1

**Cloud Platform:** Microsoft Azure  

---

## 📌 Overview

This project showcases a complete Azure-based Data Engineering workflow. It demonstrates how to ingest, transform, and analyze data using a modern architecture built around Azure Data Lake, Azure Data Factory (ADF), Azure Databricks, and Azure Synapse Analytics.

The pipeline follows the **Bronze-Silver-Gold** data architecture pattern and concludes with data visualization in Power BI.

## 🧩 Problem & Solution

### ❗ Problem Statement

Traditional data platforms often struggle with:

- Siloed data sources (CSV files, APIs, etc.)
- Manual and error-prone data processing
- Scalability issues in handling large datasets
- Lack of real-time insights for business users

In the case of **Adventure Works**, the organization faced challenges in transforming raw operational data into meaningful analytics across multiple departments (Sales, Customers, Orders, etc.).

### ✅ Solution (The Fix)

This project implements a **modern, scalable Azure Data Engineering pipeline** using a modular **Bronze-Silver-Gold** architecture to address these pain points:

- **Ingest** data from multiple sources using **Azure Data Factory**
- **Transform** and clean data using **Azure Databricks (PySpark)**
- **Curate** structured datasets in **Azure Synapse Analytics** for downstream analytics
- **Visualize** data with **Power BI** to drive actionable insights

This end-to-end pipeline ensures **data quality, scalability, and business intelligence readiness**, making it easier for teams to make informed decisions.



---

## 🗺️ Architecture Flow
![Alt Text](https://raw.githubusercontent.com/girald02/az_project_01/refs/heads/main/img/P1_Architecture.jpg)

1. **Bronze Layer (Raw Data):** Ingest raw CSV/API data using Azure Data Factory
2. **Silver Layer (Cleaned Data):** Transform data in Azure Databricks (PySpark)
3. **Gold Layer (Curated Data):** Load structured views into Azure Synapse Analytics
4. **Power BI Dashboard:** Visualize insights from curated data

---

## 🛠️ Azure Services Used

- **Azure Data Factory (ADF)** – Data ingestion pipelines
- **Azure Data Lake Storage (ADLS)** – Data storage (Bronze, Silver, Gold)
- **Azure Databricks** – Data transformation with PySpark
- **Azure Synapse Analytics** – SQL-based data warehousing & serving
- **Power BI** – Business intelligence and reporting

---

## ⚙️ Key Features

### 🔹 Data Ingestion (Bronze Layer)

- Static and dynamic pipelines in ADF
- Support for REST APIs and file-based ingestion (CSV)
- Parameterized pipelines for flexible data loading

### 🔸 Data Transformation (Silver Layer)

- PySpark used in Azure Databricks
- Column manipulation (e.g., `withColumn`, `concat_ws`, `to_timestamp`)
- Write to ADLS Silver container in **Parquet** format
- Real-life examples: orders, returns, calendar, customer data

### 🔶 Aggregation & Logic

- Transformations like:
  - Date parsing
  - String replacement
  - Mathematical operations on columns
- Example: `OrderLineItem * OrderQuantity` for calculating total sales

---

## 📈 Data Aggregation Example

```python
df_aggregated = df_sales_year.groupBy("OrderDate") \
    .agg(count('OrderNumber').alias('total_order'))
df_aggregated.display()
```

---

## 🧠 Azure Synapse Analytics (Gold Layer)

- Create views over curated Silver data
- Use `OPENROWSET` to query external Parquet files
- Create external tables and schemas for Power BI integration

```sql
CREATE VIEW gold.calendar AS
SELECT *
FROM OPENROWSET(
    BULK 'https://storagedatalakeproject1.blob.core.windows.net/silver/AdventureWorks_Calendar',
    FORMAT = 'PARQUET'
) AS result;
```

---

## 🔐 Security & Identity

- Register application in Microsoft Entra (formerly AAD)
- Generate `app_id`, `secret`, and assign appropriate role (`Storage Blob Data Contributor`)
- Authenticate Databricks using OAuth 2.0 configs

---

## 📊 Power BI Integration

- Connect Power BI to Synapse using Serverless SQL endpoint:
  ```
  azgiraldproject-synapse-ondemand.sql.azuresynapse.net
  ```
- Build dashboards using gold layer views and external tables

---

## 📚 Interview Notes & Concepts

- ADF: Pipelines, Linked Services, Dataset, Dynamic Parameters
- Databricks: Spark transformations, schema inference, Parquet writing
- Synapse: Views vs External Tables, CETAS, SQL Pool (Dedicated/Serverless)
- PySpark: `groupBy`, `agg`, `withColumn`, `regexp_replace`, `to_timestamp`
- Data Lake Architecture: Bronze → Silver → Gold

---

## ✅ Project Completion Checklist

- [x] Azure resources created (ADLS, ADF, Databricks, Synapse)
- [x] Raw data ingested to Bronze layer
- [x] Transformations applied in Silver layer
- [x] Views and External Tables created in Gold layer
- [x] Power BI dashboard connected and published

---

## 📂 Folder Structure

```
📁 AZ-Adventure-Works-Project/
├── README.md
├── notebooks/
│   └── databricks_transformations.py
├── data/
│   ├── raw/          # Bronze layer
│   ├── processed/    # Silver layer
│   └── curated/      # Gold layer
├── synapse/
│   └── gold_views.sql
└── powerbi/
    └── dashboard.pbix
```

---

## 🤝 Acknowledgements
- [x] Thanks to Microsoft Azure learning resources and the Adventure Works dataset for enabling this hands-on project experience.
- [x] Reference: https://www.youtube.com/watch?v=0GTZ-12hYtU
---

## 📬 Contact
For questions or collaborations:  
**📧 Email:** rare.girald@gmail.com
**🔗 LinkedIn:** https://www.linkedin.com/in/girald-bacongan-988144174/

