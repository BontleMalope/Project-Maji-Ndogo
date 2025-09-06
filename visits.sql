SELECT * FROM md_water_services.visits;


SELECT * FROM md_water_services.visits
WHERE time_in_queue > 500;

SELECT * FROM md_water_services.water_source
WHERE source_id = "AkKi00881224" or source_id = "SoRu37635224" or source_id = "SoRu36096224";

SELECT * FROM md_water_services.water_source
WHERE source_id = "AkRu05296224" or source_id = "SoRu37635224";

/*this sums up the number of locations the emplooyes visited but the limit is 3*/
SELECT assigned_employee_id,
count(assigned_employee_id) AS number_of_locations_visited
FROM visits
group by assigned_employee_id
order by count(assigned_employee_id) aND assigned_employee_id ASC LIMIT 3;


/*This is means people have been collecting water for over 2 years*/
SELECT
      min(time_of_record) AS MINIMUM,
      max(time_of_record) AS MAXIMUM,
      datediff(MAX(time_of_record),MIN(time_of_record))AS NO_OF_DAYS
FROM visits;


/*Average time people take to get water is 2hrs*/
SELECT 
	avg(if(time_in_queue = 0 , NULL, time_in_queue)) AS modified_time_in_queue
FROM visits;

/*This sums up the average number of hours in week people queue for water*/
SELECT
dayname(time_of_record) AS Day_of_the_week,
round(AVG(IF(time_in_queue = 0, NULL, time_in_queue)),0) AS avg_queue_time
FROM visits
group by dayname(time_of_record);

/*This shows the avg queue time during the hours of the day*/
SELECT
time_format(TIME(time_of_record), "%H:00") AS HOUR_OF_THE_DAY,
round(avg(if(time_in_queue = 0 , NULL, time_in_queue)),0) as avg_queue_time
FROM visits
group by time_format(time(time_of_record), "%H:00")
order by time_format(time(time_of_record), "%H:00");


SELECT
time_format(TIME(time_of_record), "%H:00")
from visits;




SELECT 
time_format(TIME(time_of_record), "%H:00") AS hour_of_day,
round(avg(
CASE
WHEN DAYNAME(time_of_record) = "Sunday" THEN time_in_queue
ELSE NULL
END
),0) AS Sunday,
round(avg(
CASE
WHEN DAYNAME(time_of_record) = "Monday" THEN time_in_queue
ELSE NULL
END
),0) AS Monday,
round(avg(
CASE
WHEN DAYNAME(time_of_record) = "Tuesday" THEN time_in_queue
ELSE NULL
END
),0) AS Tuesday,
round(avg(
CASE
WHEN DAYNAME(time_of_record) = "Wednesday" THEN time_in_queue
ELSE NULL
END
),0) AS Wednesday,
round(avg(
CASE
WHEN DAYNAME(time_of_record) = "Thursday" THEN time_in_queue
ELSE NULL
END
),0) AS Thursday,
round(avg(
CASE
WHEN DAYNAME(time_of_record) = "Friday" THEN time_in_queue
ELSE NULL
END
),0) AS Friday,
round(avg(
CASE
WHEN DAYNAME(time_of_record) = "Saturday" THEN time_in_queue
ELSE NULL
END
),0) AS Saturday,
FROM visits
WHERE time_in_queue !=0
group by time_format(time(time_of_record), "%H:00")
order by time_format(time(time_of_record), "%H:00");
