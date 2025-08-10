📦 Delete Activity – Azure Data Factory

🎯 Objective

This pipeline demonstrates how to use the Delete Activity in Azure Data Factory to remove specific processed sales files from a staging folder in Azure Blob Storage.

It directly deletes the listed files without using wildcards, conditions, or metadata checks.



🛠 Configuration Details



| Component               | Value / Type                                                                                                                       |

| ----------------------- | ---------------------------------------------------------------------------------------------------------------------------------- |

| \*\*Source Dataset\*\*      | Azure Blob Storage                                                                                                                 |

| \*\*Folder Path\*\*         | `staging/` (exact file paths provided)                                                                                             |

| \*\*Files to Delete\*\*     | `Sales\_Raw\_Data\_1.csv`, `Sales\_Raw\_Data\_2.csv`, `Sales\_Raw\_Data\_3.csv`, `Store1\_Sales.csv`, `Store2\_Sales.csv`, `Store3\_Sales.csv` |

| \*\*Recursive\*\*           | `False` (not required since file paths are direct)                                                                                 |

| \*\*Wildcard\*\*            | Not used                                                                                                                           |

| \*\*Integration Runtime\*\* | AutoResolveIntegrationRuntime                                                                                                      |





🔄 Pipeline Flow

Delete Activity



Dataset points to each of the exact files in the staging folder.



No condition or existence check — pipeline assumes files are present.



If any file is missing, pipeline will fail for that activity.



📁 Files Included



| File                                           | Purpose                                                       |

| ---------------------------------------------- | ------------------------------------------------------------- |

| `pipelines/DeleteSpecificSalesFiles.json`      | ADF pipeline containing Delete Activity for each file         |

| `datasets/SalesFile1.json` – `SalesFile6.json` | Datasets pointing to each specific sales file in Blob Storage |

| `linkedServices/BlobStorage.json`              | Linked Service to Azure Blob Storage                          |

| `sample-data/`                                 | Example sales files for testing                               |



✅ Output

When all files exist:



All 6 files are deleted from the staging folder successfully.



When any file is missing:



Delete Activity for that file fails, causing the pipeline to fail unless error handling is configured.



📌 Best Practices



Use error handling (Retry / Continue on Error) if files may not always be present.



Avoid running in production without backup if data retention is required.



Group deletes in a ForEach loop if you want to maintain a single dataset with parameterized file names.

