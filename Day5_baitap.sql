__Baitap1
SELECT DISTINCT city FROM station
WHERE id%2 = 0;
__Baitap2
SELECT COUNT (CITY) - COUNT (DISTINCT CITY) FROM STATION
__Baitap3
__Baitap4
SELECT
ROUND(CAST(SUM(item_count*order_occurrences)/SUM(order_occurrences)
AS DECIMAL),1) AS mean
FROM items_per_order
__Baitap5
SELECT candidate_id FROM candidates
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING COUNT (skill) = 3
__Baitap6
SELECT user_id,
MAX(post_date::DATE) - MIN(post_date::DATE) AS days_between
FROM posts
WHERE post_date	>= '2021-01-01' AND post_date	< '2022-01-01'
GROUP BY user_id
HAVING COUNT(post_id)>=2
__Baitap7
SELECT card_name,
MAX(issued_amount)-MIN(issued_amount) AS difference
FROM monthly_cards_issued
GROUP BY card_name
ORDER BY difference DESC
__Baitap8
SELECT manufacturer,
COUNT(drug) AS drug_count,
ABS(SUM(cogs-total_sales)) AS total_loss
FROM pharmacy_sales
WHERE total_sales<cogs
GROUP BY manufacturer
ORDER BY total_loss DESC
__Baitap9
SELECT * FROM cinema
WHERE id%2=1
AND description <> 'boring'
ORDER BY rating DESC
__Baitap10
SELECT teacher_id,
COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id
__Baitap11
SELECT user_id,
COUNT(followers_id) AS followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id
__Baitap12
SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(student)>=5
