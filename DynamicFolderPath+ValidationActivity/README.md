📦 Dynamic Daily Folder + Validation – Azure Data Factory
## 🎯 Objective!!!!

This pipeline demonstrates how to implement dynamic daily folder partitioning along with a Validation Activity in Azure Data Factory. The pipeline ensures that files land in daily folders and exist before downstream processing (e.g., Stored Procedure or Data Flow). It also tracks pipeline execution status using variables.

🛠️ Configuration Details

| Component            | Value / Type                                               |
| -------------------- | ---------------------------------------------------------- |
| Source               | Azure Blob Storage / ADLS Gen2                             |
| Sink                 | Azure Blob Storage / ADLS Gen2                             |
| Folder Structure     | `/raw/sales/year=YYYY/month=MM/day=DD/`                    |
| Dataset Type         | DelimitedText / File                                       |
| Pipeline Activities  | Copy Activity, Validation Activity, Set Variable           |
| Dynamic Folder Path  | Parameterized in Sink Dataset (`folderPath`)               |
| Timeout (Validation) | 30 min (configurable)                                      |
| Child Items Option   | True / False / Ignore                                      |
| Variables            | `output-file-received` (success/failure)		    |
| Integration Runtime  | AutoResolveIntegrationRuntime                              |

📁 Files Included

| File                                    		 	| Purpose                                               |
| --------------------------------------------------------------| ----------------------------------------------------- |
| `pipeline/Dynamic_Folder_and_Validation_Activity.json` 	| ADF pipeline for dynamic folder copy + validation     |
| `datasets/ds_input_sales.json`,ds_output_sales.json           | Source and sink dataset configuration                 |
| `linkedServices/ls_input_sales.json`,ls_input_sales.json      | Blob/ADLS connection and SQL connection details       |
| `input-data/Daily_Sales_Data.csv`                         	| Sample input files                                    |

🔹 Key Features

Dynamic Folder Partitioning – Automatically creates folders by year/month/day based on pipeline run date.

Validation Activity – Ensures that files exist before executing downstream activities.

Set Variables for Status Tracking:

output-file-received → set to 'success' if validation passes, 'failure' if validation fails

PipelineStatus → can be used in alerts or downstream logic

Error Handling – Stops pipeline, triggers alerts, or sets status variables if validation fails.

Hidden Facts Considered – Handles hidden files, case sensitivity, timeout behavior, and child items traps.


✅ Pipeline Behavior

Daily partitioned folders are created automatically in the target storage.

Files are copied into the correct folder.

Validation Activity checks that files exist.


Set Variable Logic:

If files exist → output-file-received = 'success'

If files missing or folder empty → output-file-received = 'failure'

Alerts, logs, or downstream pipeline decisions can be based on output-file-received and PipelineStatus.