-- Create Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100)
);

-- Create Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert into Customers
INSERT INTO Customers (CustomerID, Name, Email) VALUES
(1, 'Ravi Shah', 'ravi@example.com'),
(2, 'Sneha Patil', 'sneha@example.com'),
(3, 'Amit Kulkarni', 'amit@example.com'),
(4, 'John Doe', NULL);  -- This customer has no email and may be unmatched

-- Insert into Orders
INSERT INTO Orders (OrderID, OrderDate, CustomerID) VALUES
(101, '2025-06-01', 1),
(102, '2025-06-02', 2),
(103, '2025-06-03', 1),
(104, '2025-06-04', NULL);  -- This order has no linked customer (simulates missing FK)

select * from customers;
select * from orders;

-- INNER JOIN – only matching records from both tables

SELECT c.CustomerID, c.Name, o.OrderID, o.OrderDate
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID;


--  FULL OUTER JOIN – combine all customers and orders (even unmatched)

SELECT c.CustomerID, c.Name, o.OrderID, o.OrderDate
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID

UNION

SELECT c.CustomerID, c.Name, o.OrderID, o.OrderDate
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID;

