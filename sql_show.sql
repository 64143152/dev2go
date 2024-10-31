-- basic

SELECT name FROM geographies

SELECT name_th FROM district

SELECT name_th FROM provinces

SELECT * 
FROM `geographies` 
ORDER BY `name` DESC;

SELECT * 
FROM `district` 
ORDER BY `name_th` DESC;

SELECT * 
FROM `provinces` 
ORDER BY `name_th` ASC;

SELECT * 
FROM `provinces` 
WHERE `geography_id` = 2;

SELECT * 
FROM `subdistrict` 
WHERE `zip_code` = 20000;

-- advance

SELECT g.name AS geography_name, COUNT(p.code) AS province_count
FROM geographies g
JOIN provinces p ON g.id = p.geography_id
GROUP BY g.id;

SELECT g.name AS geography_name, COUNT(d.code) AS district_count
FROM geographies g
JOIN provinces p ON g.id = p.geography_id
JOIN district d ON p.code = d.province_code
GROUP BY g.id, g.name;

SELECT g.name AS geography_name, COUNT(s.code) AS subdistrict_count
FROM geographies g
LEFT JOIN provinces p ON g.id = p.geography_id
LEFT JOIN district d ON p.code = d.province_code
LEFT JOIN subdistrict s ON d.code = s.district_code
GROUP BY g.id, g.name;

SELECT g.name AS geography_name, COUNT(p.code) AS province_count
FROM geographies g
JOIN provinces p ON g.id = p.geography_id
GROUP BY g.id
ORDER BY province_count DESC
LIMIT 1;

SELECT g.name AS geography_name, COUNT(d.code) AS district_count
FROM geographies g
JOIN provinces p ON g.id = p.geography_id
JOIN district d ON p.code = d.province_code
GROUP BY g.id
ORDER BY district_count DESC
LIMIT 1;

SELECT g.name AS geography_name, COUNT(s.code) AS subdistrict_count
FROM geographies g
JOIN provinces p ON g.id = p.geography_id
JOIN district d ON p.code = d.province_code
JOIN subdistrict s ON d.code = s.district_code
GROUP BY g.id
ORDER BY subdistrict_count DESC
LIMIT 1;

SELECT p.name_th AS province_name, COUNT(d.code) AS district_count
FROM provinces p
JOIN district d ON p.code = d.province_code
GROUP BY p.code, p.name_th
ORDER BY district_count DESC
LIMIT 1;

SELECT p.name_th AS province_name, COUNT(s.code) AS subdistrict_count
FROM provinces p
JOIN district d ON p.code = d.province_code
JOIN subdistrict s ON d.code = s.district_code
GROUP BY p.code, p.name_th
ORDER BY subdistrict_count DESC
LIMIT 1;


SELECT d.name_th AS district_name, s.name_th AS subdistrict_name
FROM district d
JOIN subdistrict s ON d.code = s.district_code
ORDER BY d.name_th, s.name_th;

SELECT p.name_th AS province_name, g.name AS geography_name
FROM provinces p
JOIN geographies g ON p.geography_id = g.id
ORDER BY g.name, p.name_th;

SELECT d.name_th AS district_name, p.name_th AS province_name
FROM district d
JOIN provinces p ON d.province_code = p.code
ORDER BY p.name_th, d.name_th;

SELECT s.name_th AS subdistrict_name, 
       d.name_th AS district_name, 
       p.name_th AS province_name, 
       g.name AS geography_name
FROM subdistrict s
JOIN district d ON s.district_code = d.code
JOIN provinces p ON d.province_code = p.code
JOIN geographies g ON p.geography_id = g.id
ORDER BY g.name, p.name_th, d.name_th, s.name_th;

