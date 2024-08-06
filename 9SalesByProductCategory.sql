-- SALES BY PRODUCT CATEGORY

SELECT 
	product_category,
	Concat(ROUND(SUM(unit_price * transaction_qty)/1000,1), "K") as Total_Sales
FROM coffee_shop_sales
WHERE
	MONTH(transaction_date) = 5 
GROUP BY product_category
ORDER BY SUM(unit_price * transaction_qty) DESC;


-- SALES BY PRODUCTS (TOP 10)

SELECT 
	product_type,
    Concat(ROUND(SUM(unit_price * transaction_qty)/1000,1), "K") as Total_Sales
FROM coffee_shop_sales
WHERE
MONTH(transaction_date) = 5 
GROUP BY product_type
ORDER BY SUM(unit_price * transaction_qty) DESC 
Limit 10;


-- SALES BY PRODUCTS (TOP 10) Categorized by Product Category

SELECT 
	product_type,
    Concat(ROUND(SUM(unit_price * transaction_qty)/1000,1), "K") as Total_Sales
FROM coffee_shop_sales
WHERE
MONTH(transaction_date) = 5 AND product_category = "Coffee"
GROUP BY product_type
ORDER BY SUM(unit_price * transaction_qty) DESC 
Limit 10;