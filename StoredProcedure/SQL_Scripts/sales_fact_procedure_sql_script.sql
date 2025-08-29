CREATE PROCEDURE sales_fact
AS
BEGIN
  
    -- Remove duplicate transactions
    ;WITH cte_del_duplicates AS (
        SELECT *,
               ROW_NUMBER() OVER(PARTITION BY TransactionID ORDER BY LoadDate DESC) AS rn
        FROM Sales
    )
    DELETE FROM Sales
    WHERE TransactionID IN (
        SELECT TransactionID
        FROM cte_del_duplicates
        WHERE rn > 1
    );

    -- Log and remove rows with NULL CustomerID
    INSERT INTO Invalid_Sales_Transaction
    (TransactionID, TransactionDate, CustomerID, StoreID, ProductID, Quantity, Price, TotalAmount, PaymentType, LoadDate, ProcessedDate)
    SELECT TransactionID, TransactionDate, CustomerID, StoreID, ProductID, Quantity, Price, TotalAmount, PaymentType, LoadDate, GETDATE()
    FROM Sales
    WHERE CustomerID IS NULL;

    DELETE FROM Sales
    WHERE CustomerID IS NULL;

    --  Update ProcessedDate as sysdate for remaining records
    UPDATE Sales
    SET ProcessedDate = GETDATE()
    WHERE ProcessedDate IS NULL;
END;
