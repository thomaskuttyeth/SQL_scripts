create table people(
	id_  serial primary key ,
	name varchar(20) not null
); 

create table job(
	id_  serial,
	people_id varchar(20) not null, 
	job_title varchar(20) not null, 
	salary int,
	primary key (id_),
	constraint fk_customer_id
		foreign key (id_)
			references people(id_)
)


insert into job(id_,people_id,job_title,salary) values (1,'t01','data scientist',62000);
insert into job(id_,people_id,job_title,salary) values (2,'t02','data scientist',82000);
insert into job(id_,people_id,job_title,salary) values (3,'t03','data scientist',92000);
insert into job(id_,people_id,job_title,salary) values (4,'t04','data scientist',49000);
insert into job(id_,people_id,job_title,salary) values (5,'t05','data scientist',83000);
insert into job(id_,people_id,job_title,salary) values (6,'t06','data analyst',42000);
insert into job(id_,people_id,job_title,salary) values (7,'t07','data analyst',34000);
insert into job(id_,people_id,job_title,salary) values (8,'t08','data engineer',72000);
insert into job(id_,people_id,job_title,salary) values (9,'t09','data engineer',49000);
insert into job(id_,people_id,job_title,salary) values (10,'t10','data analyst',83000);



insert into people(name) values ('thomaskutty'); 
insert into people(name) values ('martin'); 
insert into people(name) values ('maria'); 
insert into people(name) values ('malik'); 
insert into people(name) values ('merin'); 
insert into people(name) values ('rosmy'); 
insert into people(name) values ('tony'); 
insert into people(name) values ('joseph'); 
insert into people(name) values ('amir'); 
insert into people(name) values ('ryan'); 
insert into people(name) values ('sophie'); 


select job_title,
sum(salary)/count(job_title) as average, 
sum(salary) as total,
count(job_title) as no_of_individuals 
from job
group by job_title
order by average desc; 