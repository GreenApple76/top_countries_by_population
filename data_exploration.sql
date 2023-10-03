/* Find mean, maximum and minimum population values */
select avg(population) as population_mean, max(population) as population_max, min(population) as population_min from countries;

/* Count the number of countries with a 1 year percentage change of greater than 1% */
select count(*), round(percent_one_year_change) as pct_one_year_change from countries group by round(percent_one_year_change) having percent_one_year_change > 1;

/* Group country area size into 3 labeled buckets */
select count(*), round(avg(percent_of_world_pop)) from countries group by round(percent_of_world_pop) having percent_of_world_pop > avg(percent_one_year_change);
select count(*) as country_count, case when area_sq_km > 1000000 then 'Large Sized Country' when area_sq_km > 500000 then 'Medium Sized Country' else 'Small Sized Country' end as country_size from countries group by country_size;

/* Filter countries with a median age greater than 45 years old and a fertility rate of greater than 1.5 */
select name from countries where median_age > 45 AND fertility_rate > 1.5;