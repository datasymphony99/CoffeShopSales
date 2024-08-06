-- SALES BY WEEKDAY / WEEKEND:
   
SELECT 
    CASE 
        WHEN DAYOFWEEK(transaction_date) IN (1, 7) THEN 'Weekends'
        ELSE 'Weekdays'
    END AS day_type,
    Concat(ROUND(SUM(unit_price * transaction_qty)/1000 ,1), "K") AS total_sales
FROM 
    coffee_shop_sales
WHERE 
    MONTH(transaction_date) = 2  -- Filter for May
GROUP BY 
    CASE 
        WHEN DAYOFWEEK(transaction_date) IN (1, 7) THEN 'Weekends'
        ELSE 'Weekdays'
    END;
