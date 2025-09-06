SELECT * FROM md_water_services.water_source
WHERE number_of_people_served > 2000
ORDER BY number_of_people_served DESC;

SELECT * FROM water_source
WHERE type_of_water_source = "tap_in_home";

SELECT 
type_of_water_source,
sum(number_of_people_served) AS number_served_per_type
From water_source
GROUP BY type_of_water_source
ORDER BY sum(number_of_people_served) DESC;

SELECT 
sum(number_of_people_served)
FROM water_source;


SELECT 
type_of_water_source,
round(avg(number_of_people_served),0) AS number_served_per_type
From water_source
GROUP BY type_of_water_source;


SELECT 
type_of_water_source,
round((sum(number_of_people_served)/27628140)*100,0) AS PCT_number_of_people
from water_source
GROUP BY type_of_water_source;



SELECT 
type_of_water_source,
sum(number_of_people_served) AS number_served_per_type,
rank() OVER(ORDER BY SUM(number_of_people_served) DESC) AS rank_by_number_of_people_served
FROM water_source
group by type_of_water_source;

SELECT
       source_id,
       type_of_water_source,
       number_of_people_served,
       RANK() OVER(PARTITION BY type_of_water_source ORDER BY number_of_people_served DESC) AS rank_by_population
	from water_source;
    
    
    

