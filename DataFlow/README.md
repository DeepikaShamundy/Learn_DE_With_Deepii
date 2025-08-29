📦 Data Flow – Azure Data Factory

❓ What is Data Flow?

In Azure Data Factory, a Mapping Data Flow is a visual, code-free ETL tool that lets you:

Ingest data from multiple sources

Apply transformations (filter, join, aggregate, derive, sort, etc.)

Load the cleaned/enriched data into your target system

Think of Data Flow as drag-and-drop SQL for big data pipelines, built to scale without writing complex code.

🎯 Objective

This pipeline demonstrates a Mapping Data Flow in Azure Data Factory that:

Filters records where OrderAmount > 5000, Region = 'US', and OrderDate is within the last 14 days( 2 weeks ).

Adds a Derived Column (CustomerType) that classifies customers as Premium if TotalSpent > 15000 then 'Premium' else 'Regular'.

Sorts the results by TotalSpent in descending order.

🛠️ Configuration Details

Component		Value / Type
Source			Azure Blob Storage (CSV dataset)
File			orders.csv
Dataset Type		DelimitedText (CSV)
Transformations		Filter → Derived Column → Sort
Derived Column Formula	iif(TotalSpent > 15000, 'Premium', 'Regular')
Sink			Azure SQL Database 
Integration Runtime	AutoResolveIntegrationRuntime

📁 Files Included
File	Purpose
dataset/ds_orders_blob.json		dataset for blob storage source csv file
dataset/ds_sql_db_ordersjson		dataset for sink sql db 
linkedService/ls_orders_blob.json	connection details for blob 	
linkedService/ls_sql_db_orders.json	connection details for sql server
input-data/orders.csv			Sample input CSV file
pipeline/dataflowpipeline.json		whole pipeline details

🔄 Transformation Steps

1️⃣ Filter – Keep only records where:

OrderAmount > 5000

Region == 'US'

OrderDate >= addDays(currentDate(), -14)

2️⃣ Derived Column – Add column CustomerType:

iif(TotalSpent > 15000, 'Premium', 'Regular')


3️⃣ Sort – Order results by TotalSpent in descending order.

✅ Output
Sample Result (after transformation):
OrderID CustomerName ProductID OrderAmount OrderDate   Region TotalSpent CustomerType
1008    Henry        P103      13000       22-08-2025 US     21000      Premium
1010    Jack         P105      7200        24-08-2025 US     14000      Premium
1013    Mona         P103      6700        17-08-2025 US     12500      Premium
1001    Alice        P101      7500        25-08-2025 US     12000      Regular
1006    Frank        P101      6000        18-08-2025 US     11000      Regular
