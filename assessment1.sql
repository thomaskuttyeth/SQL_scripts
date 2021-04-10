
-- return the cust ids who have spent at least $110 with staff member 2 
select customer_id, sum(amount) from payment 
where staff_id = 2 
group by customer_id 
having sum(amount) >= 110;

-- How many films begin with the letter J 
select count(*) from film 
where title  like 'J%';

-- what customer has the highest customer_id number whose name starts with an "E" and has an address id lower than 500 

SELECT  * from customer
where first_name like 'E%' and address_id <  500 
order by customer_id desc 
limit 1;
