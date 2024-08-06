-- SALES TREND OVER PERIOD

SELECT Concat(Round(AVG(total_sales) /1000 , 1) , "K")AS average_sales
FROM (
    SELECT 
        SUM(unit_price * transaction_qty) AS total_sales
    FROM 
        coffee_shop_sales
	WHERE 
        MONTH(transaction_date) = 5  -- Filter for May
    GROUP BY 
        transaction_date
) AS internal_query;


-- Sales for each day of the month

Select 
	Day(transaction_date) AS DAY_OF_MONTH,
    Concat(Round(SUM(unit_price * transaction_qty)/1000 , 1) , "K") AS total_sales
From coffee_shop_sales
Where Month(transaction_date) =5
group by Day(transaction_date)
order by Day(transaction_date);


-- COMPARING DAILY SALES WITH AVERAGE SALES – IF GREATER THAN “ABOVE AVERAGE” and LESSER THAN “BELOW AVERAGE”

SELECT 
    day_of_month,
    CASE 
        WHEN total_sales > avg_sales THEN 'Above Average'
        WHEN total_sales < avg_sales THEN 'Below Average'
        ELSE 'Average'
    END AS sales_status,
    total_sales
FROM (
    SELECT 
        DAY(transaction_date) AS day_of_month,
        Concat(Round(SUM(unit_price * transaction_qty)/1000 , 1) , "K") AS total_sales,
        AVG(SUM(unit_price * transaction_qty)) OVER () AS avg_sales
    FROM 
        coffee_shop_sales
    WHERE 
        MONTH(transaction_date) = 5  -- Filter for May
    GROUP BY 
        DAY(transaction_date)
) AS sales_data
ORDER BY 
    day_of_month;
