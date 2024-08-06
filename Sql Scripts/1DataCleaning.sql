create database CoffeeShopSalesDB;

Select * from coffee_shop_sales;

Describe coffee_shop_sales;

UPDATE coffee_shop_sales
SET transaction_date = STR_TO_DATE(transaction_date, '%m/%d/%Y');

ALTER TABLE coffee_shop_sales
MODIFY COLUMN transaction_date DATE;

UPDATE coffee_shop_sales
SET transaction_time = STR_TO_DATE(transaction_time, '%H:%i:%s');

ALTER TABLE coffee_shop_sales
MODIFY COLUMN transaction_time TIME;






