-- Write queries to return the following:
-- The following queries utilize the "world" database.

-- 1. The city name, country name, and city population of all cities in Europe with population greater than 1 million
--    Expected rows: 36
select c.name, t.name, c.population
From city c
join country t on t.code = c.countrycode 
where t.continent = 'Europe' 
and c.population > 1000000

-- 2. The city name, country name, and city population of all cities in countries where French is an official language and the city population is greater than 1 million
--    Expected rows: 2select c.name, t.name, c.population
select c.name, t.name, c.population
From city c
join country t on t.code = c.countrycode 
join countrylanguage cl on t.code = cl.countrycode
where language = 'French' and isofficial is true
and c.population > 1000000



-- 3. The name of the countries and continents where the language Javanese is spoken
--    Expected rows: 1
select t.name, t.continent
from country t
join countrylanguage cl on t.code = cl.countrycode
where language = 'Javanese'

-- 4. The names of all of the countries in Africa that speak French as an official language
--    Expected rows: 5
select t.name
from country t
join countrylanguage cl on t.code = cl.countrycode
where continent = 'Africa'
and language = 'French'
and isofficial is true

-- 5. The average city population of cities in Europe
--    Expected: 287,684
select avg(c.population) 
from city c
join country t on c.countrycode = t.code
where continent = 'Europe'

-- 6. The average city population of cities in Asia
--    Expected: 395,019
select avg(c.population)
from city c
join country t on c.countrycode = t.code
where continent = 'Asia'

-- 7. The number of cities in countries where English is an official language
--    Expected: 523
select count(c.name) 
from city c
join country t on c.countrycode = t.code
join countrylanguage cl on t.code = cl.countrycode
where language = 'English'
and isofficial is true

-- 8. The average population of cities in countries where the official language is English
--    Expected: 285,809
select avg(c.population)
from city c
join country t on c.countrycode = t.code
join countrylanguage cl on t.code = cl.countrycode
where language = 'English'
and isofficial is true

-- 9. The names of all of the continents and the population of the continent’s largest city
--    Expected rows: 6, largest population for North America: 8,591,309
select t.continent, max(c.population)
from city c
join country t on c.countrycode = t.code
group by t.continent


-- 10. The names of all of the cities in South America that have a population of more than 1 million people and the official language of each city’s country
--     Expected rows: 29

select c.name, cl.language
from city c
join country t on c.countrycode = t.code
join countrylanguage cl on t.code = cl.countrycode
where t.continent = 'South America'
and c.population > 1000000
and isofficial is true



