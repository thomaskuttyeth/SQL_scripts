

--============ as clause =============
-- as clause allows us to create an alias for a column or result 
select amount as rental_price from payment;

select sum(amount) as net_revenue from payment;

-- Note: as statement executed at the very end of the query 

select count(*) as number_of_transactions
from payment;

select customer_id, sum(amount)  as total_spent from payment 
group by customer_id
having sum(amount) > 100;

-- here cannot use total_spent with having 

--===========  Inner joins ============ 
-- an inner join will result with the set of records that match in both tables 

SELECT payment_id,payment.customer_id, first_name  
from payment
inner join customer
on payment.customer_id = customer.customer_id;

-- payment and customer joins 

SELECT * from payment;


-- we are trying to find customers who haven't paid till now and those unique to the payment table 

SELECT * from customer
FULL OUTER JOIN payment
on customer.customer_id = payment.customer_id 
WHERE customer.customer_id is null or payment.payment_id is null; 


select * from film
limit 4 ;
select * from inventory
limit 10;

-- finding all the inventory for film 1 
select * from inventory 
where film_id = 1;

-- getting the table list 
select  table_name from information_schema.tables
Where table_schema = 'public';

-- finding all films which do not have a inventory id 

-- first part is the left join 
SELECT film.film_id,title,inventory_id, store_id
from film
left join inventory on 
inventory.film_id = film.film_id
-- passing one more filter 
where inventory.film_id is null;

-- checking whether 14 has an inverntory id or not 
select * from inventory 
where film_id = 14;


-- producing the same result using right join 
SELECT film.film_id,title,inventory_id, store_id
from inventory
RIGHT join film on 
inventory.film_id = film.film_id
-- passing one more filter 
where inventory.film_id is null;






--============================ union ==============================

-- union operator is used to combine the result-set of two or more select statement 
-- it basically serves to directly concatenate two results together ,essentially pasting them together.





--=============================== challenge joins===============================

-- what are the emails of the customers who live in california 

select email from customer
inner join address 
on address.address_id = customer.address_id 
where district = 'California';




select  table_name from information_schema.tables
Where table_schema = 'public';

-- challenge 2 : a customer walks in and a huge fan of the actor 'Nick Wahlberg' and wants to know which movies he is in. 
-- get the list of all the movie  "Nick Wahlberg" has been in. 

-- vewing the head of the tables using 
select * from film
limit 3;
select * from film_actor
limit 3;
select * from actor
limit 3;

-- selecting the required columns 
select first_name, last_name, film_actor.film_id,title from actor  
-- joining the film actor table 
inner join film_actor 
on actor.actor_id = film_actor.actor_id 
-- then joining the with 
inner join film 
on film_actor.film_id = film.film_id 
-- filtering for nick wahlberg 
where first_name = 'Nick' and last_name = 'Wahlberg';





