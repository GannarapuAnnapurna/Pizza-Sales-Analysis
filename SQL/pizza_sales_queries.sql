SELECT * FROM project1.pizza_sales
limit 10;

#What is the total revenue generated?
SELECT 
    ROUND(SUM(total_price), 2) AS total_revenue
FROM project1.pizza_sales;
