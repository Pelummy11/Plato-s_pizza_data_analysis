SELECT * 
FROM order_details

SELECT *
FROM orders

SELECT *
FROM pizza_types


SELECT *
FROM pizzas

--- Year the pizzas were ordered
SELECT MAX(date) AS maxdate, 
MIN(date) AS mindate 
FROM orders
---the orders spanned from january to december 2015
---pizza category
SELECT DISTINCT(category)
FROM pizza_types

--- pizza sizes
SELECT DISTINCT(size)
FROM pizzas

---max amount of pizza ordered at once
SELECT MAX(quantity)
FROM order_details

---The most expensive and least expensive pizza
SELECT size, MAX(price) AS max, MIN(price) AS min
FROM pizzas AS pz
INNER JOIN pizza_types AS pt
ON pz.pizza_type_id = pt.pizza_type_id
GROUP BY size

---Average price of a pizza
SELECT  ROUND(AVG(price),0) AS avg
FROM pizzas AS pz
INNER JOIN pizza_types AS pt
ON pz.pizza_type_id = pt.pizza_type_id



---How many orders were made all through the year
SELECT COUNT(*) AS ordersmade
FROM order_details AS od
INNER JOIN orders AS ors
ON od.order_id = ors.order_id

--- Count of orders made each month
SELECT  COUNT(*) AS ordersmade,
DATENAME(MONTH, date) AS month
FROM order_details AS od
INNER JOIN orders AS ors
ON od.order_id = ors.order_id
GROUP BY DATENAME(MONTH, date)
ORDER BY ordersmade DESC

--- Count of orders made by week
SELECT  COUNT(*) AS ordersmade,
DATENAME(WEEKDAY, date) AS month
FROM order_details AS od
INNER JOIN orders AS ors
ON od.order_id = ors.order_id
GROUP BY DATENAME(WEEKDAY, date)
ORDER BY ordersmade DESC
---most orders were made on the weekednds

--- what category of pizza was ordered the most
SELECT  COUNT(*) AS ordersmade,
category
FROM order_details AS od
INNER JOIN pizzas AS pz
ON od.pizza_id = pZ.pizza_id
INNER JOIN pizza_types AS pt
ON pz.pizza_type_id = pt.pizza_type_id
GROUP BY category
ORDER BY ordersmade DESC

--- what time of the day were most order made
SELECT  COUNT(*) AS ordersmade,
DATENAME(HOUR, time) AS time
FROM order_details AS od
INNER JOIN orders AS ors
ON od.order_id = ors.order_id
GROUP BY DATENAME(HOUR, time)
ORDER BY ordersmade DESC

---best selling pizzas
SELECT name,  ROUND(SUM(price),0) as totalsales
FROM order_details AS od
INNER JOIN pizzas AS pz
ON od.pizza_id = pZ.pizza_id
INNER JOIN pizza_types AS pt
ON pz.pizza_type_id = pt.pizza_type_id
GROUP BY name
ORDER BY totalsales DESC

SELECT name, COUNT(*) as count
FROM order_details AS od
INNER JOIN pizzas AS pz
ON od.pizza_id = pZ.pizza_id
INNER JOIN pizza_types AS pt
ON pz.pizza_type_id = pt.pizza_type_id
GROUP BY name
ORDER BY count DESC

---Average Order Value
SELECT ROUND(SUM(price) /COUNT(*),1) AS AverageOrderValue
FROM order_details AS od
INNER JOIN pizzas AS pz
ON od.pizza_id = pZ.pizza_id
INNER JOIN pizza_types AS pt
ON pz.pizza_type_id = pt.pizza_type_id

---Total sales for each month
SELECT ROUND(SUM(price),0) AS totsales,
DATENAME(MONTH, date) AS month
FROM  orders AS os
INNER JOIN order_details AS od
ON os.order_id = od.order_id 
INNER JOIN pizzas AS pz
ON od.pizza_id = pz.pizza_id
GROUP BY DATENAME(MONTH, date)
ORDER BY totsales DESC

---Avg sales per week

SELECT AVG(price) AS avgsales,
DATENAME(WEEKDAY, date) AS month
FROM  orders AS os
INNER JOIN order_details AS od
ON os.order_id = od.order_id 
INNER JOIN pizzas AS pz
ON od.pizza_id = pz.pizza_id
GROUP BY DATENAME(WEEKDAY, date)
ORDER BY avgsales DESC
