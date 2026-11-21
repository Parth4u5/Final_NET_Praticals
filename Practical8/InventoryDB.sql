USE master;
GO

IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'InventoryDB')
BEGIN
    CREATE DATABASE InventoryDB;
END
GO

USE InventoryDB;
GO

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Products' AND xtype='U')
BEGIN
    CREATE TABLE Products (
        ProductId INT NOT NULL PRIMARY KEY,
        ProductName NVARCHAR(100) NOT NULL,
        Quantity INT NOT NULL,
        Price DECIMAL(18,2) NOT NULL
    );

    INSERT INTO Products (ProductId, ProductName, Quantity, Price) VALUES
    (1, 'Wireless Mouse', 25, 799.00),
    (2, 'Mechanical Keyboard', 10, 2499.00),
    (3, 'USB-C Hub', 40, 1299.50);
END
GO
