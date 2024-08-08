Project Overview
In this Power BI project, the focus is on examining sales data for a coffee shop. The goal is to build a detailed dashboard that delivers valuable insights into different dimensions of sales performance, including overall sales, order analysis, sales trends by time and location, and product performance.

Problem Statement
The coffee shop faces challenges in comprehending its sales performance. Key areas of analysis include:
⦁	Total Sales Review
⦁	Total Order Evaluation
⦁	Total Quantity Sold Assessment
⦁	Sales Trends by Weekdays and Weekends
⦁	Sales Performance by Store Location
⦁	Daily Sales Trends with Average Line
⦁	Sales Performance by Product Category
⦁	Top 10 Products by Sales
⦁	Sales Patterns by Days and Hours
The objective is to analyze these aspects to identify key sales drivers and pinpoint improvement areas.

Data Sources
MySQL Database: Stores sales data with columns such as date, product, location, sales amount, quantity sold, order ID, and more.
Excel Files: Utilized for supplementary data preparation and cleaning tasks.

Tools Used
⦁	MySQL: For storing and querying sales data.
⦁	Excel: For initial data cleaning and preparation.
⦁	Power BI: For data visualization and exploratory data analysis (EDA).


Data Cleaning and Analysis
Data Cleaning
Excel Tasks
⦁	Data Type Correction: Ensured numeric columns (e.g., sales amount, quantity sold, order ID) were assigned the correct numeric data types.
⦁	Null Value Handling: Applied techniques like filling with mean/median for numeric fields.
⦁	Cell Formatting: Applied correct formatting for columns, including setting number formats with the correct decimal places.
⦁	Missing Value Management: Used Excel functions to fill or remove missing data.
⦁	Consistent Labeling: Standardized labeling for product and location categories.
⦁	Date Format Standardization: Converted date columns to a consistent format using Excel functions.

Power BI Tasks

⦁	Data Modeling: Created a date table and linked it with the transaction table using the date column as the key for time-based analysis and filtering.
⦁	Conditional Formatting: Applied conditional formatting to emphasize important data points and trends in visualizations.
⦁	Data Validation: Set up data validation rules to maintain data quality and accuracy.
⦁	Data Transformation: Used Power Query Editor for data cleaning operations, such as removing duplicates, filtering rows, and transforming data types.

MySQL & DAX

Utilized MySQL and DAX to create measures and calculations for:
⦁	Total sales
⦁	Total orders
⦁	Total quantity sold
⦁	Sales trends by weekdays and weekends
⦁	Sales performance by store location
⦁	Daily sales trends with an average line
⦁	Sales performance by product category
⦁	Sales patterns by days and hours

Power BI Visualizations
⦁	Total Sales Analysis: Card and line charts were used to visualize total sales over various time periods.
⦁	Total Order Analysis: Displayed the number of orders over different time periods using card and line charts.
⦁	Total Quantity Sold Analysis: Represented the total quantity of products sold using card and line charts.
⦁	Sales Analysis by Weekdays and Weekends: Compared sales on weekdays versus weekends using a pie chart.
⦁	Sales Analysis by Store Location: Showed sales performance by location using a bar chart.
⦁	Daily Sales with Average Line: A column chart with an average line was used to depict daily sales trends.
⦁	Sales Analysis by Product Category: Displayed sales distribution across different product categories using a bar chart.
⦁	Top 10 Products by Sales: Highlighted the top 10 products based on sales using bar charts.
⦁	Sales Analysis by Days and Hours: Analyzed sales performance across different days and hours using a matrix chart.
⦁	Calendar Map for Monthly and Day-wise Analysis: Used a matrix chart to filter analysis based on month and day.
⦁	Tooltips in Calendar Map and Days & Hours Chart: Implemented tooltips to display detailed information when hovering over each day and hour for analysis.

Exploratory Data Analysis (EDA)

⦁	What are the total sales and sales trends over various time periods?
⦁	How do total orders and quantity sold fluctuate over time?
⦁	What are the sales patterns on weekdays versus weekends?
⦁	How does sales performance vary across different store locations?
⦁	What are the daily sales trends, and how do they compare to the average sales?
⦁	Which product categories contribute the most to sales?
⦁	Which are the top 10 products by sales?
⦁	How does sales performance vary by days and hours?

DAX Queries Used
Date/Calendar Table
Creating Date Table:
Date Table = CALENDAR(MIN(Transactions[transaction_date]), MAX(Transactions[transaction_date]))

Extracting Month:
Month = FORMAT('Date Table'[Date], "mmm")

Month Number:
Month Number = MONTH('Date Table'[Date])

Month Year:
Month Year = FORMAT('Date Table'[Date], "mmm yyyy")

Total Sales Analysis KPI
Adding Sales Column:
Sales = Transactions[unit_price] * Transactions[transaction_qty]

Total Sales Measure:
Total Sales = SUM(Transactions[Sales])

