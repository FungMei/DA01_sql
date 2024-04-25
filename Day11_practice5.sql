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
