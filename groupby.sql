


--=============  aggregation function    ========================
--avg()
-- count()  -- returns the number of rows 
--max and min
--sum()
-- aggregate fucntion happens only in selected column 




-- min function 
SELECT MIN(replacement_cost) FROM film;
-- max function 
SELECT MAX(replacement_cost) FROM film;

-- it does not make sense when we call other columns with aggregate function 

--min and max together 
SELECT MIN(replacement_cost),MAX(replacement_cost) FROM film;


-- count function 
SELECT COUNT(*) from film;

-- avg function 
select avg(replacement_cost) from film;


--roung function 
SELECT round(AVG(replacement_cost),2) from film;


--sum () 
SELECT SUM(replacement_cost) from film;


--======================group by ======================
-- group by allows us to aggregate column based on category 


SELECT customer_id from payment
GROUP BY customer_id
order by customer_id; 

-- selecting the customer who did the highest payment in totoal
select customer_id, sum(amount) from payment
GROUP BY customer_id 
order by SUM(amount) DESC
limit 1;

-- finding the total number of transactions per customer 
select customer_id, COUNT(*) from payment 
group by customer_id
order by COUNT(*) desc;



-- group by using multiple fields 
select customer_id, staff_id, sum(amount) from payment 
GROUP BY staff_id, customer_id 
order by    customer_id
--order by staff_id 
--order by sum(amount)


-- converting timestamp into date 
select DATE(payment_date) FROM payment

-- group by on date 
SELECT  DATE(payment_date),sum(amount) from payment 
GROUP BY date(payment_date)
ORDER BY sum(amount) desc;


-- ================ group by challeges 
-- challenge 1 
select staff_id, count(*) from payment
group by staff_id
order by count(*) desc;


-- challenge 2 -- finding the avg replacemnet cost per based on movie rating 
select rating, round(avg(replacement_cost),2) from film
group by rating;

-- challenge 3: finding the customerids of the top 5 customers by total spend
select customer_id, sum(amount) from payment 
group by customer_id
order by sum(amount) DESC
limit 5;


--=================== Having clause ===== 
-- having allows us to filter the result after the group by 

--NOTE : We cannot use where clause to filter based on aggregation results, because those happen after a where is executed.GROUP BY

-- question 1
select  customer_id, sum(amount) from payment
where customer_id not in (143,23,11) 
GROUP BY customer_id;
-- question 2
select customer_id, sum(amount) from payment 
where customer_id <= 25
group by customer_id 
having sum(amount) < 100;

-- question 3 
select store_id, COUNT(customer_id) from customer
group by store_id
having count(customer_id) > 300;


-- challenge 1 :  customers who did 40 or more transaction
select customer_id , count(*) from payment 
group by customer_id
having count(*) >= 40;


-- challenge 2 : find custid who have spent more than 100 iin payment with our staff id member 2 
select customer_id, sum(amount) from payment 
where staff_id = 2 
GROUP BY customer_id 
having sum(amount) > 100;



