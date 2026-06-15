CREATE DATABASE EcommerceAnalytics;
USE EcommerceAnalytics;

CREATE TABLE Categories (
    categoryId INT PRIMARY KEY,
    categoryName VARCHAR(100)
);

CREATE TABLE Products (
    productId INT PRIMARY KEY,
    productName VARCHAR(100),
    productCode VARCHAR(20) UNIQUE,
    categoryId INT,
    FOREIGN KEY (categoryId)
    REFERENCES Categories(categoryId)
);

CREATE TABLE Customers (
    custId INT PRIMARY KEY,
    custName VARCHAR(100),
    email VARCHAR(150),
    city VARCHAR(100)
);

CREATE TABLE Orders (
    orderId INT PRIMARY KEY,
    orderDate DATE,
    custId INT,
    orderAmount DECIMAL(12,2),
    FOREIGN KEY (custId)
    REFERENCES Customers(custId)
);

CREATE TABLE OrderItems (
    orderItemId INT PRIMARY KEY,
    orderId INT,
    productCode VARCHAR(20),
    qty INT,
    unitPrice DECIMAL(10,2),
    FOREIGN KEY (orderId)
    REFERENCES Orders(orderId)
);

CREATE TABLE Cart (
    cartId INT PRIMARY KEY,
    custId INT,
    productCode VARCHAR(20),
    quantity INT,
    date_added DATETIME
);


CREATE TABLE ProductReviews (
    reviewId INT PRIMARY KEY,
    custId INT,
    productCode VARCHAR(20),
    submit_datetime DATETIME,
    stars INT
);
