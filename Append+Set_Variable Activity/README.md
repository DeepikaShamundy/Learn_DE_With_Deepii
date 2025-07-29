# 🧩 Append Variable Activity – Azure Data Factory

## 🎯 Objective

This Azure Data Factory pipeline demonstrates how to use **Append Variable** and **Set Variable** activities to manage and modify array values within a pipeline. It appends `"azure"` to an existing `skills` array and stores the result in a new variable `new_skills`.

---

## ⚙️ Configuration Details

| Component            | Details                             |
|----------------------|--------------------------------------|
| Variables            | `skills` (Array), `new_skills` (Array) |
| Initial `skills`     | `["SQL", "PYTHON", "JAVA"]`          |
| New Item to Append   | `"azure"`                            |
| Expression Used      | `@union(variables('skills'), createArray('azure'))` |
| Activities Used      | Set Variable                         |

---

## 🔄 Workflow

1. **Initialize Variable** – `skills` array is initialized with 3 values: `["SQL", "PYTHON", "JAVA"]`.
2. **Set Variable Activity** – A new array `new_skills` is created by appending `"azure"` to `skills`.
3. **Output** – Final value of `new_skills`:  
   ```json
   ["SQL", "PYTHON", "JAVA", "azure"]

📁 Files Included

| File                          | Purpose                               |
| ----------------------------- | ------------------------------------- |
| `pipelines/pipeline1.json` 	| Contains pipeline JSON for append/set |
| `README.md`                   | This documentation file               |


✅ Use Case
This is useful when you need to dynamically build lists inside pipelines—like collecting results, dynamically building parameters, or managing iterative configurations in ForEach activities.
