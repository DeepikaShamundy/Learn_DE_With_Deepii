📦 Incoming Sales File Validation & Copy – Azure Data Factory

🎯 Objective
This pipeline validates the presence and size of multiple incoming sales CSV files in Azure Blob Storage before copying them to an output folder. If a file is missing or has zero size, a message is logged into a variable instead of copying.

🛠️ Configuration Details


| Component                | Value / Type                                                                                                                          |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Variable**             | `IncomingSalesFile` (Array) ["Store1_Sales.csv", "Store2_Sales.csv", "Store3_Sales.csv"]      
|
| **Loop Mechanism**       | ForEach → @variables('IncomingSalesFile')                                                                                             |
| **Metadata Dataset**     | `ds_sales_store_files` (parameterized dataset with `FileName` parameter)                                                              |
| **File Path in Dataset** | @dataset().FileName`                                                                          
|
| **Get Metadata Fields**  | `exists`, `size`, `itemName`                                                                                                          |
| **IF Condition Expression Check ** | @and(activity('Get Metadata1').output.exists, greater(activity('Get Metadata1').output.size, 0))                            |
| **True Branch**          | Copy Activity → Source: `ds_sales_store_files` (filename: @activity('Get Metadata1').output.itemName) → Sink: `ds_output_blob` (points to `output-sales/` folder) 																			   |
| **False Branch**         | Set Variable → @concat(activity('Get Metadata1').output.itemName, ' is missing or size less than zero')                               |



🔄 Pipeline Flow
Initialize Variable

Array variable IncomingSalesFile holds the expected sales file names.

ForEach Activity

Iterates through each filename in IncomingSalesFile.

Get Metadata Activity

Uses parameterized dataset ds_sales_store_files with current @item() as FileName.

Retrieves exists, size, and itemName.

If Condition Activity

Checks if file exists and size is greater than 0.

True Path (Valid File)

Copies the file from the source dataset to the output-sales folder using ds_output_blob.

False Path (Invalid File)

Use Delete activity to delete the file which size = 0

📁 Files Included
File	Purpose
pipelines/pipeline1.json		Full ADF pipeline JSON definition
datasets/ds_sales_store_files.json	Parameterized dataset for sales files
datasets/ds_blob_sales.json		Dataset pointing to output-sales folder
linkedServices/ls_blob_sales.json	Linked Service to Azure Blob Storage
input-data/StoreX_Sales.csv		Sample store sales files (used for testing)

✅ Output
Successful Validation: 2 Files copied to output-sales folder.( e.g.,  "Store1_Sales.csv,  "Store3_Sales.csv )

Failed Validation: Message is stored in a variable (e.g., "Store2_Sales.csv is missing or size less than zero").

This approach ensures that only valid and non-empty files are processed, reducing downstream errors in the data pipeline.

