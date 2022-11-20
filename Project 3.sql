USE hotel_db;

WITH hotel AS
	(SELECT * FROM hotel_db.hotel_2018_rev
	UNION 
	SELECT * FROM hotel_db.hotel_2019_rev
	UNION 
	SELECT * FROM hotel_db.hotels_2020_rev)


-- SELECT * FROM hotel AS ht
-- JOIN market_segment AS mkt
-- ON ht.market_segment = mkt.market_segment


-- 1. is our hotel growing by revenue
SELECT arrival_date_year AS Year, ROUND(SUM((stays_in_weekend_nights + stays_in_week_nights) * adr), 2) AS REVENUE
FROM hotel
GROUP BY Year
ORDER BY arrival_date_year DESC



--  2. for the hotel to decide whether they should increase their parking spaces or not, 
-- they have to decide number of guests that requires parking spaces irrespective of their numbers, whether 1, 2, 3, 4 and so on and 
-- compare the total number of all the guests, the results gives 8.58 and this means the hotel does not require to increase no of parking spaces

SELECT ROUND((COUNT(*) / (SELECT COUNT(*) FROM hotel))* 100, 2) 
AS Guest_Parked
FROM hotel
WHERE required_car_parking_spaces > 0

3. the trends in the data by Month
SELECT arrival_date_month AS Month, 
ROUND(SUM((stays_in_weekend_nights + stays_in_week_nights) * adr),2) AS REVENUE 
FROM hotel 
GROUP BY Month
ORDER BY REVENUE DESC

-- trends of revenue by hotel type to see if resort or city hotel generates the highest revenue Quaterly
SELECT hotel as hotel_type, 
ROUND(SUM((stays_in_weekend_nights + stays_in_week_nights) * adr),2) AS Quater_1_Revenue
FROM hotel
WHERE arrival_date_month IN ('January', 'February', 'March')
GROUP BY hotel_type
ORDER BY Quater_1_Revenue DESC

SELECT hotel as hotel_type, 
ROUND(SUM((stays_in_weekend_nights + stays_in_week_nights) * adr),2) AS Quater_2_Revenue
FROM hotel
WHERE arrival_date_month IN ('March', 'April', 'May')
GROUP BY hotel_type
ORDER BY Quater_2_Revenue DESC

SELECT hotel as hotel_type, 
ROUND(SUM((stays_in_weekend_nights + stays_in_week_nights) * adr),2) AS Quater_3_Revenue
FROM hotel
WHERE arrival_date_month IN ('June', 'July', 'August')
GROUP BY hotel_type
ORDER BY Quater_3_Revenue DESC


SELECT hotel as hotel_type, 
ROUND(SUM((stays_in_weekend_nights + stays_in_week_nights) * adr),2) AS Quater_4_Revenue
FROM hotel
WHERE arrival_date_month IN ('September', 'October', 'December')
GROUP BY hotel_type
ORDER BY Quater_4_Revenue DESC














































































-- SELECT * FROM hotel 
-- JOIN market_segment
-- USING (market_segment)

-- SELECT * FROM hotel 
-- JOIN market_segment
-- ON hotel.market_segment = market_segment.market_segment



