--What years are covered by the dataset? 

SELECT DISTINCT year from population_years;


-- What is the largest population size for Gabon in this dataset?

select MAX(population), year, country
from population_years
where country = 'Gabon';

--What were the 10 lowest population countries in 2005?

Select population, country
from population_years
where year = 2005
order by population asc
limit 10;

--What are all the distinct countries with a population of over 100 million in the year 2010?

select distinct country, population
from population_years
where year=2010 AND population > 100;

--How many countries in this dataset have the word “Islands” in their name?

select distinct country
from population_years
where country LIKE '%Islands%';

--What is the difference in population between 2000 and 2010 in Indonesia?

select 

(select population
from population_years
where country = 'Indonesia' AND year = 2000
)
-
(
select population 
from population_years
where country = 'Indonesia' AND year=2010
)
as difference;