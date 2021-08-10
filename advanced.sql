--  time - contains only time 
--  date - contains only date
--  timestamp - contains date and time 
--  timestamptz - contains date , time and timezone


-- =============== functions associated with theses
--  timezone
--  now 
--  timeofday
--  current_time
--  current_date


SHOW ALL;
show timezone;

select now();
select timeofday();
SELECT CURRENT_TIME;
SELECT CURRENT_DATE;


-- extract() function allows us to extract  or obtain a sub component of a date value 
 ---- year, month, day, week, quarter 


-- Extract (year from date_col)

-- age() function calculates and return the current age given a timestamp 
 ---- age(date_col)
 ---- return 13 years form 1 mon 5 days 01:34:13.003423


--to_char() 
    -- general function to convert data types to text 
    -- useful for timestamp formatting 
    -- to_char(date_col, 'mm-dd-yyyy')

select table_name from information_schema.tables 
where table_schema = 'public';


select payment_date from payment;

-- extract(month), day, year 
select EXTRACT(year from payment_date) as year, 
extract (month from payment_date)
AS month from payment ;


SELECT AGE(payment_date) from payment;


select to_char(payment_date, 'd') from payment;

-- following returns the month in integer format 
select distinct(extract(month from payment_date)) from payment;

-- changing the integer format month into its actual string using to_char()

select disticnt(to_char(floor(extract(month from payment_date))), 'Month') from payment; 


-- challenge - during which month did payments occur
SELECT DISTINCT(
to_char(payment_date,'Month')) 
from payment;


-- how many payments occured in monday 

--method_1 
SELECT count(*) from payment
where extract(dow from payment_date)  = 1   -- monday in integer 

--method_2
select count(*) from payment
group by to_char(payment_date, 'd') 
having to_char(payment_date,'d') = '2'  -- moday in character is 2


--====================================================================
--  Mathematical Functions

select round((rental_rate/replacement_cost),2) *100 as percent_cost
from film

-- =========================================
-- string functions
-- getting the length 
select length(first_name) from customer;

-- string concatenation 
select first_name || '.' || last_name || '@gmail.com'  as full_name from customer;

-- creating a special email id for all the customers 
select LEFT(first_name, 1) || lower(last_name) || '@cmp.in' from customer;


--=====================================================
--               SUBQUERY                             
--=====================================================
-- example 
SELECT name,grade from student
where grade > select avg(grade) from students;

-- films havign renatla rate greater than avg rental rate 
select title,rental_rate from film where rental_rate > (select avg(rental_rate) from film);


-- if subquery returns multiple values then use in operator 
select film_id,title from film 
where film_id in 
(SELECT inventory.film_id
from rental
inner join inventory on inventory.inventory_id = rental.inventory_id
where return_date between '2005-05-29' and '2005-05-30')
order by title;


-- 
SELECT first_name, last_name from customer as c
WHERE exists 
(select * from payment as p 
where p.customer_id = c.customer_id and amount > 11);

--
SELECT first_name, last_name from customer as c
WHERE not exists 
(select * from payment as p 
where p.customer_id = c.customer_id and amount > 11);

--=================================================
--              self join 
--==================================================
-- find all the pairs of films thata have the same length 

SELECT f1.title, f2.title, f1.length
from film as f1
join film as f2
on f1.film_id != f2.film_id 
and f2.length = f2.length 














