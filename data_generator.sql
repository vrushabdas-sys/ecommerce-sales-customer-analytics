INSERT INTO Categories VALUES
(1,'Electronics'),
(2,'Home & Kitchen'),
(3,'Clothing'),
(4,'Beauty'),
(5,'Toys & Games'),
(6,'Sports & Outdoors'),
(7,'Books'),
(8,'Automotive');
DELIMITER $$

CREATE PROCEDURE GenerateProducts()
BEGIN

DECLARE i INT DEFAULT 1;

WHILE i <= 100 DO

INSERT INTO Products
VALUES
(
i,
CONCAT('Product_',i),
CONCAT('PRD',LPAD(i,3,'0')),
FLOOR(1 + RAND()*8)
);

SET i = i + 1;

END WHILE;

END $$

DELIMITER ;

CALL GenerateProducts();
DELIMITER $$

CREATE PROCEDURE GenerateCustomers()
BEGIN

DECLARE i INT DEFAULT 1;

WHILE i <= 200 DO

INSERT INTO Customers
VALUES
(
1000+i,
CONCAT('Customer_',i),
CONCAT('customer',i,'@gmail.com'),

ELT(
FLOOR(1+RAND()*8),
'Mumbai',
'Delhi',
'Bangalore',
'Pune',
'Hyderabad',
'Chennai',
'Ahmedabad',
'Kolkata'
)
);

SET i=i+1;

END WHILE;

END $$

DELIMITER ;
CALL GenerateCustomers();
SELECT * FROM Customers;
DELIMITER $$

CREATE PROCEDURE GenerateOrders()
BEGIN

DECLARE i INT DEFAULT 1;

WHILE i <= 1000 DO

INSERT INTO Orders
VALUES
(
10000+i,

DATE_ADD(
'2024-01-01',
INTERVAL FLOOR(RAND()*730) DAY
),

1000 + FLOOR(1 + RAND()*200),

ROUND(
100 + RAND()*5000,
2
)
);

SET i=i+1;

END WHILE;

END $$

DELIMITER ;
CALL GenerateOrders();
SELECT * FROM Orders;
DELIMITER $$

CREATE PROCEDURE GenerateOrderItems()
BEGIN

DECLARE i INT DEFAULT 1;

WHILE i <= 3000 DO

INSERT INTO OrderItems
VALUES
(
i,

10001 + FLOOR(RAND()*1000),

CONCAT(
'PRD',
LPAD(FLOOR(1+RAND()*100),3,'0')
),

FLOOR(1+RAND()*5),

ROUND(
50 + RAND()*2000,
2
)
);

SET i=i+1;

END WHILE;

END $$

DELIMITER ;
CALL GenerateOrderItems();
SELECT * FROM OrderItems;
DELIMITER $$

CREATE PROCEDURE GenerateCart()
BEGIN

DECLARE i INT DEFAULT 1;

WHILE i <= 500 DO

INSERT INTO Cart
VALUES
(
i,

1000 + FLOOR(1 + RAND()*200),

CONCAT(
'PRD',
LPAD(FLOOR(1+RAND()*100),3,'0')
),

FLOOR(1+RAND()*5),

NOW() - INTERVAL FLOOR(RAND()*180) DAY
);

SET i=i+1;

END WHILE;

END $$

DELIMITER ;
CALL GenerateCart();
Select * from Cart;
DELIMITER $$

CREATE PROCEDURE GenerateReviews()
BEGIN

DECLARE i INT DEFAULT 1;

WHILE i <= 800 DO

INSERT INTO ProductReviews
VALUES
(
i,

1000 + FLOOR(1 + RAND()*200),

CONCAT(
'PRD',
LPAD(FLOOR(1+RAND()*100),3,'0')
),

NOW() - INTERVAL FLOOR(RAND()*365) DAY,

FLOOR(1+RAND()*5)
);

SET i=i+1;

END WHILE;

END $$

DELIMITER ;
CALL GenerateReviews();
SELECT * FROM ProductReviews;
