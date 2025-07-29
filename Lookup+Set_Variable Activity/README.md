:

📊 Lookup + Set Variable – Azure Data Factory

🎯 Objective
This ADF pipeline demonstrates the use of Lookup and Set Variable activities. It fetches the CustomerName from a raw sales data CSV file using the Lookup activity and stores the value in a pipeline variable using Set Variable.

🛠️ Configuration Details

| Component        | Value / Description                                                                |
| ---------------- | ---------------------------------------------------------------------------------- |
| **Source**       | Azure Blob Storage (CSV File)                                                      |
| **File**         | `sales_raw_data.csv`                                                               |
| **Dataset Type** | DelimitedText                                                                      |
| **Lookup Query** | `SELECT CustomerName FROM sales_raw_data`                                          |
| **Variable**     | `customerNameVar` (String)                                                         |
| **Set Variable** | Sets the variable using `@activity('LookupCustomer').output.firstRow.CustomerName` |


📁 Files Included

| File                               | Purpose                                   |
| ---------------------------------- | ----------------------------------------- |
| `pipelines/LookupSetVariable.json` | ADF pipeline with Lookup and Set Variable |
| `datasets/SalesDataset.json`       | Dataset pointing to the source CSV        |
| `linkedServices/BlobLS.json`       | Linked service to Azure Blob Storage      |
| `input-data/sales_raw_data.csv`    | Sample input file                         |


✅ Output
When the pipeline runs in Debug mode, it:

Looks up the first CustomerName from the source CSV file.

Assigns it to a variable called customerNameVar.

This value can then be used in subsequent activities (e.g., filtering, logging, or conditional flows).

Note : 
Lookup Settings - In Lookup, First Row only Checkbox enabled by default. Hence uncheck it, if you need to pull all the rows from the source


