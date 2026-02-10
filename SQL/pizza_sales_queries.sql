SELECT * FROM project1.pizza_sales;

#BASIC AGGREGATION QUERIES
#Total Revenue
SELECT ROUND(SUM(total_price),2) AS total_revenue
FROM project1.pizza_sales;



#Total Orders
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM project1.pizza_sales;



#Total Pizzas Sold
SELECT SUM(quantity) AS total_pizzas_sold
FROM project1.pizza_sales;



#Average Order Value (AOV)
SELECT 
ROUND(SUM(total_price)/COUNT(DISTINCT order_id),2) AS avg_order_value
FROM project1.pizza_sales;



#TOP / BOTTOM ANALYSIS
#Top 10 Best-Selling Pizzas (Quantity)
SELECT pizza_name, SUM(quantity) AS total_quantity
FROM project1.pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity DESC
LIMIT 10;



#Top 10 Pizzas by Revenue
SELECT pizza_name, ROUND(SUM(total_price),2) AS revenue
FROM project1.pizza_sales
GROUP BY pizza_name
ORDER BY revenue DESC
LIMIT 10;


#Least Selling Pizzas
SELECT pizza_name, SUM(quantity) AS total_quantity
FROM project1.pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity ASC
LIMIT 10;



#CATEGORY & SIZE ANALYSIS
#Revenue by Pizza Category
SELECT pizza_category, ROUND(SUM(total_price),2) AS revenue
FROM project1.pizza_sales
GROUP BY pizza_category
ORDER BY revenue DESC;



#Quantity Sold by Pizza Size
SELECT pizza_size, SUM(quantity) AS total_quantity
FROM project1.pizza_sales
GROUP BY pizza_size
ORDER BY total_quantity DESC;



#Average Price by Pizza Size
SELECT pizza_size, ROUND(AVG(unit_price),2) AS avg_price
FROM project1.pizza_sales
GROUP BY pizza_size;



#TIME-BASED QUERIES
#Daily Orders Trend
SELECT order_date, COUNT(DISTINCT order_id) AS total_orders
FROM project1.pizza_sales
GROUP BY order_date
ORDER BY order_date;



#Monthly Revenue
SELECT MONTH(order_date) AS month,
ROUND(SUM(total_price),2) AS revenue
FROM project1.pizza_sales
GROUP BY month
ORDER BY month;


#Peak Ordering Hours
SELECT HOUR(order_time) AS hour,
COUNT(DISTINCT order_id) AS total_orders
FROM project1.pizza_sales
GROUP BY hour
ORDER BY total_orders DESC;




#ADVANCED (INTERVIEW FAVORITE)
#Revenue Contribution Percentage
SELECT pizza_category,
ROUND(SUM(total_price)*100 /
(SELECT SUM(total_price) FROM project1.pizza_sales),2) AS revenue_percent
FROM project1.pizza_sales
GROUP BY pizza_category;



#Running Total Revenue (Window Function)
SELECT order_date,
ROUND(SUM(SUM(total_price)) OVER (ORDER BY order_date),2) AS running_revenue
FROM project1.pizza_sales
GROUP BY order_date;


#Rank Pizzas by Revenue
SELECT pizza_name,
ROUND(SUM(total_price),2) AS revenue,
RANK() OVER (ORDER BY SUM(total_price) DESC) AS revenue_rank
FROM project1.pizza_sales
GROUP BY pizza_name;




#Orders Above Average Order Value
SELECT order_id, SUM(total_price) AS order_value
FROM project1.pizza_sales
GROUP BY order_id
HAVING order_value >
(SELECT AVG(total_price) FROM project1.pizza_sales);




#BUSINESS INSIGHT QUERIES
#Most Profitable Size per Category
SELECT pizza_category, pizza_size,
ROUND(SUM(total_price),2) AS revenue
FROM project1.pizza_sales
GROUP BY pizza_category, pizza_size
ORDER BY pizza_category, revenue DESC;



#Ingredient Usage Count
SELECT pizza_ingredients, COUNT(*) AS usage_count
FROM project1.pizza_sales
GROUP BY pizza_ingredients
ORDER BY usage_count DESC
LIMIT 10;

#Weekend vs Weekday Revenue
SELECT 
CASE 
WHEN DAYOFWEEK(order_date) IN (1,7) THEN 'Weekend'
ELSE 'Weekday'
END AS day_type,
ROUND(SUM(total_price),2) AS revenue
FROM project1.pizza_sales
GROUP BY day_type;
