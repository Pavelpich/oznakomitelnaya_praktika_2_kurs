USE CustomerDB;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName NVARCHAR(100),
    LastName NVARCHAR(100),
    Email NVARCHAR(100),
    Phone NVARCHAR(20)
);