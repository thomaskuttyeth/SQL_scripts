select * from foodie_fi.plans;
select * from foodie_fi.subscriptions;

-- simple join for viewing everything together
select p.plan_id,p.plan_name,p.price,s.customer_id,s.start_date
from foodie_fi.plans as p
inner join foodie_fi.subscriptions as s
on p.plan_id = s.plan_id;

-- how many customers has foodie-fe ever had? 
select count(distinct(s.customer_id)) as total_customers 
from foodie_fi.subscriptions as s; 

-- monthly number of users on trial plan
select date_part('month',start_date) as month_date,
	to_char(start_date,'Month') as month_name,
	count(*) as trial_subscriptions
from foodie_fi.subscriptions as s
join foodie_fi.plans as p
on s.plan_id = p.plan_id
	where s.plan_id = 0
group by date_part('month',start_date),to_char(start_date,'Month')
order by month_date asc; 



