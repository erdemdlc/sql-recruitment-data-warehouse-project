# Recruitment Data Warehouse Project
It is a data warehouse project created using data from a recruitment company. 

---
## 🏗️ Data Architecture

![Data Architecture]("Buraya resim gelecek")

1. **ODS Layer**: Stores raw data as-is from the source systems. Data is ingested from gsheet Files into SQL Server Database.
2. **DWH Layer**: This layer includes data cleansing, standardization, and normalization processes to prepare data for analysis.
3. **DM Layer**: Houses business-ready data modeled into a star schema required for reporting and analytics.

---
## 📖 Project Overview

This project involves:

1. **Data Architecture**: Designing a Modern Data Warehouse Using classical DWH architecture **ODS**, **DWH**, and **DM** layers.
2. **ETL Pipelines**: Extracting, transforming, and loading data from source systems into the warehouse.
3. **Data Modeling**: Developing fact and dimension tables optimized for analytical queries.
4. **Analytics & Reporting**: Creating SQL-based reports and dashboards for actionable insights.

---

### BI: Analytics & Reporting (Data Analysis)

#### Objective
Develop SQL-based analytics to deliver detailed insights into:
- **Recruiter & Customer Effectiveness**
- **Candidate Behavior**
- **Recruitment Trends**

## 📂 Repository Structure
```
sql-recruitment-data-warehouse-project/
│
├── datasets/                           # Raw datasets used for the project
│
├── docs/                               # Project documentation and architecture details
│   ├── data_architecture.drawio        # Draw.io file shows the project's architecture
│   ├── data_catalog.md                 # Catalog of datasets, including field descriptions and metadata
│   ├── data_flow.drawio                # Draw.io file for the data flow diagram
│   ├── data_model.drawio              # Draw.io file for data models (star schema)
│   ├── data_integration.drawio          # Draw.io file for data integrations 
│   ├── naming-conventions.md           # Consistent naming guidelines for tables, columns, and files
│
├── scripts/                            # SQL/python scripts for ETL and transformations
│   ├── ods/                         # Scripts for extracting and loading raw data
│   ├── dwh/                         # Scripts for cleaning and transforming data
│   ├── dm/                           # Scripts for creating analytical models
│
├── tests/                              # Test scripts and quality files
│
├── README.md                           # Project overview and instructions
├── .gitignore                          # Files and directories to be ignored by Git
```
---
