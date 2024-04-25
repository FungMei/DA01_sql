__Baitap1
SELECT b.Continent, 
FLOOR(AVG(a.Population))
FROM city AS a
JOIN country AS b
ON a.CountryCode = b.Code
GROUP BY b.Continent
__Baitap2
