# 📦 Daily Sales Export – Azure Data Factory

## 🎯 Objective
This pipeline extracts **today's sales data** from the Azure SQL Database `Sales` table, filters it for the current date (`08-Aug-2025`), and saves it as a CSV file in the `daily` folder in Azure Blob Storage.

---

## 🛠️ Configuration Details

| Component          | Value / Type                    |
|--------------------|----------------------------------|
| Source             | Azure SQL Database              |
| Table Name         | `Sales`                         |
| Filter Condition   | `SaleDate = '2025-08-08'`       |
| Sink               | Azure Blob Storage              |
| Output Folder      | `daily`                         |
| File Name          | `Sales_08-Aug-2025.csv`         |
| Dataset Type       | DelimitedText (CSV)             |
| Mapping            | Auto-mapping                    |
| Integration Runtime| AutoResolveIntegrationRuntime   |

---

## 📂 Files Included

| File                                   | Purpose                                          |
|----------------------------------------|--------------------------------------------------|
| `pipelines/copy_pipeline.json`    	 | ADF pipeline for daily sales export              |
| `datasets/ds_sql_daily_sales.json`     | Source dataset configuration for Azure SQL DB    |
| `datasets/ds_sales_blob.json` 	 | Sink dataset configuration for Blob CSV output   |
| `linkedServices/ls_blob_sales.json`    | Connection details for SQL DB  Blob Storage      |
| `linkedServices/ls_sql_db.json`    	 | Connection details for Blob Storage      	    |
| `sql query/Sales_Table.sql`            | SQL table creation and insertion script          |
| `sql/Filter_Sales_Query.sql`           | To filter 08-Aug-25 rows only                    |

---

## ⚙️ Pipeline Flow

1. **Source (Azure SQL Database)**  
   - Dataset points to the `Sales` table.
   - Query filters records for today's date:  
     ```sql
     SELECT * FROM Sales
     WHERE SaleDate = CAST(GETDATE() AS DATE);
     ```

2. **Sink (Azure Blob Storage)**  
   - Target folder: `Sales`
   - File name generated dynamically:  
     ```text
     Sales_08-Aug-2025.csv
     ```
     Expression in ADF:  
     ```adf
     @concat('Sales_', formatDateTime(utcNow(), 'dd-MMM-yyyy'), '.csv')
     ```

---

## ✅ Output
After running the pipeline:
- Blob path:  Sales/Sales_08-Aug-2025.csv


- Contains only sales data for `08-Aug-2025`.

## 📌 Notes

- Update the filter query to use `@formatDateTime(utcNow(),'yyyy-MM-dd')` for automated daily runs.
- Ensure the `daily` container/folder exists in Blob Storage or let ADF create it.
- You can schedule the pipeline with **Triggers** to run every day at midnight.