Month-on-Month (MoM) Analysis
Current Month Sales:
Current Month Sales = VAR selected_month = SELECTEDVALUE('Date Table'[Month]) 
			RETURN 
			TOTALMTD(CALCULATE([Total Sales],'DateTable'[Month=selected_month), 'Date Table'[Date])
					
Previous Month Sales:
Previous Month Sales = CALCULATE([Current Month Sales], DATEADD('Date Table'[Date], -1, MONTH))

MoM Growth and Difference:
MoM Growth & Diff Sales = 
        VAR month_diff = [Current Month Sales] - [Previous Month Sales]
        VAR MoM = ([Current Month Sales] - [Previous Month Sales] ) / [Previous Month Sales]
        VAR _sign = IF(month_diff > 0 , "+" , " " )
        VAR _sign_trend = IF (month_diff > 0, "▲" , "▼")
        RETURN 
        _sign_trend & " " & _sign & FORMAT(Mom, "#0.0%" & " | " & _sign & FORMAT(month_diff/1000, "0.0K"))  & " " & "vs LM"

Total Orders Analysis

Current Month Orders:
Current Month Orders = Var selected_month = SELECTEDVALUE(DateTable[Month])   
                      RETURN
                      TOTALMTD(CALCULATE([Total Orders] , 'DateTable'[Month] = selected_month) , 'DateTable'[Date])

Previous Month Orders:
Previous Month Orders = CALCULATE([Current Month Orders] , DATEADD('DateTable'[Date], -1, MONTH))

MoM Growth and Difference for Orders:
MoM Growth & Diff Orders = 
        VAR month_diff = [Current Month Orders] - [Previous Month Orders]
        VAR MoM = ([Current Month Orders] - [Previous Month Orders] ) / [Previous Month Orders]
        VAR _sign = IF(month_diff > 0 , "+" , " " )
        VAR _sign_trend = IF (month_diff > 0, "▲" , "▼")
        RETURN 
        _sign_trend & " " & _sign & FORMAT(Mom, "#0.0%" & " | " & _sign & FORMAT(month_diff/1000, "0.0K"))  & " " & "vs LM"

Total Quantity Sold Analysis

Total Quantity:
Total Quantity Sold = SUM(Transactions[transaction_qty])

Current Month Quantity:
Current Month Quantity = Var selected_month = SELECTEDVALUE(DateTable[Month])   
                      RETURN
                      TOTALMTD(CALCULATE([Total Quantity Sold] , 'DateTable'[Month] = selected_month) , 'DateTable'[Date])

Previous Month Quantity:
Previous Month Quantity = CALCULATE([Current Month Quantity] , DATEADD('DateTable'[Date], -1, MONTH))

MoM Growth and Difference for Quantity:
MoM Growth & Diff Quantity = 
        VAR month_diff = [Current Month Quantity] - [Previous Month Quantity]
        VAR MoM = ([Current Month Quantity] - [Previous Month Quantity] ) / [Previous Month Quantity]
        VAR _sign = IF(month_diff > 0 , "+" , " " )
        VAR _sign_trend = IF (month_diff > 0, "▲" , "▼")
        RETURN 
        _sign_trend & " " & _sign & FORMAT(Mom, "#0.0%" & " | " & _sign & FORMAT(month_diff/1000, "0.0K"))  & " " & "vs LM"

Calendar Heat Map

Day Name:
Day Name = FORMAT('DateTable'[Date], "ddd")

Week Number:
Week Number = WEEKNUM('Date Table'[Date], 2)

Day Number:
Day Number = FORMAT('Date Table'[Date], "D")

Week Day Number:
Week Day Number = WEEKDAY('Date Table'[Date], 2)

Sales Analysis by Store Location:

Placeholder for Zero Values:
Placeholder = 0
	
Label for Store Location:
Label For Store Location = SELECTEDVALUE(Transactions[store_location]) & " | " & FORMAT([Total Sales]/1000, "$0.00K")

Daily Sales Analysis with Average Line
Daily Average Sales:
Daily Average Sales = AVERAGEX(ALLSELECTED('Transactions'[transaction_date]), [Total Sales])

Color for Bars:
Colour For Bars = IF([Total Sales] > [Daily Avg Sales], "Above Average", "Below Average")

Sales by Product Category
Label for Product Category:
Label for Product Category = SELECTEDVALUE(Transactions[product_category]) & " | " & FORMAT([Total Sales]/1000, "$0.00k")

MoM Label:
New Mom Label =
        VAR month_diff = [Current Month Sales] - [Previous Month Sales]
        VAR MoM = ([Current Month Sales] - [Previous Month Sales] ) / [Previous Month Sales]
        VAR _sign = IF(month_diff > 0 , "+" , " " )
        VAR _sign_trend = IF (month_diff > 0, "▲" , "▼")
        RETURN 
        _sign_trend & " " & _sign & FORMAT(Mom, "#0.0%")

Sales by Product Type

Label for Product Type:
Label For Product Type = SELECTEDVALUE(Transactions[product_type]) & " | " & FORMAT([Total Sales]/1000, "$0.00K")

Sales by Days and Hours
Extracting Hour from Transaction Time:
Hour = HOUR(Transactions[transaction_time])

ToolTip for Hour:
TT for Hour = "Hour No:" & " " & FORMAT(AVERAGE(Transactions[Hour]), 0)


Recommendations
Based on the analysis, the following insights and recommendations were derived:
⦁	Optimize Product Mix: Focus on high-performing products and consider phasing out or improving low-performing products.
⦁	Enhance Location Performance: Identify locations with lower sales and analyze factors contributing to underperformance. Implement targeted strategies to boost sales in these locations.
⦁	Weekday vs. Weekend Promotions: Leverage sales patterns to design promotions and marketing campaigns tailored for weekdays and weekends.
⦁	Time-Based Marketing: Utilize insights from daily and hourly sales analysis to optimize opening hours and schedule targeted promotions.
⦁	Customer Preferences: Use product sales data to understand customer preferences and tailor offerings accordingly.

Conclusion
The Coffee Shop Sales Analysis dashboard delivers crucial insights into sales trends and performance across various dimensions. By leveraging this comprehensive analysis, the coffee shop can refine its product mix, enhance location-specific strategies, and optimize marketing efforts based on time-based sales patterns. Understanding these metrics empowers the business to make informed decisions, ultimately leading to improved sales and customer satisfaction.





