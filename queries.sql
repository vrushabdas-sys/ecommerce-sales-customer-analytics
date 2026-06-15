# Section 1 — Data Exploration (1–5)

### Query 1: Total Customers

```sql
SELECT COUNT(*) AS Total_Customers
FROM Customers;
```

### Query 2: Total Products

```sql
SELECT COUNT(*) AS Total_Products
FROM Products;
```

### Query 3: Total Orders

```sql
SELECT COUNT(*) AS Total_Orders
FROM Orders;
```

### Query 4: Total Revenue

```sql
SELECT ROUND(SUM(orderAmount),2) AS Total_Revenue
FROM Orders;
```

### Query 5: Average Order Value

```sql
SELECT ROUND(AVG(orderAmount),2) AS Avg_Order_Value
FROM Orders;
```

---

# Section 2 — Sales Analytics (6–12)

### Query 6: Monthly Revenue Trend

```sql
SELECT
YEAR(orderDate) AS Year,
MONTH(orderDate) AS Month,
ROUND(SUM(orderAmount),2) AS Revenue
FROM Orders
GROUP BY Year,Month
ORDER BY Year,Month;
```

### Query 7: Monthly Order Count

```sql
SELECT
YEAR(orderDate),
MONTH(orderDate),
COUNT(*) AS Orders_Count
FROM Orders
GROUP BY YEAR(orderDate),MONTH(orderDate)
ORDER BY 1,2;
```

### Query 8: Highest Revenue Month

```sql
SELECT
YEAR(orderDate),
MONTH(orderDate),
SUM(orderAmount) Revenue
FROM Orders
GROUP BY 1,2
ORDER BY Revenue DESC
LIMIT 1;
```

### Query 9: Lowest Revenue Month

```sql
SELECT
YEAR(orderDate),
MONTH(orderDate),
SUM(orderAmount) Revenue
FROM Orders
GROUP BY 1,2
ORDER BY Revenue
LIMIT 1;
```

### Query 10: Revenue by Quarter

```sql
SELECT
YEAR(orderDate),
QUARTER(orderDate),
ROUND(SUM(orderAmount),2) Revenue
FROM Orders
GROUP BY 1,2;
```

### Query 11: Running Revenue

```sql
SELECT
orderDate,
SUM(orderAmount)
OVER(ORDER BY orderDate) Running_Revenue
FROM Orders;
```

### Query 12: Revenue Contribution %

```sql
SELECT
orderId,
orderAmount,
ROUND(
orderAmount*100/
SUM(orderAmount) OVER(),
2
) AS Revenue_Percent
FROM Orders;
```

---

# Section 3 — Customer Analytics (13–18)

### Query 13: Top 10 Customers by Spending

```sql
SELECT
c.custId,
c.custName,
ROUND(SUM(o.orderAmount),2) Total_Spent
FROM Customers c
JOIN Orders o
ON c.custId=o.custId
GROUP BY c.custId,c.custName
ORDER BY Total_Spent DESC
LIMIT 10;
```

### Query 14: Top Customer

```sql
SELECT
c.custName,
SUM(o.orderAmount) TotalSpent
FROM Customers c
JOIN Orders o
ON c.custId=o.custId
GROUP BY c.custName
ORDER BY TotalSpent DESC
LIMIT 1;
```

### Query 15: Customer Order Frequency

```sql
SELECT
custId,
COUNT(*) Total_Orders
FROM Orders
GROUP BY custId
ORDER BY Total_Orders DESC;
```

### Query 16: Repeat Customers

```sql
SELECT
custId,
COUNT(*) Orders_Count
FROM Orders
GROUP BY custId
HAVING COUNT(*) > 1;
```

### Query 17: One-Time Customers

```sql
SELECT
custId
FROM Orders
GROUP BY custId
HAVING COUNT(*)=1;
```

### Query 18: Customers by City

```sql
SELECT
city,
COUNT(*) Customers
FROM Customers
GROUP BY city
ORDER BY Customers DESC;
```

---

# Section 4 — Product Analytics (19–25)

### Query 19: Top Selling Products

```sql
SELECT
productCode,
SUM(qty) Units_Sold
FROM OrderItems
GROUP BY productCode
ORDER BY Units_Sold DESC
LIMIT 10;
```

### Query 20: Revenue by Product

```sql
SELECT
productCode,
ROUND(SUM(qty*unitPrice),2) Revenue
FROM OrderItems
GROUP BY productCode
ORDER BY Revenue DESC;
```

### Query 21: Top Revenue Product

