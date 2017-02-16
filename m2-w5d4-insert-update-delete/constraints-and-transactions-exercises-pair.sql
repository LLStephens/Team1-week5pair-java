-- Write queries to return the following:
-- Make the following changes in the "world" database.

-- 1. Add Superman's hometown, Smallville, Kansas to the city table. The 
-- countrycode is 'USA', and population of 45001. (Yes, I looked it up on 
-- Wikipedia.)
-- ask casey about how to use sequence
INSERT INTO city (id, name, countrycode, district, population) VALUES (4080, 'Smallville', 'USA', 'Kansas', 45001);

-- 2. Add Kryptonese to the countrylanguage table. Kryptonese is spoken by 0.0001
-- percentage of the 'USA' population.
INSERT INTO countrylanguage VALUES ('USA', 'Kryptonese', false, .0001)

-- 3. After heated debate, "Kryptonese" was renamed to "Krypto-babble", change 
-- the appropriate record accordingly.
UPDATE countrylanguage
SET language = 'Krypto-babble'
WHERE language = 'Kryptonese'

-- 4. Set the US captial to Smallville, Kansas in the country table.
UPDATE country
SET capital = 4080
WHERE code = 'USA'

-- 5. Delete Smallville, Kansas from the city table. (Did it succeed? Why?)
-- did not succeed because violates foreign key constraint "country_capital_fkey" on table "country"
DELETE from city
WHERE name = 'Smallville' AND district = 'Kansas'

-- 6. Return the US captial to Washington.
UPDATE country
SET capital = 3813
WHERE code = 'USA'

Select * from city where name = 'Washington'

-- 7. Delete Smallville, Kansas from the city table. (Did it succeed? Why?)
-- Yes, because reasons
DELETE from city
WHERE name = 'Smallville' AND district = 'Kansas'


-- 8. Reverse the "is the official language" setting for all languages where the
-- country's year of independence is within the range of 1800 and 1972 
-- (exclusive). 
-- (590 rows affected)
--UPDATE employees SET sales_count = sales_count + 1 FROM accounts
 -- WHERE accounts.name = 'Acme Corporation'
  --AND employees.id = accounts.sales_person;

BEGIN

UPDATE countrylanguage
SET isofficial = NOT  isofficial
from country 
where country.code = countrylanguage.countrycode AND indepyear BETWEEN 1801 AND 1971

Select *
from countrylanguage
where countrycode = 'USA'

Select * from country where indepyear BETWEEN 1801 AND 1971
select * from countrylanguage where countrycode = 'AFG'
select * from countrylanguage where countrycode = 'USA'


ROLLBACK
COMMIT


-- 9. Convert population so it is expressed in 1,000s for all cities. (Round to
-- the nearest integer value greater than 0.)
-- (4068 rows affected)
BEGIN
UPDATE city
SET population = population / 1000
where population > 1000


SELECT count(*) FROM  city where population < 500

ROLLBACK

COMMIT


-- 10. Assuming a country's surfacearea is expressed in miles, convert it to 
-- meters for all countries where French is spoken by more than 20% of the 
-- population.
-- (7 rows affected)
BEGIN
UPDATE country
SET surfacearea = surfacearea * 2590000
FROM countrylanguage
where country.code = countrylanguage.countrycode AND percentage > 20 AND language = 'French'

SELECT * from countrylanguage where percentage > 20 AND language = 'French'
SELECT * from country

ROLLBACK

COMMIT
