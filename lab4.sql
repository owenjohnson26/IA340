-- Q4.1 
/* 

delete from name 
where fips = '51'

No, does not work because update or delete violates the foreign key constraint. Income and population still relate to fips in the name table 
*/ 
-- Q4.2
/*
no this code does not work insert into income(fips,income,year) values('80',6000,2025) because there is no fips of '80' in the name table. You can not insert or create a primary key into a table
*/
-- Q4.3 
/*
Chat GPT prompt:
how would I create three RDS tables to capture census data. the first table is an Income table with fips, income and year. 
The second one is a name table with fips and name columns and the last table is population with columns fips pop(population) and year 

there are no errors in regard to syntax with the code produced by Chat GPT. 
Overall by providing a prompt it was able to walk through the workflow for creating tables and does a decent job explaning what it was doing. 
However, one problem is that the answers will change depending on time. You might not get the same output depending on when you execute the prompt. 
*/

-- Q4.5 
/* 

Yes ChatGPT was able to recognize the chart. 

*/

-- Q4.6 

-- Get the state with the highest income overall
SELECT n.name, i.year, i.income
FROM Income i
JOIN Name n ON i.fips = n.fips
ORDER BY i.income DESC
LIMIT 1;
/* 
This code worked and found that District of Columbia had the highest income. 
*/

-- Q4.7 
/* can you help me create a query that will calcaulte the VA population growth in the past five years.
this appears to be correct but it inclucded other columns like percent change which I did not include in the prompt. 
I did not change or alter the prompt because I was happy with the results. 
*/
-- Get population growth for Virginia (VA) over the last five years
WITH PopulationGrowth AS (
    SELECT p.fips, p.year, p.pop,
           LAG(p.pop, 5) OVER (PARTITION BY p.fips ORDER BY p.year) AS pop_five_years_ago
    FROM Population p
    JOIN Name n ON p.fips = n.fips
    WHERE n.name = 'Virginia'
)

SELECT 
    n.name AS state_name, 
    pg.year, 
    pg.pop AS current_population, 
    pg.pop_five_years_ago, 
    (pg.pop - pg.pop_five_years_ago) AS population_growth,
    ROUND(((pg.pop - pg.pop_five_years_ago) / pg.pop_five_years_ago::NUMERIC) * 100, 2) AS growth_percentage
FROM PopulationGrowth pg
JOIN Name n ON pg.fips = n.fips
WHERE pg.pop_five_years_ago IS NOT NULL
ORDER BY pg.year DESC
LIMIT 1;

-- Q4.8
/* Accurate reults from Chat GPT depend on how much infomration you provide. If you provide little infomration then its response might be vague and not helpful */
