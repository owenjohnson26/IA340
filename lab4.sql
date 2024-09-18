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



