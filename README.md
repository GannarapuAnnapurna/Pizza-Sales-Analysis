# 🍕 Pizza Sales Performance Analysis

![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Tableau](https://img.shields.io/badge/Tableau-E97627?style=for-the-badge&logo=tableau&logoColor=white)
![Excel](https://img.shields.io/badge/Microsoft%20Excel-217346?style=for-the-badge&logo=microsoftexcel&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)

---

## 📌 Project Overview

This project analyzes pizza sales data to identify revenue trends, top-performing products, customer ordering behavior, peak business hours, and category-level performance. The analysis is performed using **MySQL** for data querying and **Tableau** for interactive dashboard visualization, delivering actionable insights to support business strategy and operations.

---

## 🎯 Business Objectives

- Identify which pizza categories and sizes drive the most revenue
- Analyze peak ordering hours and days to optimize staffing and inventory
- Determine top-performing and bottom-performing pizza products
- Understand sales trends over time (monthly, daily)
- Support pricing and promotional strategy with data-backed insights

---

## 🗂️ Dataset Information

| Column | Description |
|--------|-------------|
| Order ID | Unique order identifier |
| Order Date | Date of the order |
| Order Time | Time the order was placed |
| Pizza Name | Name of the pizza ordered |
| Pizza Category | Classic / Supreme / Chicken / Veggie |
| Pizza Size | S / M / L / XL / XXL |
| Quantity | Number of pizzas in the order |
| Unit Price | Price per pizza |
| Total Price | Total order value |

> **Dataset Size:** 21,350 orders | 49,574 pizzas sold

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|------|---------|
| MySQL | Data storage & analytical queries |
| Microsoft Excel | Source dataset |
| Tableau | Interactive dashboard & visualization |
| GitHub | Version control & documentation |

---

## 📊 Key KPIs

| Metric | Value |
|--------|-------|
| 💰 Total Revenue | $817,860 |
| 📦 Total Orders | 21,350 |
| 🍕 Total Pizzas Sold | 49,574 |
| 🧾 Average Order Value (AOV) | $38.31 |
| 🏆 Top Category | Classic (~$220K) |
| 📏 Most Ordered Size | Large (L) |

---

## 🧮 SQL Analysis (MySQL)

**File:** `SQL/pizza_sales_queries.sql`

**Key queries performed:**
- Total revenue, total orders, total pizzas sold
- Average order value calculation
- Revenue and order count by pizza category
- Sales by pizza size
- Top 10 and bottom 10 pizzas by revenue and quantity
- Peak ordering hours and days of the week
- Monthly revenue trend analysis
- Percentage contribution of each category

**Example Queries:**

```sql
-- Revenue & Orders by Category
SELECT pizza_category,
       COUNT(order_id) AS total_orders,
       SUM(quantity) AS total_pizzas_sold,
       ROUND(SUM(total_price), 2) AS total_revenue,
       ROUND(SUM(total_price) * 100.0 /
             (SELECT SUM(total_price) FROM pizza_sales), 2) AS revenue_pct
FROM pizza_sales
GROUP BY pizza_category
ORDER BY total_revenue DESC;
```

```sql
-- Peak Ordering Hours
SELECT HOUR(order_time) AS order_hour,
       COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY order_hour
ORDER BY total_orders DESC
LIMIT 5;
```

```sql
-- Top 10 Pizzas by Revenue
SELECT pizza_name,
       ROUND(SUM(total_price), 2) AS total_revenue,
       SUM(quantity) AS total_quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue DESC
LIMIT 10;
```

```sql
-- Monthly Revenue Trend
SELECT DATE_FORMAT(order_date, '%Y-%m') AS order_month,
       COUNT(DISTINCT order_id) AS total_orders,
       ROUND(SUM(total_price), 2) AS monthly_revenue
FROM pizza_sales
GROUP BY order_month
ORDER BY order_month;
```

---

## 📈 Dashboard Features (Tableau)

**File:** `Dashboard/Pizza_Sales_Dashboard.twbx`

- 📌 **KPI Summary:** Total Revenue | Total Orders | Pizzas Sold | AOV
- 📊 **Sales Trend Over Time** — Monthly revenue line chart (Jan–Dec)
- 🍩 **Sales by Pizza Size** — Pie chart (S/M/L/XL/XXL distribution)
- 📦 **Revenue by Pizza Category** — Bar chart (Classic, Supreme, Chicken, Veggie)
- ⏰ **Orders by Time of Day** — Hourly demand pattern chart
- 🏆 **Top & Bottom 5 Pizzas** — Revenue and quantity rankings

---

## 🔍 Key Insights

1. **Classic pizzas are the revenue leader** — contributing approximately $220K (~26% of total revenue), making it the highest-earning category across all 4
2. **Revenue is remarkably stable year-round** — monthly sales consistently hover between $60K–$65K with minimal seasonal variation, indicating a loyal customer base
3. **Large (L) size dominates orders** — followed by Medium and Small; XL and XXL represent only a minor share of total sales
4. **All four categories perform competitively** — Supreme, Chicken, and Veggie all contribute close to $200K each, showing a well-balanced menu
5. **Peak hours are in the evening (6 PM – 8 PM)** — ideal window for targeted promotions, upselling, and staffing optimization
6. **Average order value is $38.31** — consistent across the year, suggesting stable pricing and no significant discount-driven distortion

---

## 💡 Business Recommendations

| Recommendation | Supporting Insight |
|----------------|-------------------|
| Feature Classic pizzas in promotions | Consistently top revenue driver — high potential for combo deals |
| Optimize staffing for 6 PM – 8 PM window | Peak ordering hours — understaffing here directly impacts customer experience |
| Bundle XL/XXL with group deals | Low XL/XXL order share — pricing or awareness may be limiting sales |
| Introduce limited-time Supreme/Chicken specials | Strong category performance — can drive further sales with novelty items |
| Review bottom 5 pizzas for menu optimization | Low-performers occupy prep time and ingredients — consider replacing or promoting them |
| Use stable monthly revenue for predictable inventory planning | Consistent $60K–$65K monthly range reduces waste and overstocking risk |

---

## 📁 Project Structure

```
📁 Pizza-Sales-Analysis
├── 📁 SQL/
│   └── pizza_sales_queries.sql
├── 📁 Dataset/
│   └── pizza_sales.xlsx
├── 📁 Dashboard/
│   ├── Pizza_Sales_Dashboard.twbx
│   └── Pizza_dashboard.png
└── README.md
```

---

## 👩‍💻 Author

**Annapurna Gannarapu**
📧 annapurna.gannarapu@gmail.com
🔗 [LinkedIn](https://linkedin.com/in/annapurna-gannarapu) | [GitHub](https://github.com/GannarapuAnnapurna)

---

*This project was completed as part of a self-learning data analytics portfolio by a 2025 Computer Science graduate.*

