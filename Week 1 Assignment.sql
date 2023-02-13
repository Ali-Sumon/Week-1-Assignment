
-- Week 1 Assignment.
-- 1a.Question.How many airplanes have listed speeds? 
-- 1a.Answer.There are 23 airplanes that have listed speeds.
select count(*) from planes where speed is not null; 

-- 1b.Question.What is the minimum listed speed and the maximum listed speed? 
-- 1b.Answer.The maximum speed for the airplane is 432, and the minimum speed is 90.
-- maximum speed
select max(speed) from planes;

-- minimum speed.
select min(speed) from planes;

-- 2a.Question.What is the total distance flown by all of the planes in January 2013? 
-- 2a.Answer.The total distance flown by all of the planes in January 2013 was 26755517 miles.
SELECT SUM(distance) AS 'Total Distance' FROM flights
	WHERE (year = 2013 AND month = 1);
    
-- 2b.Question.What is the total distance flown by all of the planes in January 2013 where the tailnum is missing?
-- 2b. Answer. The total distance flown by all of the planes in january 2013 where tailnum is missing is null/zero.
SELECT SUM(distance) AS 'Total Distance' FROM flights
	WHERE (year = 2013 AND month = 1) And tailnum is null;
    
   --  3. Question. What is the total distance flown for all planes on July 5,2013 grouped by aircraft manufacturer? Write this
--     statement first using an INNER JOIN, then using a LEFT OUTER JOIN. How do your results compare?
-- The distance for the manufacturer cessna is 1526 miles, and the distance for the manufacturer douglas is 1089 miles by using inner join.
-- The distance for the manufacturer cessna is 1526 miles, and the distance for the manufacturer douglas is 1089 miles, and the distance for manufacturer null is 875,888 miles, by using outer left join.
-- Inner join 
SELECT SUM(distance) AS 'Total Distance', manufacturer AS 'Manufacturer' FROM flights
INNER JOIN planes
ON flights.tailnum = planes.tailnum
WHERE (flights.year = 2013 AND flights.month = 7 AND flights.day = 5)
GROUP BY manufacturer;

-- Left outer join
SELECT SUM(distance) AS 'Total Distance', manufacturer AS 'Manufacturer'
FROM flights
LEFT JOIN planes
ON flights.tailnum = planes.tailnum
WHERE (flights.year = 2013 AND flights.month = 7 AND flights.day = 5)
GROUP BY manufacturer;

-- 4. What is the total number of airlines, flights and airports?

-- 4. Answer. The total number of airlines are 16, and flights are 327346, and airports are 1397.
select 'airlines', COUNT(*) from airlines
 union
select 'flights', COUNT(*) from flights
union
select 'airports', COUNT(*) from airports;





