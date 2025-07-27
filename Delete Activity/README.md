🗑️ Delete Activity – Azure Data Factory
🎯 Objective
This pipeline demonstrates a basic Delete Activity in Azure Data Factory, where a file (sales_raw_data.csv) is deleted from Azure Blob Storage.

🛠️ Configuration Details

Component		Value / Type
Activity Type		Delete Activity
Source			Azure Blob Storage
File to Delete		sales_raw_data.csv
Dataset Type		DelimitedText (CSV)
Integration Runtime	AutoResolveIntegrationRuntime
Recursive		False (only this file)
Wildcard Path		Optional (if multiple files)
Enable Logging		Optional (Good to have)

📁 Files Included

File							Purpose
pipelines/pipeline1.json				ADF pipeline containing delete activity
datasets/ds_delete_source.json				Dataset pointing to file to delete
linkedServices/ls_delete_blob.json			Azure Blob Storage linked service
input-data/sales_raw_data.csv				The file that will be deleted
deleted-files/b3344bbb-b0a9-4359-86ec-db0d942bfa26.csv 	Deleted file details

✅ Output
Once run in debug mode, the file sales_raw_data.csv located in Azure Blob Storage will be permanently deleted using the Delete Activity.

If enable logging enabled, check in the respective folder (deleted_files) to know which deleted file details. 