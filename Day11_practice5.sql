__Baitap1
SELECT b.Continent, 
FLOOR(AVG(a.Population))
FROM city AS a
JOIN country AS b
ON a.CountryCode = b.Code
GROUP BY b.Continent
__Baitap2
SELECT 
ROUND(COUNT(texts.email_id)/COUNT(DISTINCT emails.email_id)::DECIMAL,2) AS activation_rate
FROM emails
LEFT JOIN texts
ON emails.email_id = texts.email_id
AND texts.signup_action = 'Confirmed';
__Baitap3
SELECT age.age_bucket, 
ROUND(100.0 * 
SUM(activities.time_spent) FILTER (WHERE activities.activity_type = 'send')/
SUM(activities.time_spent),2) AS send_perc, 
ROUND(100.0 * 
SUM(activities.time_spent) FILTER (WHERE activities.activity_type = 'open')/
SUM(activities.time_spent),2) AS open_perc
FROM activities
INNER JOIN age_breakdown AS age 
ON activities.user_id = age.user_id 
WHERE activities.activity_type IN ('send', 'open') 
GROUP BY age.age_bucket;
__Baitap4 (chạy vẫn sai)
SELECT customers.customer_id, 
COUNT(DISTINCT products.product_category) as unique_count
FROM customer_contracts AS customers
LEFT JOIN products 
ON customers.product_id = products.product_id
GROUP BY customers.customer_id
__Baitap5 (chạy vẫn sai)
SELECT emp.employee_id, emp.name,
COUNT(emp.reports_to) AS so_luong,
CEILING(AVG(mng.age)) AS avg_age
FROM employees AS emp
INNER JOIN employees AS mng
ON emp.employee_id = mng.reports_to 
WHERE mng.reports_to  IS NOT NULL
GROUP BY emp.employee_id, emp.name
ORDER BY emp.employee_id
__Baitap6 (chạy vẫn sai)
SELECT P.product_name, 
SUM(O.unit) AS so_luong
FROM Products AS P
RIGHT JOIN Orders AS O
ON P.product_id=O.product_id
WHERE O.order_date BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY P.product_name
HAVING SUM(O.unit) >= 100
__Baitap7
SELECT a.page_id
FROM pages AS a
LEFT JOIN page_likes AS b 
ON a.page_id = b.page_id
WHERE b.liked_date IS NULL
ORDER BY page_id;
__Mid-course test
__Question1
SELECT DISTINCT MIN(replacement_cost)
FROM public.film
__Question2
SELECT
CASE
WHEN replacement_cost BETWEEN 9.99 AND 19.99 THEN 'low'
WHEN replacement_cost BETWEEN 20.00 AND 24.99 THEN 'medium'
WHEN replacement_cost BETWEEN 25.00 AND 29.99 THEN 'high'
END AS category,
COUNT(*)
FROM public.film
GROUP BY category
__Question3
SELECT a.title, a.length, c.name AS category_name
FROM public.film AS a
INNER JOIN public.film_category AS b
ON a.film_id=b.film_id
INNER JOIN public.category AS c
ON b.category_id=c.category_id
WHERE c.name = 'Drama' OR c.name = 'Sports'
ORDER BY a.length DESC;
__Question4
SELECT c.name AS category_name, 
COUNT(c.category_id) AS so_luong
FROM public.film AS a
INNER JOIN public.film_category AS b
ON a.film_id=b.film_id
INNER JOIN public.category AS c
ON b.category_id=c.category_id
GROUP BY category_name
ORDER BY so_luong DESC;
__Question5
SELECT a.first_name, a.last_name,
COUNT (b.film_id) AS so_luong
FROM public.actor AS a
INNER JOIN public.film_actor AS b
ON a.actor_id = b.actor_id
INNER JOIN public.film AS c
ON b.film_id = c.film_id
GROUP BY a.first_name, a.last_name
ORDER BY so_luong DESC;
__Question6
