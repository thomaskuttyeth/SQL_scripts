
-- fetch first_names from worker table using alias name as worker_name
select first_name as worker_name from Worker;

-- fetch first name from worker in upper case 
select upper(first_name) from Worker;

-- fetching unique values from department from worker table 
select distinct dept from worker;

-- print first three names in first name form worker table 
select first_name from worker
limit(3);

-- printing first three characters in first_name 
-- second parameter is the starting index, third parameter is the len of substring.
select substring(first_name,1,3) from worker;


-- find the  position of the alphabet ('a') in the first name column 

select first_name from Worker
where first_name not ilike 'v%';
-- '%er%' , 'Jen%', '_her%'  patterns 

-- print(first name after removing the white space from right )
select rtrim(first_name) from Worker; 
-- r trim function removes the trailing spaces from a string 

select ltrim(first_name) from Worker;
-- ltrim function removes the leading spaces from a string
-- trim funciton removes leading and trailing spaces from a string. 

-- fectches the unique values of department from worker  table and prints its length.
select distinct length(dept) from Worker; 
select distinct dept, length(dept) from worker;
select dept from Worker;


-- print  first_name from worker after replacing a with 'A' 
select replace(first_name, 'a','A') from Worker;

-- replacing the substring with "RR"
select replace (first_name, substring(first_name, 1,1), "RR") from worker;


-- getting the host name 
SELECT boot_val,reset_val
FROM pg_settings
WHERE name='listen_addresses';;

-- getting the table names in the database 
select table_name from information_schema.tables
where table_schema = 'public';

-- getting the user name 
select user;


-- getting port id 
SELECT *
FROM pg_settings
WHERE name = 'port';

-- getting the details of a column 
SELECT *
FROM information_schema.columns
WHERE  table_name   = 'worker';



-- selecting all the tables in worker_db
select * from worker;
select * from bonus;
select * from title;


--                     joins 
--===============================================

-- right join  
select first_name,bonus_amt from bonus
right join worker
ON worker_ref_id = worker_id
where bonus_amt is not NULL;

-- inner join 
select first_name,bonus_amt from bonus
inner join worker
ON worker_ref_id = worker_id;

-- left join 
select first_name,bonus_amt from worker
left join bonus
on worker_ref_id = worker_id;

--=============================================
