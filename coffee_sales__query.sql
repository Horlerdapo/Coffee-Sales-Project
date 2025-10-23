-- BUSINESS TASKS

/* TASK 1. Find the total sales revenue over time, daily, weekly, monthly. */

-- daily revenue
SELECT  
		Weekday,
        total_revenue
	FROM (
		SELECT 
			Weekday,
			ROUND(SUM(money), 2) AS total_revenue
		FROM coffee_sales
		GROUP BY 1
		) AS T1
ORDER BY total_revenue DESC;


-- monthly revenue
SELECT month_name,
		total_revenue
FROM (
		SELECT 
			month_name,
			MONTH(Date) AS month_num,
			ROUND(SUM(money), 2) AS total_revenue
		FROM coffee_sales
		GROUP BY 1, 2
		ORDER BY 2, 3 DESC
	) AS t1;


/* Task 2. Which coffee productd generates the most revenue. */
-- We can see from this query that Latte generates the most revenue.

SELECT coffee_name,
		ROUND(SUM(money), 2) AS total_revenue
FROM coffee_sales
GROUP BY 1
ORDER BY 2 DESC;


/* Task 3. What is the average order value (AOV) */ 

SELECT coffee_name,
		ROUND(AVG(money), 2) AS Average_order_value
FROM coffee_sales
GROUP BY 1
ORDER BY 2 DESC;


/* Task 4. What are the top 5 best selling and bottom 5 worst selling products */
-- best selling products
SELECT coffee_name,
		ROUND(SUM(money), 2) AS total_revenue
FROM coffee_sales
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;

-- worst selling products
SELECT coffee_name,
		ROUND(SUM(money), 2) AS total_revenue
FROM coffee_sales
GROUP BY 1
ORDER BY 2
LIMIT 5;


/* Task 5. How do sales flunctuate during morning vs afternoon vs evenings */

SELECT time_of_day,
		ROUND(SUM(money), 2) AS total_revenue
FROM coffee_sales
GROUP BY 1;


/* Task 6. What are the peak sales month of the year */

SELECT month_name,
		ROUND(SUM(money)) AS total_revenue
FROM coffee_sales
GROUP BY 1
ORDER BY 2 DESC;


/* TASK 7. Has there been steady growth or decline in the coffee sales over the last 12 month? */
-- From this query, we can see that growth was not steady.

SELECT month_name,
		total_revenue
FROM (
	SELECT month_name,
			MONTH(date),
			ROUND(SUM(money), 2) AS total_revenue
	FROM coffee_sales
	WHERE date > CURRENT_DATE - INTERVAL 12 MONTH
	GROUP BY 1, 2
	ORDER BY 2
    ) AS t1
;


/* TASK 8. What are the peak hour of the day */
-- We can see from this query that peaks hour is 10AM
 
SELECT hour_of_day,
		coffee_name AS products,
        ROUND(SUM(money), 2) AS 'total revenue'
FROM coffee_sales
GROUP BY 1, 2
ORDER BY 2 DESC;


/* Task 9. What percentage of the total revenue comes from each products */

SELECT coffee_name,
		ROUND(SUM(money) / 100, 2) AS percentage_revenue
FROM coffee_sales
GROUP BY 1
ORDER BY 2;
