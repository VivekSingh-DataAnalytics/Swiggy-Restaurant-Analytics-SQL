# Swiggy-Restaurant-Analytics-SQL
Business-driven SQL analysis project using Swiggy restaurant data to uncover customer behavior, restaurant performance, pricing trends, delivery insights, and cuisine popularity through advanced SQL queries . Advanced SQL techniques such as CTEs, Window Functions, Correlated Subqueries, Ranking Functions, and Aggregate Analysis were used.

# 🍽️ Swiggy Restaurant Analytics Using SQL

## 📌 Project Overview

This project analyzes Swiggy restaurant data using SQL to generate business insights related to restaurant performance, pricing trends, customer engagement, popularity rankings, and city-wise market analysis.

The analysis was performed using SQL Server and focuses on solving real-world business questions through aggregation, ranking, filtering, Common Table Expressions (CTEs), window functions, and subqueries.

---

## 🎯 Business Objectives

The project aims to:

* Analyze restaurant distribution across cities
* Identify top-performing restaurants
* Measure customer engagement using ratings and reviews
* Evaluate restaurant pricing patterns
* Discover popular and underrated restaurants
* Understand city-wise contribution to customer reviews
* Segment restaurants based on popularity

---

## 🛠️ SQL Skills Demonstrated

* Common Table Expressions (CTEs)
* Window Functions
* DENSE_RANK()
* NTILE()
* Aggregate Functions
* Subqueries
* CASE Statements
* GROUP BY
* HAVING
* ORDER BY
* Data Filtering and Sorting

---

## 📊 Business Questions Solved

### Restaurant & City Analysis

* Total number of cities available in the dataset
* Total number of restaurants registered
* Restaurant count by city
* Top 5 cities with the highest number of restaurants
* City with the highest average restaurant rating

### Pricing Analysis

* Overall average restaurant price
* Average price for each restaurant
* Top 20 highest-priced restaurants
* Top 5 most expensive restaurants in each city
* Price band analysis (Budget, Mid-Range, Premium)

### Restaurant Performance Analysis

* Top-rated restaurants in each city
* Top 5 restaurants in each city using DENSE_RANK()
* Restaurants with at least 1000 customer ratings
* Most popular restaurants using a custom popularity score

### Customer Engagement Analysis

* High-demand areas based on review volume
* City-wise contribution to total reviews
* Above-average rated restaurants
* Underrated restaurants with strong ratings and review counts
* Overrated restaurants with high ratings but low review counts

### Popularity Segmentation

* Top 20% restaurants identified using NTILE()
* Popularity score calculation using ratings and review counts

---

## 📈 Key Insights

* Restaurant concentration varies significantly across cities.
* A small percentage of restaurants generate a large share of customer engagement.
* Premium pricing does not always guarantee better ratings.
* Certain cities contribute disproportionately to overall customer reviews.
* Hidden high-performing restaurants can be identified through rating and review analysis.

---

## 📂 Project Structure

Swiggy-Restaurant-Analytics-SQL/

├── Dataset/
│ └── swiggy.csv

├── SQL Queries/
│ └── Swiggy_SQL.sql

├── Screenshots/
│ └── Query Results

└── README.md

---

## 🚀 Tools Used

* Microsoft SQL Server
* SQL Server Management Studio (SSMS)
* CSV Dataset

---

## 🏆 Project Outcome

Successfully applied SQL analytical techniques to transform raw restaurant data into actionable business insights. The project demonstrates practical SQL skills commonly used in Data Analyst and Business Analyst roles.

---

## 👨‍💻 Author

Vivek Singh

📧 [vs5122253@gmail.com]

🔗 LinkedIn: [www.linkedin.com/in/vivek-singh-044b5527b]
