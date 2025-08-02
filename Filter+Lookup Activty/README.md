📂 ADF Pipeline: Lookup + Filter Activity (Country = India)

This Azure Data Factory pipeline demonstrates how to use Lookup and Filter activities to process data from a CSV file and extract only the records where the country is India.

Lookup Activity: Retrieves data from a source (like a database or file) and makes it available for downstream activities in the pipeline.

Filter Activity: Filters items from only an array input (like lookup output) based on a specified condition or expression.

📌 Objective
Filter customers from a CSV file (customers.csv) where the Country field is equal to "India".

🧱 Pipeline Components

Parameter:

CountryName Type String 

1. Lookup Activity
------------------
Name: Lookup1

Purpose: Reads all records from the source CSV file.

Settings:

✅ First row only : False

2. Filter Activity
------------------

Name: Filter1

Purpose: Filters only customers from India.

Expressions:

Items: @activity('Lookup1').output.value
Conditions: @equals(item().Country, pipeline().parameters.CountryName)


📄 Sample Input (customers.csv)

CustomerID,CustomerName,Country
100,Deepika,India
101,Hariharan,India
102,Biden,USA
103,Donald Trump,USA
104,David Warner,Australia
...
✅ Filter Output (Expected)
json
Copy
Edit
{
  "ItemsCount": 10,
  "FilteredItemsCount": 2,
  "Value": [
    {
      "CustomerID": "100",
      "CustomerName": "Deepika",
      "Country": "India"
    },
    {
      "CustomerID": "101",
      "CustomerName": "Hariharan",
      "Country": "India"
    }
  ]
}
📝 Notes:

Parameter Value No single quotes around the string. Parameter CountryName should be India neither "India" nor 'India' wont work 

Ensure the Lookup Activity returns a JSON array (output.value)

The filter expression must use single quotes around the string:

@equals(item().Country, 'India')
Filtering is case-sensitive. 'India' ≠ 'india'.

📦 Optional Enhancements:

Use a ForEach after Filter to copy data into another system.

Write the filtered records into another CSV or SQL table.

Parameterize the country filter for reuse.




