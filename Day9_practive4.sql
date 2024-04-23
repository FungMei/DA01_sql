__Baitap1
SELECT 
SUM(CASE
WHEN device_type ='laptop'THEN 1 ELSE 0 
END) AS laptop_views,
SUM(CASE
WHEN device_type IN('tablet','phone') THEN 1 ELSE 0
END) AS mobile_views
FROM viewership;
__Baitap2
SELECT X,Y,Z,
CASE
WHEN X+Y>Z AND X+Z>Y AND Y+Z>X THEN 'Yes'
WHEN X=Y AND Y=Z THEN 'Yes'
ELSE 'No'
END AS triangle
FROM triangle
__Baitap3 (Anh chị xem lại hộ em bài này với ạ, em chạy không ra đúng kết quả ạ)
SELECT COUNT(case_id) AS uncategorised_calls
  FROM callers
  WHERE call_category IS NULL
    OR call_category = 'n/a'
SELECT
  ROUND(100.0 * uncategorised_calls 
    / (SELECT COUNT(*) FROM callers), 1) AS uncategorised_call_pct
FROM uncategorised_callers;
__Baitap4
SELECT name FROM customer
WHERE referee_id <> 2 OR referee_id IS NULL;
__Baitap5
select survived,
sum(case 
when pclass = 1 then 1 else 0
end) as first_class
sum(case 
when pclass = 1 then 1 else 0
end) as second_class
sum(case 
when pclass = 1 then 1 else 0
end) as third_class
from titanic
GROUP BY survived
