# 📦 Copy Activity – Azure Data Factory

## 🎯 Objective

This pipeline demonstrates a basic **Copy Activity** in Azure Data Factory, where data is moved from a CSV file in Azure Blob Storage to an Azure SQL Database table named `Sales_Staging`.

---

## 🛠️ Configuration Details

| Component        | Value / Type                    |
|------------------|----------------------------------|
| Source           | Azure Blob Storage              |
| File             | `sales_raw_data.csv`            |
| Dataset Type     | DelimitedText (CSV)             |
| Sink             | Azure SQL Database              |
| Table Name       | `Sales_Staging`                 |
| Mapping          | Auto-mapping                    |
| Integration Runtime | AutoResolveIntegrationRuntime |

---

## 📁 Files Included

| File                          | Purpose                               |
|-------------------------------|----------------------------------------|
| `pipelines/CopyPipeline.json` | ADF pipeline for copy activity         |
| `datasets/SalesDataset.json`  | Source and sink dataset configuration  |
| `linkedServices/...json`      | Blob and SQL connection details        |
| `input-data/sales_raw_data.csv` | Sample input CSV file                |
| `sql/SalesTable.sql`          | SQL table creation script              |

---

## ✅ Output

Once run in debug mode, the data from `sales_raw_data.csv` is copied into the `Sales_Staging` table in Azure SQL Database.

