-- -- dvdrental database -- -- 
--- part 1 - basic sql queries --- 
--========================================================

-- selecting entire table in a db 
SELECT * FROM customer;

-- selecting a column 
SELECT table_name FROM information_schema.tables
    WHERE table_schema='public';

-- selecting all the table information 
SELECT * FROM information_schema.tables;


-- selecting first and last names and email of customer
select* from customer;
select first_name,last_name,email from customer;


-- getting the distict statement 
SELECT DISTINCT release_year from film;
SELECT DISTINCT rental_rate FROM film;

-- getting distinct elements and their respective counts 
SELECT rating , COUNT(*) AS Count FROM film
GROUP BY rating;

--concatenating first and last name 
SELECT concat(first_name,' ',last_name) as fullname from customer;

-- count function 
SELECT COUNT(*) FROM payment;
-- count with distinct 
SELECT COUNT(DISTINCT(amount)) FROM payment;

-- where statement 
SELECT * FROM customer
    WHERE first_name = 'Jared';

SELECT * from film;
SELECT title,rental_rate,replacement_cost FROM film
    WHERE rental_rate> 4 AND replacement_cost > 27;

-- getting the email for the customer whose name is 'NancyThomas'
SELECT email FROM customer
    WHERE first_name = 'Nancy' AND last_name = 'Thomas';

-- a customer wants a description of the movie outlaw hanky 
SELECT description from film
where title = 'Outlaw Hanky';

-- get the customer phone number given the address
select * from address;
select phone from address
    WHERE address = '259 Ipoh Drive'


-- order by statement 
select store_id,first_name,last_name from customer
    ORDER BY store_id asc,first_name desc;


-- limit statement - how many rows you want
-- find top 5 recent payments  
SELECT customer_id,amount 
FROM payment
ORDER BY amount desc 
limit 10;

-- find 5 shortest films
select title,length from film
ORDER BY length ASC
limit 5;

-- between operator is used to select values in a range 
-- can be use not between operator also 
-- between operator can also be used with dates which is in iso 8601 format  ( yyyy-mm-dd)

SELECT * FROM payment
WHERE amount BETWEEN 8 and 9;

select * from payment 
where amount not between 8 and 9;

select * from payment 
where payment_date between '2007-02-01' and '2007-02-15';

-- in operator check whether the value is present in given options or not
select distinct(amount) from payment;

select DISTINCT(amount) from 
(select * from payment 
where amount in (9.98,1.99,3.99)) as tabl1;

-- in with strings
select * from customer
WHERE first_name in ('Jane','Julie');

--not in operator
select * from payment 
where amount not in (9.98,1.99,3.99);


-- like and ilike - like is case sensitive  
select * from customer 
where first_name ilike '%er%' AND last_name ilike '%m%';


--         challenge part1 
--=============================================================

-- question 1: How many payment transactions were greater than 5$
select count(*) from payment
WHERE amount > 5;

-- question2 : How many actors have first letter p 
select count(*) from actor
where first_name like 'P%'

-- question 3 : How many unique districts are our customers from 
select count(distinct (district))from address;

-- question4: give those names of districts 
select DISTINCT district from address;

-- question 5 : How many films have rating R and replacement cost between 5 and 15 dollars 
SELECT count(*) FROM film
where rating = 'R' AND 
replacement_cost  BETWEEN 5 and 15;

-- question 6 : How many films which has 'Trumen' somewhere in the title 
select count(*) from film
where title like '%Truman%';

-- ===========================================================================

