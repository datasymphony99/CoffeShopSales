-- SALES BY DAY | HOUR

SELECT 
    Concat(ROUND(SUM(unit_price * transaction_qty)/1000,1), "K") as Total_Sales,
    SUM(transaction_qty) AS Total_Quantity_Sold,
    Count(transaction_id)  AS Total_Orders
FROM 
    coffee_shop_sales
WHERE 
	MONTH(transaction_date) = 5   -- Filter for May (month number 5)
	AND DAYOFWEEK(transaction_date) = 2   -- Filter for Monday (1 is Sunday, 2 is Monday, ..., 7 is Saturday)
	AND HOUR(transaction_time) = 8 ;   -- Filter for hour number 8
    
    
-- TO GET SALES FOR ALL HOURS FOR MONTH OF MAY

SELECT 
    HOUR(transaction_time) AS Hour_of_Day,
    Concat(ROUND(SUM(unit_price * transaction_qty)/1000,1), "K") as Total_Sales
FROM 
    coffee_shop_sales
WHERE 
    MONTH(transaction_date) = 5 -- Filter for May (month number 5)
GROUP BY 
    HOUR(transaction_time)
ORDER BY 
    HOUR(transaction_time);
    
    
-- TO GET SALES FROM MONDAY TO SUNDAY FOR MONTH OF MAY


SELECT 
    CASE 
        WHEN DAYOFWEEK(transaction_date) = 2 THEN 'Monday'
        WHEN DAYOFWEEK(transaction_date) = 3 THEN 'Tuesday'
        WHEN DAYOFWEEK(transaction_date) = 4 THEN 'Wednesday'
        WHEN DAYOFWEEK(transaction_date) = 5 THEN 'Thursday'
        WHEN DAYOFWEEK(transaction_date) = 6 THEN 'Friday'
        WHEN DAYOFWEEK(transaction_date) = 7 THEN 'Saturday'
        ELSE 'Sunday'
    END AS Day_of_Week,
    Concat(ROUND(SUM(unit_price * transaction_qty)/1000,1), "K") as Total_Sales
FROM 
    coffee_shop_sales
WHERE 
    MONTH(transaction_date) = 5 -- Filter for May (month number 5)
GROUP BY 
    CASE 
        WHEN DAYOFWEEK(transaction_date) = 2 THEN 'Monday'
        WHEN DAYOFWEEK(transaction_date) = 3 THEN 'Tuesday'
        WHEN DAYOFWEEK(transaction_date) = 4 THEN 'Wednesday'
        WHEN DAYOFWEEK(transaction_date) = 5 THEN 'Thursday'
        WHEN DAYOFWEEK(transaction_date) = 6 THEN 'Friday'
        WHEN DAYOFWEEK(transaction_date) = 7 THEN 'Saturday'
        ELSE 'Sunday'
    END;

