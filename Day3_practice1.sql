__baitap1
SELECT name FROM CITY
WHERE population > 120000 
AND countrycode = 'USA';
__baitap2
SELECT * FROM city
WHERE countrycode = 'JPN';
__baitap3
SELECT city, state FROM station;
__baitap4
SELECT DISTINCT city FROM Station
WHERE city LIKE 'a%' OR city LIKE 'e%' OR city LIKE 'i%' 
OR city LIKE 'o%' OR city LIKE 'u%';
__baitap5
SELECT DISTINCT city FROM Station
WHERE city LIKE '%a' OR city LIKE '%e' OR city LIKE '%i' 
OR city LIKE '%o' OR city LIKE '%u';
__baitap6
SELECT DISTINCT city FROM station
WHERE left(city,1) NOT IN ('a', 'e', 'i', 'o', 'u');
__baitap7
SELECT name FROM employee
ORDER BY name ASC;
__baitap8
SELECT name FROM employee
WHERE salary > 2000 AND months < 10
ORDER BY employee_id ASC;
__baitap9
SELECT product_id FROM products
WHERE low_fats = 'Y' AND recyclable = 'Y';
__baitap10
SELECT name FROM customer
WHERE referee_id <> 2 OR referee_id IS NULL;
__baitap11
SELECT name, population, area FROM world
WHERE area >= 3000000 OR population >= 25000000;
__baitap12
SELECT distinct(author_id) AS id FROM views
WHERE author_id = viewer_id
ORDER BY author_id ASC;
__baitap13
SELECT part, assembly_step
FROM parts_assembly
WHERE finish_date IS NULL;
__baitap14
SELECT * FROM lyft_drivers
WHERE yearly_salary <= 30000 OR yearly_salary >= 70000;
__baitap15
SELECT * FROM uber_advertising
WHERE money_spent > 100000;
