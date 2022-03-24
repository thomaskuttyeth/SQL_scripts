CREATE TABLE product_groups (
	group_id serial PRIMARY KEY,
	group_name VARCHAR (255) NOT NULL
);

CREATE TABLE products (
	product_id serial PRIMARY KEY,
	product_name VARCHAR (255) NOT NULL,
	price DECIMAL (11, 2),
	group_id INT NOT NULL,
	FOREIGN KEY (group_id) REFERENCES product_groups (group_id)
);

INSERT INTO product_groups (group_name)
VALUES
	('Smartphone'),
	('Laptop'),
	('Tablet');

INSERT INTO products (product_name, group_id,price)
VALUES
	('Microsoft Lumia', 1, 200),
	('HTC One', 1, 400),
	('Nexus', 1, 500),
	('iPhone', 1, 900),
	('HP Elite', 2, 1200),
	('Lenovo Thinkpad', 2, 700),
	('Sony VAIO', 2, 700),
	('Dell Vostro', 2, 800),
	('iPad', 3, 700),
	('Kindle Fire', 3, 150),
	('Samsung Galaxy Tab', 3, 200);

-- queries --- 
-----------------------------------------------------------
select * from products; 
select * from product_groups;

-- aggregate function review 
select round(avg(price),2) from products;

-- aggregate on group by 
select group_name as product_group,round(avg(price),2) as average_price from products
inner join product_groups 
on products.group_id = product_groups.group_id
group by products.group_id,group_name;


-- similar to an aggregate function, a window function 
-- operates on a set of rows.However, it does not reduce the 
-- number of rows returned by the query. 
-- note: round function should be outside the over clause

SELECT  product_name,price,group_name,
	round(AVG(price) OVER(PARTITION BY group_name ),2)
FROM products 
INNER JOIN product_groups USING (group_id)
order by avg(price) over (partition by group_id) desc; 

-- row_number() useful for ordering inside a partition 
select product_name,group_name,price,
	ROW_NUMBER() over (partition by group_name order by price),
	round(avg(price) over (partition by group_name))
from products
inner join product_groups using (group_id);


-- rank , dense_rank, row_number() together 
select product_name,group_name,price,
	row_number() over(partition by group_name order by price),
	rank() over(partition by group_name order by price),
	dense_rank() over(partition by group_name order by price) 
from products  
inner join product_groups using (group_id);


-- first value and last value 
-- by default ( range between unbounded preceding and current_row)
-- range between unbounded preceding and current_row
select product_name,group_name,price,
	first_value(price) over (partition by group_name order by price) as lowest_price_per_group,
	last_value(price) over(partition by group_name order by price 
						   RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as highest_price_per_group,
	last_value(price) over (partition by group_name order by price) as cum_highest
from products
inner join product_groups using (group_id); 

-- lag and lead 
select product_name,group_name,price,
	lag(price,1) over(partition by group_name order by price) as prev_price,
	price-lag(price,1) over (partition by group_name order by price) as price_dif_lag
from products
inner join product_groups using (group_id); 


select product_name,group_name,price,
	lead(price,1) over (partition by group_name order by price) as next_price,
	price-lead(price,1) over (partition by group_name order by price ) as price_dif_next
from products
inner join product_groups using (group_id);


-- nth_value
select product_name,group_name,price,
	nth_value(product_name,2) over (partition by group_name order by price desc 
		range between unbounded preceding and unbounded following)
from products
inner join product_groups using (group_id); 

-- ntile
select product_name,group_name,price,
	ntile(2) over (partition by group_name order by price) as price_buckets
from products
inner join product_groups using (group_id); 

-- cume_dist
-- sometimes you may want to create a report that shows top or bottom x% values 
-- from a dataset, ( top 10% of products by revenue)

select product_name,round(cast(cum_dist as numeric),1)||'%' from 
	(select product_name,price,
		cume_dist() over (order by price)*100 as cum_dist
	from products) as x; 

-- percent_rank
select product_name,round(cast(percent_rank as numeric),1)||'%' from 
	(select product_name,price,
		percent_rank() over (order by price)*100 as percent_rank
	from products) as x; 
	
-------------------------------
-- postgresql window functions 
-------------------------------
-- dense_rank
-- rank 
-- row_number
-- 
-- cume_dist 
-- percent_rank
-- 
-- nth_value
-- first_value
-- last_value  
-- lag
-- lead  
-- 
-- over 
-- partition by
-- ntile 
