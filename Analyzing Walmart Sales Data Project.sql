

--------------- Analyzing Walmart Sales Data Project ---------------


----- Create Database
CREATE DATABASE Deepak;

USE Deepak;

----- See the full details of the Dataset.
SELECT * FROM [dbo].[Walmart Sales Data.csv]


--------------- Some Queaies of the Dataset ---------------

----- 1. How many unique product line types does the data have?
SELECT DISTINCT [Product_line] FROM [dbo].[Walmart Sales Data.csv];

-- Result of this Analysis:-
-- The dataset contains 6 unique product lines:-
-- Fashion accessories, Health and beauty, Electronic accessories, Food and beverages, Sports and travel, Home and lifestyle.


----- 2. What is the most selling product line ?
SELECT TOP 1 [Product_line], COUNT([Product_line]) AS Most_Selling_Product FROM [dbo].[Walmart Sales Data.csv]
GROUP BY [Product_line] ORDER BY Most_Selling_Product DESC;

-- Result of this Analysis:-
-- The most selling product line is "Fashion Accessories" with 178 transactions. 
-- This indicates a high demand for fashion-related products.


----- 3. What is the most common payment method?
SELECT TOP 1 [Payment], COUNT([Payment]) AS Common_Payment_Method FROM [dbo].[Walmart Sales Data.csv]
GROUP BY [Payment] ORDER BY Common_Payment_Method DESC;

-- Result of this Analysis:-
-- The most common payment method is "Ewallet," used in 345 transactions. 
-- This shows a preference for digital payments among customers.


----- 4. What is the most total revenue by month?
SELECT TOP 1 DATENAME(month, [Date]) AS Month_Name, SUM([Total]) AS Total_Revenue FROM [dbo].[Walmart Sales Data.csv]
GROUP BY DATENAME(month, [Date]), MONTH([Date]) ORDER BY Total_Revenue DESC;

-- Result of this Analysis:-
-- "January month" recorded the highest total revenue amounting to 116,291.87. 
-- This suggests that January is a peak month for sales.


----- 5. Which month recorded the highest Cost of Goods Sold (COGS)?
SELECT TOP 1 FORMAT([Date], 'MMMM') AS Month_Name, SUM([cogs]) AS Total_COGS FROM [dbo].[Walmart Sales Data.csv]
GROUP BY FORMAT([Date], 'MMMM') ORDER BY Total_COGS DESC;

-- Result of this Analysis:-
-- "January month" also had the highest COGS amounting to 110,754.16. 
-- High sales in January likely lead to increased COGS.


----- 6. Which product line generated the highest revenue?
SELECT TOP 1 [Product_line], SUM([Total]) AS Total_Revenue FROM [dbo].[Walmart Sales Data.csv]
GROUP BY [Product_line] ORDER BY Total_Revenue DESC;

-- Result of this Analysis:-
-- "Food and beverages" product line generated the highest revenue of 56,144.84. 
-- This highlights the strong sales performance of this product line.


----- 7. Which city has the highest revenue?
SELECT TOP 1 [City], SUM([Total]) AS Total_Revenue FROM [dbo].[Walmart Sales Data.csv] 
GROUP BY [City] ORDER BY total_revenue DESC; 

-- Result of this Analysis:-
-- "Naypyitaw city" has the highest revenue, amounting to 110,568.71. 
-- This city is a significant contributor to overall sales.


----- 8. Which branch sold more products than average product sold?
SELECT TOP 1 [Branch], SUM ([Quantity]) AS Quantity FROM [dbo].[Walmart Sales Data.csv] GROUP BY branch 
HAVING SUM ([Quantity])> AVG ([Quantity]) ORDER BY [Quantity] DESC;

-- Result of this Analysis:-
-- "Branch A" sold more products than the average, with 1859 units. 
-- This branch has a high sales volume.


----- 9. What is the most common product line by gender?
SELECT  TOP 1 [Gender], [Product_line], COUNT([Gender]) AS total_count
FROM  [dbo].[Walmart Sales Data.csv] GROUP BY [Gender], [Product_line] ORDER BY total_count DESC;

-- Result of this Analysis:-
-- The most common product line among females is "Fashion accessories", with 96 total counts. 
-- This indicates a strong preference for fashion accessories among female customers.


----- 10. What is the average rating of each product line?
SELECT [Product_line], ROUND(AVG([Rating]), 2) AS Average_Rating FROM [dbo].[Walmart Sales Data.csv]
GROUP BY [Product_line] ORDER BY Average_Rating DESC;

-- Result of this Analysis:- 
-- The "Food and beverages" product line has the highest average customer satisfaction rating of 7.11. 
-- This indicates high customer satisfaction for this product line.


----- 11. How many unique customer types does the data have?
SELECT DISTINCT [Customer_type] FROM [dbo].[Walmart Sales Data.csv];

-- Result of this Analysis:-
-- There are 2 unique customer types in the dataset:- Normal and Member.


----- 12. How many unique payment methods does the data have?
SELECT DISTINCT [Payment] FROM [dbo].[Walmart Sales Data.csv];

-- Result of this Analysis:-
-- The dataset includes 3 unique payment methods: Ewallet, Cash, and Credit card.


----- 13. What is the most common customer type?
SELECT TOP 1 [Customer_type],count(*) as count
FROM [dbo].[Walmart Sales Data.csv] GROUP BY [Customer_type] ORDER BY count DESC;

-- Result of this Analysis:-
-- The most common customer type is "Member," with 501 counts. 
-- This indicates that a majority of customers are members.


----- 14. Which customer type buys the most?
SELECT TOP 1 [Customer_type], COUNT(*) AS Buys FROM [dbo].[Walmart Sales Data.csv] GROUP BY [Customer_type];

