-- CREATING TABLE AND IMPORTING DATA

USE coffee_sales_db;


DROP TABLE IF EXISTS coffee_sales;
CREATE TABLE coffee_sales 
	(hour_of_day INT,
	cash_type VARCHAR(50),
	money FLOAT,
	coffee_name VARCHAR(50),
	Time_of_Day VARCHAR(50),
	Weekday	VARCHAR(50),
    Month_name VARCHAR(50),
	Date DATE,
	Time TIME
	);
    
    
    SELECT *
    FROM coffee_sales;