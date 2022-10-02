-- creating a database
create database q3;
use q3;

-- had to import the csv file via 'import wizard' on mysql  

-- updating the CostDate field from text to date as import wizard only gave a datetime datatype
UPDATE `question 3 data`
SET CostDate = DATE_FORMAT( STR_TO_DATE(CostDate,"%d/%m/%Y" ) ,"%Y/%m/%d" );

-- testing to see if data view executes correctly
select * from `question 3 data`; 

-- Selecting the previouscost and change through a select query in which I determine the 2nd earliest date for each item. LIMIT is used to grab the first record of the query
-- The Cost change uses the same query from previous cost and the earlier cost to get the difference rounded by 2 decmial places
-- Within the WHERE Clause I try to get the max record for CostDate per item
-- Finally I order the query by Items ascending and costdate descending
SELECT c.Item, c.Cost AS 'CurrentCost' , c.CostDate AS 'CurrentCostDate' , 
(SELECT c2.Cost FROM `question 3 data` c2 WHERE c2.Item = c.Item AND c.CostDate > c2.CostDate ORDER BY c2.CostDate DESC LIMIT 1) AS 'PreviousCost', 
ROUND(c.Cost - (SELECT c2.Cost FROM `question 3 data` c2 WHERE c2.Item = c.Item and c.CostDate > c2.CostDate ORDER BY c2.CostDate DESC LIMIT 1),2) AS 'CostChange'
FROM `question 3 data` c
WHERE c.CostDate=  (SELECT MAX(c3.CostDate) FROM `question 3 data` c3 WHERE c.Item = c3.Item)
ORDER BY c.Item ASC, c.CostDate DESC;

-- Solution output can be found under csv file 'Q3-output.csv'