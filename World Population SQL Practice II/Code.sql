--How many entries in the countries table are from Africa?

Select count (*) as 'Number of entries'
from countries
where continent = 'Africa';

--What was the total population of the continent of Oceania in 2005?

-- Due to the fact that table has no missing values in 2005, neither in data reffering to Oceania, I am using inner join. 

Select SUM(population) as 'Population'
From population_years
join countries
on population_years.country_id = countries.id
where population_years.year = 2005 AND countries.continent = 'Oceania';

--What is the average population of countries in South America in 2003?

-- Due to the fact that table has no missing values in 2003 neither in data reffering to South America, I am using inner join. 

Select AVG(population_years.population) 'Avarage population'
FROM population_years
join countries
on population_years.country_id = countries.id 
where countries.continent = 'South America' AND population_years.year = 2003;

--What country had the smallest population in 2007?

Select MIN(population_years.population) 'Population', countries.name 'Country Name'
from countries
left join population_years
on population_years.country_id = countries.id
where population_years.year = 2007; 

--What is the average population of Poland during the time period covered by this dataset?

Select AVG(population_years.population) 'Average Population of Poland'
FROM population_years
JOIN countries
on population_years.country_id = countries.id
where countries.name = 'Poland';

--How many countries have the word “The” in their name?

Select count(*) 'Number of countries having the word "The" in their name'
from countries
where name LIKE '% The %' OR name LIKE 'The %' OR name LIKE '% The';


--What was the total population of each continent in 2010?

Select SUM(population_years.population) 'Total population', countries.continent 'Continent'
FROM countries
join population_years
on countries.id = population_years.country_id
where population_years.year=2010
group by countries.continent;