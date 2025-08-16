📂 Azure Data Factory – Until + Wait Activity Example

📖 What are These Activities?

⏱ Wait Activity → Pauses pipeline execution for a set time (seconds, minutes, hours, or days).

Useful for adding delays between retries, or waiting for external processes to complete.

🔄 Until Activity → Similar to a Do-Until loop in programming.

Keeps executing inner activities until a condition becomes true, or until max timeout is reached.

Guarantees at least one execution cycle.

📌 Scenario

This pipeline demonstrates how to continuously check for a file in the Sales container before copying it to the output location.
The logic is built using Until, Get Metadata, If Condition, Wait, and Copy activities.

🔄 Workflow

Until Activity – Keeps looping until the file exists (or until max timeout).

Get Metadata – Checks if the file Sales_Raw_data.csv exists in the Sales container.

Dataset path → sales/Sales_Raw_data.csv

Field Type chosen → exists

If Condition – Evaluates file existence using:

@equals(activity('Get Metadata1').output.exists, true)


✅ True → File exists → Run Copy Activity

❌ False → File not found → Wait before re-checking

Copy Activity – Copies Sales_Raw_data.csv from sales container → sales_output container.

Wait Activity – Adds delay (e.g., 2 minutes) before looping again if file not found.

🧑‍💻 Real-World Use Case

File Arrival Monitoring → ADF waits until the daily sales file arrives in the sales container.

Once available → file is copied into the sales_output container for further processing.

⚙️ Expressions Used

Until Expression:

@equals(activity('Get Metadata1').output.exists, true)


If Condition Expression:

@equals(activity('Get Metadata1').output.exists, true)

🚀 Best Practices

Use short waits (1–5 min) to avoid pipeline cost overhead.

Always define a timeout for Until activity (e.g., 1 hour) to prevent infinite loops.

Use clear naming conventions for datasets and activities (e.g., GetMetadata_SalesFile).

📁 Files Included

| File                                       | Purpose                                                   |
| ------------------------------------------ | --------------------------------------------------------- |
| `pipelines/pipeline1.json` 		     | Full pipeline JSON definition                             |
| `datasets/ds_blob_sales.json`              | Dataset for input sales file (`sales/Sales_Raw_data.csv`) |
| `datasets/ds_blob_output_sales.json`       | Dataset for output file                                   |
| `linkedServices/ls_blob_sales.json`        | Linked Service to Azure Blob Storage                      |
| `input-data/Sales_Raw_data.csv`            | Sample input sales file                                   |


✅ With this approach, your pipeline can safely wait for late-arriving files without manual intervention.


