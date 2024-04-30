__Baitap1
SELECT COUNT(DISTINCT company_id) AS duplicate_companies
FROM (
  SELECT 
    company_id, 
    title, 
    description, 
    COUNT(job_id) AS job_count
  FROM job_listings
  GROUP BY company_id, title, description
) AS job_count_cte
WHERE job_count > 1;
__Baitap2
SELECT category, product, total_spend 
FROM (
  SELECT 
    category, 
    product, 
    SUM(spend) AS total_spend,
    RANK() OVER (
      PARTITION BY category 
      ORDER BY SUM(spend) DESC) AS ranking 
  FROM product_spend
  WHERE EXTRACT(YEAR FROM transaction_date) = 2022
  GROUP BY category, product) AS ranked_spending
WHERE ranking <= 2 
ORDER BY category, ranking;
__Baitap3
WITH call_records AS 
(SELECT policy_holder_id,
  COUNT(case_id) AS call_count
  FROM callers
  GROUP BY policy_holder_id
  HAVING COUNT(case_id) >= 3)
SELECT COUNT(policy_holder_id) AS policy_holder_count
FROM call_records;
__Baitap4
SELECT page_id
FROM pages
WHERE NOT EXISTS (
  SELECT page_id
  FROM page_likes AS likes
  WHERE likes.page_id = pages.page_id);
__Baitap5
SELECT 
  EXTRACT(MONTH FROM curr_month.event_date) AS mth, 
  COUNT(DISTINCT curr_month.user_id) AS monthly_active_users 
FROM user_actions AS curr_month
WHERE EXISTS (
  SELECT last_month.user_id 
  FROM user_actions AS last_month
  WHERE last_month.user_id = curr_month.user_id
    AND EXTRACT(MONTH FROM last_month.event_date) =
    EXTRACT(MONTH FROM curr_month.event_date - interval '1 month')
)
  AND EXTRACT(MONTH FROM curr_month.event_date) = 7
  AND EXTRACT(YEAR FROM curr_month.event_date) = 2022
GROUP BY EXTRACT(MONTH FROM curr_month.event_date);
__Baitap6
WITH temp AS
(SELECT * ,
DATE_FORMAT(trans_date,"%Y-%m") AS month
FROM Transactions)
SELECT temp.month, temp.country,
COUNT(*) AS trans_count,
SUM(CASE WHEN temp.state = "approved" THEN 1 ELSE 0 END) AS approved_count,
SUM(temp.amount) AS trans_total_amount,
SUM(CASE WHEN temp.state = "approved" THEN amount ELSE 0 END ) as approved_total_amount
FROM temp
GROUP BY temp.month, temp.country
__Baitap7
WITH FirstYearSales AS (
    SELECT
        s.product_id,
        MIN(s.year) AS first_year
    FROM Sales s
    GROUP BY s.product_id
)
SELECT
    fys.product_id,
    fys.first_year,
    s.quantity,
    s.price
FROM FirstYearSales fys
JOIN Sales s ON fys.product_id = s.product_id AND fys.first_year = s.year
ORDER BY fys.product_id;
__Baitap8
select customer_id from customer
group by customer_id
having count(distinct product_key)=(select count(distinct product_key) from product)
__Baitap9
SELECT employee_id
FROM Employees as a
WHERE manager_id not in (SELECT employee_id FROM employees) and salary < 30000
ORDER BY employee_id ASC
__Baitap10
SELECT COUNT(DISTINCT company_id) AS duplicate_companies
FROM (
  SELECT 
    company_id, 
    title, 
    description, 
    COUNT(job_id) AS job_count
  FROM job_listings
  GROUP BY company_id, title, description
) AS job_count_cte
WHERE job_count > 1;
__Baitap11
(select name as results 
from movierating mr inner join users u 
on mr.user_id=u.user_id
group by u.user_id 
order by count(*) desc, name asc 
limit 1)
union all
(select results from
  (
  select title as results, avg(rating) as average_rating 
  from movierating mr 
  inner join movies m 
  on mr.movie_id=m.movie_id 
  where month(created_at) = 2 
  group by m.movie_id
  ) rating_group
  order by average_rating desc, results asc limit 1
);
__Baitap12
WITH CTE AS(
SELECT requester_id , accepter_id
FROM RequestAccepted
UNION ALL
SELECT accepter_id , requester_id
FROM RequestAccepted
)
SELECT requester_id id, count(accepter_id) num
FROM CTE
group by 1
ORDER BY 2 DESC
LIMIT 1
