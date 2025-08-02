# Azure Data Factory Pipeline - Load Customer Data by Country (Switch Activity)

## 🎯 Objective

This ADF pipeline loads a CSV file from Azure Blob Storage into an Azure SQL table **based on the input country** using a **Switch activity**.

📘 What is Switch Activity?

Switch activity in Azure Data Factory allows you to define multiple conditional paths based on the value of a single expression—similar to switch-case logic or IF-ELSE in programming language.


## 🧩 Pipeline Overview

The pipeline accepts 3 parameters:

| Parameter     | Type   | Description                                  |
|---------------|--------|----------------------------------------------|
| `country`     | String | Country name (`India`, `USA`, or `UK`)       |
| `FileName`    | String | File name to load (e.g., `Customers_India.csv`) |
| `TableName`   | String | SQL table name to load data into              |

---

## 🔁 Switch Activity Logic

- The `Switch` activity uses `@pipeline().parameters.country` to evaluate the country.
- For each country (`India`, `USA`, `UK`), a **Copy activity** is triggered.
- The selected CSV file is copied to the corresponding SQL table.

# Go to Activities, Expression paste the below : 

@pipeline().parameters.Country

- Connected to pipeline parameter: `Country`

Note: This should match with the cases given in switch, then that particular branch will execute . If country Name as "USA", then Case1 Name as "USA", then only corresponding activities inside will work.

### 📌 Example Cases

| Country | FileName             | TableName         |
|---------|----------------------|-------------------|
| India   | Customers_India.csv  | Customers_India   |
| USA     | Customers_USA.csv    | Customers_USA     |
| UK      | Customers_UK.csv     | Customers_UK      |

---

## 📁 Dataset Configuration

### Source: Azure Blob Storage (CSV)
- Dataset parameter: `fileName`
- File path:  @dataset().filename

- Connected to pipeline parameter: `FileName`

### Sink: Azure SQL Database
- Dataset parameter: `tableName`
- Table name:  @dataset().tableName

- Connected to pipeline parameter: `TableName`

---

## ✅ Example Run

If you run the pipeline with:

```json
{
"country": "USA",
"FileName": "Customers_USA.csv",
"TableName": "Customers_USA"
}
➡️ Only the USA branch will run, and data from Customers_USA.csv will be loaded into the Customers_USA SQL table.

⚠️ Prerequisites
Files (Customers_India.csv, etc.) must exist in the Blob container.

SQL tables (Customers_India, Customers_USA, Customers_UK) must already be created.

File schema must match the table schema.

💡 Tips
To simplify: use dynamic expressions to auto-generate FileName and TableName:

json
Copy
Edit
FileName: @concat('Customers_', pipeline().parameters.country, '.csv')
TableName: @concat('Customers_', pipeline().parameters.country)
This way, you only need to pass the country value.

📌 Summary
This pipeline uses Switch to control which dataset to load based on the country. 


