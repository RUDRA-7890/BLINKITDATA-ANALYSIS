SELECT * FROM blinkitdata
UPDATE blinkitdata
SET Item_Fat_Content =
CASE 
WHEN Item_Fat_Content = 'LOW FAT' THEN 'Low Fat'
WHEN Item_Fat_Content = 'REGULAR' THEN 'Regular'
ELSE Item_Fat_Content
END
SELECT Item_Fat_Content, CAST(SUM(Total_sales)/1000000  AS NUMERIC(10,2)) as total_sales_Millions
FROM blinkitdata 
WHERE Outlet_establishment = '2022'
GROUP BY Item_Fat_Content
WHERE Item_Fat_Content = 'Regular'

SELECT Item_Fat_Content, CAST(SUM(Total_sales)/1000000  AS NUMERIC(10,2)) as total_sales_Millions
FROM blinkitdata 
GROUP BY Item_Fat_Content
ORDER BY total_sales_Millions DESC
SELECT CAST(AVG(total_sales) AS Numeric(10,0)) as avg_sales FROM blinkitdata
WHERE Outlet_establishment = '2022'
SELECT COUNT (*) as number_of_items FROM blinkitdata

SELECT CAST(AVG(Rating) AS Numeric(4,2)) as AVG_rating FROM blinkitdata

SELECT item_type, CAST(SUM(Total_sales)/1000000  AS NUMERIC(10,2)) as total_sales_Millions
FROM blinkitdata 
GROUP BY item_type
ORDER BY total_sales_Millions DESC

SELECT Outlet_Location_Type,
	ISNULL([Low fat], 0) AS low_fat_sales,
	ISNULL([Regular], 0) AS regular_sales
FROM
(
	SELECT Outlet_Location_Type, Item_Fat_Content,
		CAST(SUM(Total_sales) AS numeric(10,2)) AS Total_sales
	FROM Blinkitdata
	GROUP BY Outlet_Location_Type, Item_Fat_Content
) AS sourceTable
(
	SUM(Total-sales)
	FOR Item_Fat_Content IN ([Low Fat],[Regular])
) AS pivotTable
ORDER BY Outlet_Location_Type