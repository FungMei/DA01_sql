__Baitap1
SELECT name FROM students
WHERE Marks > 75
ORDER BY RIGHT(name,3), id
__Baitap2
SELECT user_id,
CONCAT(UPPER(LEFT(name,1)),LOWER(right(name,length(name)-1))) AS name
FROM Users
ORDER BY user_id
__Baitap3
SELECT manufacturer, 
CONCAT( '$', ROUND(SUM(total_sales) / 1000000), ' million') AS sales_mil 
FROM pharmacy_sales 
GROUP BY manufacturer 
ORDER BY SUM(total_sales) DESC, manufacturer;
__Baitap4
SELECT EXTRACT(month from submit_date) AS mth,
product_id,
ROUND(AVG(stars),2) AS avg_stars
FROM reviews
GROUP BY EXTRACT(month from submit_date),
product_id
ORDER BY EXTRACT(month from submit_date), product_id
__Baitap5
SELECT sender_id,
COUNT(message_id) AS message_count
FROM messages
WHERE EXTRACT(month FROM sent_date) = '08'
AND EXTRACT(year FROM sent_date) = '2022'
GROUP BY sender_id
ORDER BY COUNT(message_id) DESC
LIMIT 2
__Baitap6
SELECT tweet_id
FROM tweets
WHERE LENGTH(content)> 15
__Baitap7
SELECT activity_date as day, COUNT(DISTINCT user_id) as active_users
FROM Activity
WHERE datediff('2019-07-27',activity_date)<30 
AND activity_date <= '2019-07-27' 
GROUP BY activity_date
__Baitap8
select 
COUNT(employee_id) AS number_employee
from employees
WHERE EXTRACT(month from joining_date) BETWEEN 1 and 7
AND EXTRACT(year from joining_date) = 2022
__Baitap9
select
POSITION('a' IN first_name)
from worker
WHERE first_name = 'Amitah'
__Baitap10
select substring(title,length(winery)+2,4)
from winemag_p2
where contry='Macedonia'
