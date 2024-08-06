select * from coffeeshop_sales;

Update coffeeshop_sales 
Set transaction_date = TO_DATE(transaction_date, 'DD-MM-YYYY');

Alter table coffeeshop_sales
Modify transaction_date Date;


Update coffeeshop_sales 
Set transaction_time = TO_DATE(transaction_date, 'HH24:MI:SS');

Alter table coffeeshop_sales
ADD  New_transaction_time date;

Update coffeeshop_sales 
Set New_transaction_time = TO_DATE(transaction_time, 'HH24:MI:SS');

Alter table coffeeshop_sales
Drop column transaction_time;


