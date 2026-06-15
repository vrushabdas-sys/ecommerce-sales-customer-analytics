# E-Commerce Sales & Customer Analytics Using SQL

## Project Overview

This project simulates a real-world e-commerce database and demonstrates advanced SQL analytics techniques used by Data Analysts to extract business insights from transactional data.

The project contains 5,600+ records distributed across 7 relational tables and covers customer behavior analysis, sales performance tracking, product analytics, category performance, cart analysis, and customer review analytics.

---

## Business Problem

E-commerce companies generate large volumes of transactional data every day. The objective of this project is to analyze customer purchasing behavior, product performance, revenue trends, customer retention, and product ratings to support data-driven business decisions.

---

## Database Schema

The database consists of the following tables:

| Table          | Description                    |
| -------------- | ------------------------------ |
| Categories     | Product category information   |
| Products       | Product catalog                |
| Customers      | Customer master data           |
| Orders         | Customer orders                |
| OrderItems     | Product-level order details    |
| Cart           | Shopping cart activity         |
| ProductReviews | Product review and rating data |

---

## Dataset Summary

| Table          | Records |
| -------------- | ------: |
| Categories     |       8 |
| Products       |     100 |
| Customers      |     200 |
| Orders         |   1,000 |
| OrderItems     |   3,000 |
| Cart           |     500 |
| ProductReviews |     800 |

**Total Records: 5,608+**

---

## SQL Concepts Used

* Joins (INNER JOIN, LEFT JOIN)
* Aggregate Functions
* GROUP BY & HAVING
* Common Business KPIs
* Window Functions
* Ranking Functions
* Revenue Analysis
* Customer Segmentation
* Product Performance Analysis
* Review Analytics
* Cart Analytics
* Date Functions

---

## Key Business Questions Solved

### Sales Analytics

* What is the total revenue generated?
* What is the monthly sales trend?
* Which month generated the highest revenue?
* What is the average order value?

### Customer Analytics

* Who are the top spending customers?
* Which customers are repeat buyers?
* Which city contributes the most customers?
* What is the customer order frequency?

### Product Analytics

* Which products generate the highest revenue?
* Which products sell the most units?
* Which products have never been ordered?
* What are the top-performing products?

### Category Analytics

* Which category generates the highest revenue?
* What is the revenue contribution by category?
* Which category sells the highest volume?

### Review Analytics

* Which products receive the highest ratings?
* Which products receive the lowest ratings?
* What is the review distribution?

### Cart Analytics

* Which products are most frequently added to cart?
* What is the average cart size?
* What is the estimated value of abandoned carts?

---

## Project Structure

Ecommerce-SQL-Analytics/

├── schema.sql

├── data_generator.sql

├── analytics_queries.sql

├── README.md

└── ERD.png

---

## Tools Used

* MySQL
* MySQL Workbench
* SQL
* GitHub

---

## Key Insights Generated

* Identified top revenue-generating products and categories.
* Analyzed monthly revenue trends and seasonality.
* Discovered high-value customers contributing significant revenue.
* Evaluated customer purchasing behavior and repeat purchase patterns.
* Assessed product ratings and customer satisfaction metrics.
* Estimated potential revenue loss from cart abandonment.

---

## Resume Project Description

Developed an end-to-end E-Commerce Analytics project using MySQL by designing a relational database with 7 tables and analyzing 5,600+ records. Performed customer, sales, product, category, review, and cart analytics using advanced SQL concepts including joins, aggregations, window functions, ranking functions, and KPI reporting to generate actionable business insights.
