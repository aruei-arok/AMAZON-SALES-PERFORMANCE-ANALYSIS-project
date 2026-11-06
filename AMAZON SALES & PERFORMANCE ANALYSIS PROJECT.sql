-- AMAZON SALES & PERFORMANCE ANALYSIS project

USE amazon_sales ;

SELECT *
FROM amazon_sales_data;

-- Q1.What is the total sales revenue?

SELECT SUM(`Total Sales`) AS total_revenue
FROM amazon_sales_data;

--- finding: total revenue find 243845

--- Q2 How many orders were recorded

SELECT COUNT(DISTINCT `Order ID`) AS total_orders
FROM amazon_sales_data;

--- finding: total orders recorded were 250

--- Q3.Which product categories generate the highest revenue?
SELECT
    Category,
    SUM(`Total Sales`) AS total_revenue
FROM amazon_sales_data
GROUP BY Category
ORDER BY total_revenue DESC;

--- Finding: The category generating the highest revenue is Electronics sales of 129950

--- Q4. Which month recorded the highest sales?

SELECT
    MONTHNAME(STR_TO_DATE(`Date`, '%Y-%m-%d')) AS sales_month,
    SUM(`Total Sales`) AS monthly_revenue
FROM amazon_sales_data
GROUP BY MONTH(STR_TO_DATE(`Date`, '%Y-%m-%d')),
         MONTHNAME(STR_TO_DATE(`Date`, '%Y-%m-%d'))
ORDER BY monthly_revenue DESC; 

--- Finding: The month with the highest sales is February with total revenue of 122695


--- Q5. How many orders are completed, pending, and cancelled?

SELECT
Status,
    COUNT(DISTINCT `Order ID`) AS total_orders
FROM amazon_sales_data
GROUP BY Status
ORDER BY total_orders DESC;

--- finding: total orders are Completed has 88,Pending has 85 Cancelled has 77.



