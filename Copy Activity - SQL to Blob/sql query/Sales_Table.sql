
-- Create Table
CREATE TABLE dbo.DailySales (
    SaleID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName NVARCHAR(100),
    Category NVARCHAR(50),
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    SaleDate DATE
);


--insert records 
INSERT INTO dbo.DailySales (ProductName, Category, Quantity, UnitPrice, SaleDate)
VALUES
('Laptop', 'Electronics', 2, 65000.00, '2025-08-06'),
('Mouse', 'Electronics', 5, 1200.00, '2025-08-06'),
('Desk Chair', 'Furniture', 1, 8500.00, '2025-08-06'),
('Monitor', 'Electronics', 3, 15000.00, '2025-08-07'),
('Notebook', 'Stationery', 20, 50.00, '2025-08-07'),
('Pen', 'Stationery', 50, 10.00, '2025-08-07'),
('Keyboard', 'Electronics', 4, 2500.00, '2025-08-08'),
('Office Desk', 'Furniture', 1, 12000.00, '2025-08-08');

--Filter today rows
SELECT *
FROM dbo.DailySales
WHERE SaleDate = CAST(GETDATE() AS DATE);