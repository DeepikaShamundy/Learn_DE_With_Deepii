🔁 Execute Pipeline – Azure Data Factory
🎯 Objective
This pipeline demonstrates the use of the Execute Pipeline activity in Azure Data Factory, which allows you to trigger one pipeline from another, enabling modular and reusable designs.

🛠️ Configuration Details
Component	Description
Parent Pipeline	LoadToStagingPipeline
Child Pipeline	LoadToProductionPipeline
Activity Type	ExecutePipeline
Trigger Method	Manual (via Debug)
Parameters (if any)	Optional parameters can be passed to the child pipeline
Integration Runtime	AutoResolveIntegrationRuntime

📁 Files Included
File	Purpose
pipelines/LoadToProductionPipeline.json	Parent pipeline that calls the child pipeline
pipelines/LoadToStagingPipeline.json	Child pipeline containing the Copy activity
dataset/ds_final_data.json	Source and Sink dataset configuration
dataset/ds_sales_raw_data.json
dataset/ds_staging_data.json
linkedService/ls_blob_to_sql_db.json	Linked service definitions for SQL & Blob
linkedservice/ls_sql_db.json
input-data/sales_raw_data.csv	Sample input data
sql/Sales_Staging.sql	SQL table creation script for Sales Staging table
sql/Sales_Final.sql	SQL table creation script for Sales Final table


🔗 Flow Overview
The parent pipeline (LoadToProductionPipeline) runs.
It uses the Execute Pipeline activity to invoke the child pipeline (LoadToStagingPipeline)

The child performs performs the data movement (Copy activity) from blob (Sales_Raw_Data.csv) to SQL table (Sales_Staging). Execute Pipeline invoked the parent pipeline to move the Sales_Staging with filtered query(Quantity >50) into SQL table (Sales_Final)

✅ Output
When the parent pipeline is triggered:

It delegates execution to the child pipeline.

The child pipeline runs and performs its defined operations (e.g., copying data).