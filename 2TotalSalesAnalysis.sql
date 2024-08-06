Select * from coffee_shop_sales;

SELECT 
    CONCAT(ROUND(SUM(unit_price * transaction_qty) / 1000), "K") AS Total_Sales 
FROM 
    coffee_shop_sales 
WHERE 
    MONTH(transaction_date) = 4;

-- TOTAL SALES KPI - MOM DIFFERENCE AND MOM GROWTH
-- MoM Increase %=( (Current Month’s Sales−Previous Month’s Sales)/ Previous Month’s Sales) ×100

SELECT 
    MONTH(transaction_date) AS month,
    ROUND(SUM(unit_price * transaction_qty)) AS total_sales,
    (SUM(unit_price * transaction_qty) - LAG(SUM(unit_price * transaction_qty), 1)
    OVER (ORDER BY MONTH(transaction_date))) / LAG(SUM(unit_price * transaction_qty), 1) 
    OVER (ORDER BY MONTH(transaction_date)) * 100 AS mom_increase_percentage
FROM 
    coffee_shop_sales
WHERE 
    MONTH(transaction_date) IN (4, 5) 
GROUP BY 
    MONTH(transaction_date)
ORDER BY 
    MONTH(transaction_date);
    
    
    