-- Result of this Analysis:-
-- The "Normal" customer type has the most purchases, with 499 transactions. 
-- This shows a significant number of purchases by normal customers.


----- 15. What is the gender of most of the customers?
SELECT TOP 1 [Gender], COUNT(*) AS gender_cnt FROM [dbo].[Walmart Sales Data.csv] 
GROUP BY [Gender] ORDER BY gender_cnt DESC;

-- Result of this Analysis:-
-- The majority of customers are female, with 501 counts. 
-- This indicates that female customers form the majority of the customer base. 


----- 16. Identify the customer type that generates the highest revenue.
SELECT TOP 1 [Customer_type],SUM([Total]) AS TotalRevenue FROM [dbo].[Walmart Sales Data.csv]
GROUP BY [Customer_type] ORDER BY TotalRevenue DESC;

-- Result of this Analysis:-
-- The "Member" customer type generates the highest revenue, amounting to 164,223.44. 
-- Members contribute significantly to the overall revenue.


----- 17. Which city has the largest tax percent?
SELECT TOP 1 [City], SUM([Tax_5]) AS TotalTax FROM [dbo].[Walmart Sales Data.csv]
GROUP BY [City] ORDER BY TotalTax DESC;

-- Result of this Analysis:-
-- "Naypyitaw city" has the largest tax percent paid, amounting to 5,265.18. 
-- This city contributes the most in terms of tax revenue.


----- 18. Which customer type pays the most in TAX?
SELECT TOP 1 [Customer_type], SUM([Tax_5]) AS TotalTax FROM [dbo].[Walmart Sales Data.csv]
GROUP BY [Customer_type] ORDER BY TotalTax DESC;

-- Result of this Analysis:-
-- The "Member" customer type pays the most in tax, amounting to 7,820.16. 
-- Members contribute significantly to tax payments.


----- 19. What is the gender distribution per branch?
SELECT [Branch], [Gender], COUNT([Gender]) AS gender_distribution FROM [dbo].[Walmart Sales Data.csv] 
GROUP BY [Branch],[Gender] ORDER BY [Branch] DESC;

-- Result of the Analysis:-
-- "Branch C" has the highest female gender distribution, with 178 females.
-- "Branch A" has the highest male gender distribution, with 179 males.
-- This indicates gender distribution varies across branches.


----- 20. What is the Sales Performance by Day of the Week?
SELECT DATENAME(weekday, [Date]) AS Day_Name, SUM([Total]) AS Total_Revenue FROM [dbo].[Walmart Sales Data.csv]
GROUP BY DATENAME(weekday, [Date]) ORDER BY Total_Revenue DESC;

-- Result of the Analysis:-
-- Top Performing Day is "Saturday" with a total revenue of 56120.81, indicating a peak shopping day.
-- Walmart can leverage this by ensuring adequate staffing and stock availability on Saturdays.


----- 21. What is the Average Transaction Value by Payment Method?
SELECT [Payment], AVG([Total]) AS Avg_Transaction_Value  FROM [dbo].[Walmart Sales Data.csv]
GROUP BY [Payment] ORDER BY Avg_Transaction_Value DESC;

-- Result of the Analysis:-
-- Highest Average Transaction Value is "Cash" with an average of 326.18.
-- Cash transactions have the highest average value, suggesting that customers paying by cash tend to spend more per transaction.


----- 22. What is the Customer Frequency by City?
SELECT [City], COUNT([Invoice_ID]) AS Transaction_Count FROM [dbo].[Walmart Sales Data.csv]
GROUP BY [City] ORDER BY Transaction_Count DESC;

-- Result of the Analysis:-
-- Highest Transaction Count is in "Yangon" city with 340 transactions, indicating a strong market presence.
-- Walmart can focus marketing efforts and optimize inventory in this city to capitalize on the high customer turnout.


----- 23. What is the Seasonal Trends in Product Lines?
SELECT [Product_line], DATENAME(month, [Date]) AS Month_Name, SUM([Total]) AS Total_Revenue FROM [dbo].[Walmart Sales Data.csv]
GROUP BY [Product_line], DATENAME(month, [Date]) ORDER BY [Product_line], Month_Name;

-- Result of the Analysis:-
-- The seasonal trends in product line:- Electronic accessories: January with 18831.29, Fashion accessories: January with 
-- 19345.11, Food and beverages: February with 20000.36, Health and beauty: March with 18208.31, Home and lifestyle: March with 
-- 20932.79, Sports and travel: January with 21667.02.

-- Different product lines have peak sales in specific months, indicating strong seasonal demand. Walmart can plan inventory and 
-- marketing strategies to align with these peak periods to maximize sales.


----- 24. What is the Revenue Contribution by Customer Type per Branch?
SELECT [Branch], [Customer_type], SUM([Total]) AS Total_Revenue FROM [dbo].[Walmart Sales Data.csv]
GROUP BY [Branch], [Customer_type] ORDER BY [Branch], Total_Revenue DESC;

-- Result of the Analysis:-
-- "Branch C" by "Member" customer type with 56881.28 in total revenue.
-- Members in Branch C contribute the highest revenue, suggesting that loyalty programs and targeted promotions for members can 
-- be particularly effective in this branch.


----- 25. What is the Average Rating per City?
SELECT [City], ROUND(AVG([Rating]), 2) AS Average_Rating FROM [dbo].[Walmart Sales Data.csv]
GROUP BY [City] ORDER BY Average_Rating DESC;

--Result of the Analysis:-
-- The city with the highest average rating is "Naypyitaw", with an average rating of 7.07.
-- This indicates high customer satisfaction in "Naypyitaw" city, and successful strategies here can be replicated in other 
-- locations.