# **Naming Conventions**

This document outlines the naming conventions used for schemas, tables, views, columns, and other objects in the data warehouse.

## **Table of Contents**

1. [General Principles](#general-principles)
2. [Table Naming Conventions](#table-naming-conventions)
   - [ODS Rules](#ODS-rules)
   - [DWH Rules](#DWH-rules)
   - [DM Rules](#DM-rules)
3. [Column Naming Conventions](#column-naming-conventions)
   - [Surrogate Keys](#surrogate-keys)
   - [Technical Columns](#technical-columns)
4. [Stored Procedure](#stored-procedure-naming-conventions)
---

## **General Principles**

- **Naming Conventions**: Use snake_case, with lowercase letters and underscores (`_`) to separate words.
- **Language**: Use English for all names.
- **Avoid Reserved Words**: Do not use SQL reserved words as object names.

## **Table Naming Conventions**

### **ODS Rules**
- All names must start with the source system name, and table names must match their original names without renaming.
- **`<sourcesystem>_<entity>`**  
  - `<sourcesystem>`: Name of the source system (e.g., `at`, `kt`).  
  - `<entity>`: Exact table name from the source system.  
  - Example: `at_aday_rapor` → Information about candidates shared with customers.

### **DWH Rules**
- All names must standardized,cleaned and table names must renamed as their English equivalent.
- **`<sourcesystem>_<entity>`**  
  - `<sourcesystem>`: Abbreviated name of the source system (e.g., `ct`, `ct`,`pt`).  
  - `<entity>`: Cleaned, standardized table name from the source system.  
  - Example: `ct_candidate_submission` → Information about candidates shared with customers.

### **DM Rules**
- All names must use meaningful, business-aligned names for tables, starting with the category prefix.
- **`<category>_<entity>`**  
  - `<category>`: Describes the role of the table, such as `dim` (dimension) or `fact` (fact table).  
  - `<entity>`: Descriptive name of the table, aligned with the business domain (e.g., `candidates`, `recruiters`, `customers`).  
  - Examples:
    - `dim_customers` → Dimension table for customer data.  
    - `fact_interviews` → Fact table containing interview transactions.  

#### **Glossary of Category Patterns**

| Pattern     | Meaning                           | Example(s)                              |
|-------------|-----------------------------------|-----------------------------------------|
| `dim_`      | Dimension table                  | `dim_customers`, `dim_recruiters`           |
| `fact_`     | Fact table                       | `fact_interviews`                            |
| `report_`   | Report table                     | `report_customers`, `report_hires_monthly`   |

## **Column Naming Conventions**

### **Surrogate Keys**  
- All primary keys in dimension tables must use the suffix `_key`.
- **`<table_name>_key`**  
  - `<table_name>`: Refers to the name of the table or entity the key belongs to.  
  - `_key`: A suffix indicating that this column is a surrogate key.  
  - Example: `customer_key` → Surrogate key in the `dim_customers` table.
  
### **Technical Columns**
- All technical columns must start with the prefix `dwh_`, followed by a descriptive name indicating the column's purpose.
- **`dwh_<column_name>`**  
  - `dwh`: Prefix exclusively for system-generated metadata.  
  - `<column_name>`: Descriptive name indicating the column's purpose.  
  - Example: `dwh_load_date` → System-generated column used to store the date when the record was loaded.
 
## **Stored Procedure**

- All stored procedures used for loading data must follow the naming pattern:
- **`load_<layer>`**.
  
  - `<layer>`: Represents the layer being loaded, such as `ods`, `dwh`, or `dm`.
  - Example: 
    - `load_dwh` → Stored procedure for loading data into the Bronze layer.
