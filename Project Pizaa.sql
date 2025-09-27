use PIZAA_Data 

--Total Revenue – Calculate total income from all pizza sales
SELECT SUM(total_price) as total_revenue 
FROM pizza_sales

--Average Order Value – Determine average revenue per order.

SELECT SUM(total_price) * 1.0 / COUNT(DISTINCT order_id) AS Avg_Order_Value
FROM pizza_sales

--Total Pizzas Sold – Total quantity of pizzas sold across all orders.

SELECT SUM(quantity) AS Total_Pizzas_Sold
FROM pizza_sales 

--Total Orders – Count of distinct orders placed.

SELECT COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales

--Average Pizzas Per Order – Ratio of total pizzas sold to total orders

SELECT  SUM(quantity) * 1.0 / COUNT(DISTINCT order_id) AS Avg_Pizzas_Per_Order
FROM pizza_sales

--Analyze the trend of total orders by each day of the week.

SELECT DATENAME(WEEKDAY, order_date) AS DayOfWeek,   
    COUNT(DISTINCT order_id) AS Total_Orders    
FROM pizza_sales
GROUP BY DATENAME(WEEKDAY, order_date), DATEPART(WEEKDAY, order_date)
ORDER BY DATEPART(WEEKDAY, order_date);          

--Analyze the trend of total orders by each hour of the day

SELECT DATEPART ( HOUR , order_time ) as HourOfDay , COUNT (DISTINCT order_id) AS Total_Orders 
FROM pizza_sales 
GROUP BY DATEPART(HOUR, order_time)
ORDER BY HourOfDay
 
 --% of Sales by Pizza Category – Calculate revenue percentage for 
--each pizza category (e.g., Classic, Veggie, etc.).

SELECT pizza_category,SUM(total_price) AS Category_Revenue,SUM(total_price) * 100.0 / (SELECT SUM(total_price) FROM pizza_sales) AS Percentage_of_Sales
from pizza_sales
GROUP BY pizza_category
ORDER BY Percentage_of_Sales DESC;

--% of Sales by Pizza Size – Calculate revenue percentage for each 
--pizza size (e.g., Small, Medium, Large).

SELECT pizza_size, SUM(total_price) AS Size_Revenue,SUM(total_price) * 100.0 / (SELECT SUM(total_price) FROM pizza_sales) AS Percentage_of_Sales
FROM pizza_sales
GROUP BY pizza_size
ORDER BY Percentage_of_Sales DESC; 

--Total Pizzas Sold by Category (filtered by specific month, e.g., 
--February).

SELECT pizza_category,SUM(quantity) AS Total_Pizzas_Sold
FROM pizza_sales
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Pizzas_Sold DESC;

--Top 5 Best Sellers – Identify pizzas with the highest total quantity 
--sold

SELECT TOP 5 pizza_name,SUM(quantity) AS Total_Quantity_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity_Sold DESC;

--Bottom 5 Best Sellers – Identify pizzas with the lowest total quantity 
--sold.

SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Quantity_Sold
FROM pizza_sales 
GROUP BY pizza_name
ORDER BY Total_Quantity_Sold ASC;


--Ability to filter any of the above metrics by:
-- Month: WHERE MONTH(order_date) = X

SELECT pizza_category,SUM(quantity) AS Total_Pizzas_Sold
FROM pizza_sales
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Pizzas_Sold DESC; 

--Quarter: WHERE DATEPART(QUARTER, order_date) = Y 

SELECT  COUNT(DISTINCT order_id) AS Total_Orders 
FROM pizza_sales 
WHERE DATEPART(QUARTER, order_date) = 1; 

--Week: (Optional – not explicitly shown but can be added with 
--DATEPART(WEEK, order_date)) 

SELECT DATEPART(WEEK, order_date) AS WeekNumber,COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY DATEPART(WEEK, order_date)
ORDER BY WeekNumber 

--






























