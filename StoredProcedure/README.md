📦 Stored Procedure Activity – Azure Data Factory



❓ What is Stored Procedure Activity?



In Azure Data Factory, a Stored Procedure Activity allows you to execute pre-defined SQL Server stored procedures as part of an ETL/ELT pipeline. It is used to:



Deduplicate records in tables



Handle null or invalid values



Log errors for auditing



Track incremental loads using ProcessedDate



Think of it as running database logic directly within your ADF pipeline, ensuring complex transformations or validations happen in the database without moving data unnecessarily.



🎯 Scenario



This pipeline demonstrates a Stored Procedure Activity that processes sales data:



Copy raw sales data into the Sales table from your source.



Remove duplicate transactions – keep only the latest record per TransactionID based on LoadDate.



Log null CustomerID rows into the Invalid\_Sales\_Transaction table and remove them from the Sales table.



Update ProcessedDate as the current system date (GETDATE()) for remaining valid records.



🛠️ Configuration Details

Component		Value / Type

Source			Azure Blob Storage File	Daily\_sales\_Data.csv

Sink			Azure SQL Database (Sales table / Invalid\_Sales\_Transaction table)

Dataset 		ds\_sales\_blob ->source, ds\_sql\_db -> sink 

LinkedService		ls\_sql\_db -> source, ls\_sql\_db -> sink

InputFile		input-data/Daily\_Sales\_Data.csv

Activities		Copy Activity -> Stored Procedure ( Remove duplicates → Error Logging → ProcessedDate Update )

Stored Procedure	fact\_sales

Integration Runtime	AutoResolveIntegrationRuntime

🔄 Transformation Steps



1️⃣ Remove duplicate transactions



Keep the latest record per TransactionID using LoadDate.



2️⃣ Log null CustomerID rows and remove invalid rows



Insert rows with NULL CustomerID into Invalid\_Sales\_Transaction.



Delete invalid rows from the Sales table.



Assign ProcessedDate = GETDATE() for invalid rows.



3️⃣ Update ProcessedDate for valid records



Remaining records in Sales are updated with the current system datetime to track incremental loads.



✅ Output



After running the stored procedure:



Sales table – Cleaned sales data with no duplicates and all valid rows have ProcessedDate.



Invalid\_Sales\_Transaction table – Rows with NULL CustomerID logged with ProcessedDate for auditing.



📁 Files Included

File					Purpose

dataset/ds\_sales\_blob.json		Dataset for source CSV file in Blob Storage

dataset/ds\_sql\_db.json			Dataset for sink SQL database table

linkedService/ls\_sales\_blob.json	Connection details for Blob Storage

linkedService/ls\_sql\_db.json		Connection details for SQL Server

input-data/daily\_sales\_data.csv		Sample input CSV file

pipeline/pipeline1.json			Whole ADF pipeline with Stored Procedure Activity

SQL\_Scripts/sales\_table\_script.sql	SQL scripts file 

sales\_fact\_procedure\_sql\_script.sql

&nbsp;invalid\_sales\_transaction\_table\_script.sql



