
-- 1. What is the total amount each customer spent at the restaurant?
select customer_id,sum(menu.price)as total_amount_spent
from sales
inner join menu
on sales.product_id=menu.product_id
group by customer_id; 


-- 2. How many days has each customer visited the restaurant?
select customer_id,count(distinct(order_date))
from sales
group by customer_id;


-- 3. What was the first item from the menu purchased by each customer?
select customer_id,min(product_id) from sales 
where order_date in (
select min(order_date)
from sales
group by customer_id)
group by customer_id;


-- 4. What is the most purchased item on the menu and how many times was it purchased by all customers?
select menu.product_id,final_tbl.freq,menu.product_name from 
(select product_id,freq from 
	(select product_id,count(product_id) as freq from sales
	group by product_id) tba where freq =
		(select max(freq) as highest_freq from 
		(select  product_id, count(product_id) as freq from sales
		group by product_id) as tb1) )as final_tbl
		inner join menu 
		on menu.product_id = final_tbl.product_id;


-- 5. Which item was the most popular for each customer? 
select s.customer_id, m_.product_name, 
count(m_.product_name) as product_count,
dense_rank() 
over (partition by s.customer_id order by count(customer_id) desc) as rank_
from menu as m_
join sales as s
	on m_.product_id = s.product_id 
	group by s.customer_id, m_.product_name 

-- my version 
with final_ as (
	with id_product as (
		select customer_id, product_name 
		from sales
		inner join menu 
		on menu.product_id = sales.product_id)  

	select  customer_id,product_name,
	count(product_name) as count_,dense_rank()
	over (partition by customer_id order by count(product_name)) 
	from id_product
	group by customer_id, product_name) 

select * from final_ 
where dense_rank < 2; 


-- 6. Which item was purchased first by the customer after they became a member?

-- solution 1 : from medium 
WITH member_sales_cte AS 
(
 SELECT s.customer_id, m.join_date, s.order_date,   s.product_id,
         DENSE_RANK() OVER(PARTITION BY s.customer_id
  ORDER BY s.order_date) AS rank
     FROM sales AS s
 JOIN members AS m
  ON s.customer_id = m.customer_id
 WHERE s.order_date >= m.join_date
)
SELECT s.customer_id, s.order_date, m2.product_name 
FROM member_sales_cte AS s
JOIN menu AS m2
 ON s.product_id = m2.product_id
WHERE rank = 1;

-- my solution 
with final_ as (select *, dense_rank() 
over (partition by r.customer_id order by order_date) from 
(with tbl3 as (
with tbl2 as (
	with tbl as (
	select sales.customer_id,sales. order_date,sales.product_id,members.join_date
	from sales
	inner join members
	on members.customer_id = sales.customer_id) 
select customer_id, order_date,product_id from tbl
where join_date<=order_date
order by customer_id, order_date)
select customer_id, order_date, product_name from tbl2
inner join menu 
on menu.product_id = tbl2.product_id
order by customer_id, order_date)

select *, min(order_date)
over (partition by customer_id)
from tbl3) r) 
select customer_id,order_date,product_name from final_
where dense_rank<2; 


-- 7. Which item was purchased just before the customer became a member?
-- 8. What is the total items and amount spent for each member before they became a member?
-- 9.  If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?
-- 10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?





-- question e1: creating a new column using window function to get the seperate maximum salaries for each department 
SELECT e.*, 
MAX(salary) OVER (PARTITION BY dept_name) AS max_salary
FROM employee e; 

-- selecting first two employees from each department using row_number() window function 
SELECT * FROM (
	SELECT e.*,
	ROW_NUMBER() OVER (PARTITION BY dept_name ORDER BY emp_id) as rn 
	FROM employee e) x
WHERE x.rn <3; 
  

-- 
select e.*,
dense_rank() over (partition by product_id order by customer_id) as rank_ 
from sales e
order by  customer_id; 
--



-- dense_rank with postgresql dvd rental database;
with tbl as(
select store_id, email,
dense_rank() over (partition by store_id order by email) 
from customer)
select * from tbl
where dense_rank<=5;

-- dvdrental rank using payment table 
select *,
rank() 
over (partition by customer_id order by amount) 
from payment; 


-- dvdrental dense_rank using payment table 
select *,
dense_rank() 
over (partition by customer_id order by amount) 
from payment; 


-- rank() , dense_rank() , row_number() 
select e.*, 
rank() over (partition by dept_name order by salary desc) as rnk, 
dense_rank() over (patition by dept_name order by salary desc) as DENSE_RNK,
row_number() over (patition by dept_name order by salry desc) as rn 
from employee e; 


-- lag using payment table in dvdrental 
select *,
lag(amount) over (partition by customer_id order by payment_id)
from payment; 

-- lag with arguments ( lag of 2 with 0 as the first two row values)
select *,
lag(amount,2,0) over (partition by customer_id order by payment_id)
from payment; 


-- lead is taking the next row values( opposite of lag) 
-- example by using lag, case end 
with tbl_lag as(
select *,
lag(amount)
over (partition by customer_id 
	  order by payment_id) from payment)
select *, 
case when amount>tbl_lag.lag then 'larger'
	 when amount<tbl_lag.lag then  'smaller'
	 when amount= tbl_lag.lag then 'equal'
	 end conv
from tbl_lag; 

-- first value using payment table 
select *, 
first_value(payment_id) over (partition by customer_id order by amount desc) as highest_payment
from payment
order by customer_id, payment_id; 


-- window clause 
select* , 
first_value(product_name) over w as most_exp_product, 
last_value(product_name) over w as least_exp_product, 
from product
window w as (partition by product_category order by price desc); 

-- value 
select *, 
nth_value(payment_id,2) over (partition by customer_id order by amount desc) as second_most_payment
from payment
order by customer_id, payment_id; 

-- write a query segregate all the expensive phone, mid range phones and the cheaper phones.. 
select *,
ntile(3) over(order by price desc) as buckets
from product
where product_category = 'Phone'; 

-- ntile and case statements
select product_name, 
case when x.buckets=1 then 'Expensive'
	when x.buckets=2 then 'Mid range'
	when x.buckets=3 then 'Cheap' end phone_category 
from (
	select *, 
	ntile(3) over (order by price desc) as buckets
	from product
) x;

-- cume_dist function 
select product_name, (cume_dist_percentage||'%') as cume_dist_percentage
from 
	(select *, 
	cume_dist() over (order by price desc) as cume_distribution, 
	round(cume_dist() over (order by price desc):: numeric *100,2) as cume_dist_percentage
	from product)x
where x.cume_dist_percentage <= 30; 


-- percent_rank()
select * , 
percent_rank() over (order by price) as percentage_rank, 
round(percent_rank() over (order by price):: numeric * 100, 2) as per_rank
from product; 


SELECT * from customer; 