```sql
SELECT
productCode,
ROUND(SUM(qty*unitPrice),2) Revenue
FROM OrderItems
GROUP BY productCode
ORDER BY Revenue DESC
LIMIT 1;
```

### Query 22: Bottom Revenue Product

```sql
SELECT
productCode,
ROUND(SUM(qty*unitPrice),2) Revenue
FROM OrderItems
GROUP BY productCode
ORDER BY Revenue
LIMIT 1;
```

### Query 23: Product Performance Ranking

```sql
SELECT
productCode,
SUM(qty*unitPrice) Revenue,
RANK() OVER(
ORDER BY SUM(qty*unitPrice) DESC
) Product_Rank
FROM OrderItems
GROUP BY productCode;
```

### Query 24: Average Quantity Sold

```sql
SELECT
productCode,
ROUND(AVG(qty),2)
FROM OrderItems
GROUP BY productCode;
```

### Query 25: Products Never Ordered

```sql
SELECT p.productCode
FROM Products p
LEFT JOIN OrderItems oi
ON p.productCode=oi.productCode
WHERE oi.productCode IS NULL;
```

---

# Section 5 — Category Analytics (26–29)

### Query 26: Revenue by Category

```sql
SELECT
c.categoryName,
ROUND(SUM(oi.qty*oi.unitPrice),2) Revenue
FROM Categories c
JOIN Products p
ON c.categoryId=p.categoryId
JOIN OrderItems oi
ON p.productCode=oi.productCode
GROUP BY c.categoryName
ORDER BY Revenue DESC;
```

### Query 27: Best Performing Category

```sql
SELECT
c.categoryName,
SUM(oi.qty*oi.unitPrice) Revenue
FROM Categories c
JOIN Products p
ON c.categoryId=p.categoryId
JOIN OrderItems oi
ON p.productCode=oi.productCode
GROUP BY c.categoryName
ORDER BY Revenue DESC
LIMIT 1;
```

### Query 28: Units Sold by Category

```sql
SELECT
c.categoryName,
SUM(oi.qty) UnitsSold
FROM Categories c
JOIN Products p
ON c.categoryId=p.categoryId
JOIN OrderItems oi
ON p.productCode=oi.productCode
GROUP BY c.categoryName;
```

### Query 29: Category Share %

```sql
SELECT
c.categoryName,
ROUND(
SUM(oi.qty*oi.unitPrice)*100/
SUM(SUM(oi.qty*oi.unitPrice))
OVER(),
2
) Revenue_Share
FROM Categories c
JOIN Products p
ON c.categoryId=p.categoryId
JOIN OrderItems oi
ON p.productCode=oi.productCode
GROUP BY c.categoryName;
```

---

# Section 6 — Review Analytics (30–34)

### Query 30: Average Product Rating

```sql
SELECT
productCode,
ROUND(AVG(stars),2) Avg_Rating
FROM ProductReviews
GROUP BY productCode
ORDER BY Avg_Rating DESC;
```

### Query 31: Highest Rated Products

```sql
SELECT
productCode,
AVG(stars) Rating
FROM ProductReviews
GROUP BY productCode
ORDER BY Rating DESC
LIMIT 10;
```

### Query 32: Lowest Rated Products

```sql
SELECT
productCode,
AVG(stars) Rating
FROM ProductReviews
GROUP BY productCode
ORDER BY Rating
LIMIT 10;
```

### Query 33: Rating Distribution

```sql
SELECT
stars,
COUNT(*) Reviews
FROM ProductReviews
GROUP BY stars;
```

### Query 34: Total Reviews per Product

```sql
SELECT
productCode,
COUNT(*) Reviews
FROM ProductReviews
GROUP BY productCode
ORDER BY Reviews DESC;
```

---

# Section 7 — Cart Analytics (35–38)

### Query 35: Most Added Products to Cart

```sql
SELECT
productCode,
SUM(quantity) Cart_Qty
FROM Cart
GROUP BY productCode
ORDER BY Cart_Qty DESC;
```

### Query 36: Customers with Largest Cart

```sql
SELECT
custId,
SUM(quantity) Total_Items
FROM Cart
GROUP BY custId
ORDER BY Total_Items DESC;
```

### Query 37: Average Cart Size

```sql
SELECT
ROUND(AVG(quantity),2)
FROM Cart;
```

### Query 38: Potential Abandoned Cart Revenue

```sql
SELECT
ROUND(
SUM(c.quantity*1000),
2
) Estimated_Value
FROM Cart c;
```

