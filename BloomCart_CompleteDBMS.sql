
CREATE TABLE Customer (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Street VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(50),
    Zip VARCHAR(20)
);


CREATE TABLE Product (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100),
    Description TEXT,
    Price DECIMAL(10,2),
    Category VARCHAR(50)
);


CREATE TABLE `Order` (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    DeliveryDate DATE,
    TotalAmount DECIMAL(10,2),
    PaymentStatus VARCHAR(20),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);


CREATE TABLE OrderDetails (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES `Order`(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);


CREATE TABLE Payment (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    PaymentMethod VARCHAR(50),
    PaymentDate DATE,
    Amount DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES `Order`(OrderID)
);


CREATE TABLE Delivery (
    DeliveryID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    DeliveryAddress VARCHAR(255),
    DeliveryStatus VARCHAR(50),
    DeliveryTimeWindow VARCHAR(50),
    FOREIGN KEY (OrderID) REFERENCES `Order`(OrderID)
);
