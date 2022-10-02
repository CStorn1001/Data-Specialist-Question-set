-- creating a database
create database q3;
use q3;

-- had to import the csv file via 'import wizard' on mysql  

-- updating the CostDate field from text to date
UPDATE `question 3 data`
SET CostDate = DATE_FORMAT( STR_TO_DATE(CostDate,"%d/%m/%Y" ) ,"%Y/%m/%d" );

-- testing to see if data view executes correctly
select * from `question 3 data` order by Item asc, CostDate desc; 

-- selecting statements for PreviousCost and Cost range are completed through a nested query within the select statement. This is done to determine the previous date after the current date.
-- I use a limit of 1 as it will select the 1st record which is the one of interest
-- I use a nested query inside the from clause so I can filter the data by items ascending and by most current dates
-- finally I group by the item to grab the most current item.
select c.Item, c.Cost as 'CurrentCost' , c.CostDate as 'CurrentCostDate' , 
(select c2.Cost from `question 3 data` c2 where c2.Item = c.Item and c.CostDate > c2.CostDate order by c2.CostDate desc limit 1) as PreviousCost, 
(c.Cost - (select c2.Cost from `question 3 data` c2 where c2.Item = c.Item and c.CostDate > c2.CostDate order by c2.CostDate desc limit 1)) as 'CostChange'
from (select * from `question 3 data` order by Item asc, CostDate desc)  as c;
-- group by c.Item;

--
select c.Item, c.Cost as 'CurrentCost' , c.CostDate as 'CurrentCostDate' , 
(select c2.Cost from `question 3 data` c2 where c2.Item = c.Item and c.CostDate > c2.CostDate order by c2.CostDate desc limit 1) as PreviousCost, 
(c.Cost - (select c2.Cost from `question 3 data` c2 where c2.Item = c.Item and c.CostDate > c2.CostDate order by c2.CostDate desc limit 1)) as 'CostChange'
from `question 3 data` c
group by c.Item
order by Item asc, CostDate asc;


select * from `question 3 data`;