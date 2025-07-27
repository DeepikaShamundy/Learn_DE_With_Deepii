📦 Get Metadata Activity – Azure Data Factory
🎯 Objective
This pipeline demonstrates how to use the Get Metadata Activity to extract properties (like file size, last modified date, child items, etc.) from a file or folder in Azure Blob Storage.

🛠️ Configuration Details

| Component               | Value / Type                          |
| ----------------------- | ------------------------------------- |
| **Source**              | Azure Blob Storage                    |
| **Dataset Type**        | Binary or DelimitedText (CSV)         |
| **File/Folder Path**    | `input-data/` or `sales_raw_data.csv` |
| **Field List**          | `childItems`, `lastModified`, `size`  |
| **Sink**                | None (used only for inspection)       |
| **Integration Runtime** | AutoResolveIntegrationRuntime         |

🧱 Example Field List
You can configure Field List in Get Metadata activity with:

childItems – To list folder contents

lastModified – To get last modified date of a file

size – To get file size

itemName – For file or folder name

📁 Files Included
File	Purpose
pipelines/GetMetadataPipeline.json	ADF pipeline with Get Metadata Activity
datasets/BlobMetadata.json	Dataset pointing to blob or folder
linkedServices/BlobStorage.json	Connection to Azure Blob Storage
input-data/sales_raw_data.csv	Sample input CSV file

✅ Output
When you debug the pipeline:

It returns the selected metadata (like file size, last modified, or list of files in a folder).

You can then pass this metadata to other activities (like ForEach to loop over files).