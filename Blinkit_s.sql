--create databasse
create database Bstore;


--change database
use Bstore


--view data
select * from Blinkit;



--Column1 no need so drop 
alter table Blinkit
drop column column1;


--Again view Data
select * from Blinkit



--Item Fat Content have duplicate and missing pattern 
UPDATE blinkit
SET [Item Fat Content] = 'Low Fat'
WHERE [Item Fat Content] IN ('LF', 'low fat', 'Low fat');


UPDATE blinkit
SET [Item Fat Content] = 'Regular'
WHERE [Item Fat Content] IN ('reg', 'Reg', 'regular');



--now again view data in Item Fat Content values
select distinct [Item Fat Content] 
from Blinkit



--Total Sales
select ROUND(sum(Sales)/1000.00,2) as Total_Sales
from Blinkit


--No_Of_Items
select count(*) as [Item Fat Content]
from Blinkit


--Avg_Sales
select ROUND(avg(Sales),2) as Average_Sales
from Blinkit


--Avg_Rating
select ROUND(avg(Rating),2) as Average_Rating
from Blinkit


--Sales Trend By Outlet
select [Outlet Establishment year],
	   ROUND(sum(Sales)/1000.0,2) as Sales_in_K
from Blinkit
group by [Outlet Establishment Year]
order by [Outlet Establishment Year];


-- Outlet Size Sales
select [Outlet Size],
		ROUND(sum(Sales),1000.0,2) as Sales_in_k
from Blinkit
group by [Outlet Size]
order by Sales_in_k desc;


--Outlet Location By Sales
select [Outlet Location Type],
	   ROUND(sum(Sales)/1000.0,2) as Sales_in_k
from Blinkit
group by [Outlet Location Type]
order by Sales_in_k desc;

--Item Type by sales
select [Item Type],
		ROUND(sum(sales)/1000.0,2) as Sales_in_k
from Blinkit
group by [Item Type]
order by Sales_in_k desc;


--Fat Content Comparison
select [Item Fat Content],
	ROUND(SUM(Sales)/1000.0,2) as Sales_in_k
from Blinkit
group by [Item Fat Content]



--Comparison View By Outlet Size
select [Outlet Size],
       ROUND(SUM(Sales) / 1000.0, 2) AS Total_Sales,
       COUNT(*) AS No_Of_Items,
       ROUND(AVG(Sales), 2) AS Average_Sales,
       ROUND(AVG(Rating), 2) AS Average_Rating,
       ROUND(AVG([Item Visibility]), 2) AS Item_Visibility
from Blinkit
group by  [Outlet Size]
order by Total_Sales desc;


--Sales Between 2012 to 2022
select [Outlet Establishment Year],
		ROUND(SUM(Sales)/1000000.00,2) as Total_Sales,
		ROUND(avg(Rating),2) as Avg_Rating
from Blinkit
where [Outlet Establishment Year] between 2012 and 2022
group by [Outlet Establishment Year]
order by [Outlet Establishment Year]


--Top 5 Outlet Identifier Sales
select top 5 [Outlet Identifier],
	   ROUND(SUM(Sales)/1000000.00,2) as Total_Sales,
	   ROUND(SUM(Rating),2) as Avg_Rating
from Blinkit
group by [Outlet Identifier]
order by Total_Sales desc;


--Which Item Type Has Highest Visibility But Lowest Sales
select [Item Type],
	   ROUND(AVG([Item Visibility]),2) as Avg_Visibility,
	   ROUND(sum(Sales),2) as Total_Sales
from Blinkit
group by [Item Type]
Order By Avg_Visibility desc, Total_Sales asc;


