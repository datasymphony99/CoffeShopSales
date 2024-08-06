
-- CALENDAR TABLE – DAILY SALES, QUANTITY and TOTAL ORDERS

SELECT
    CONCAT(ROUND(SUM(unit_price * transaction_qty)/ 1000,1), "K") AS total_sales,
    CONCAT(ROUND(SUM(transaction_qty)/ 1000,1), "K") AS total_quantity_sold,
    CONCAT(ROUND(COUNT(transaction_id)/ 1000,1), "K") AS total_orders
FROM 
    coffee_shop_sales
WHERE 
    transaction_date = '2023-05-18'; -- For 18 May 2023
    
    

