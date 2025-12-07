CREATE TABLE [dbo].[Sales_Staging] (
    OrderID INT,
    OrderDate DATE,
    CustomerName NVARCHAR(100),
    ProductName NVARCHAR(100),
    Quantity INT,
    UnitPrice DECIMAL(10, 2)
);
