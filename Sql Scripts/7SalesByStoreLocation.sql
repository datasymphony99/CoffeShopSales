
Select * from coffee_shop_sales;
-- SALES BY STORE LOCATION

SELECT 
	store_location,
	Concat(ROUND(SUM(unit_price * transaction_qty)/1000 ,2), "K")  as Total_Sales
FROM coffee_shop_sales
WHERE
	MONTH(transaction_date) =5 
GROUP BY store_location
ORDER BY 	SUM(unit_price * transaction_qty) DESC