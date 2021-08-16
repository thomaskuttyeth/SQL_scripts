
-- creating database psql code 
create database workerdb;

-- getting all the databases availbale code in psql 
show databases;

-- use workerdb database 
use workerdb;

-- creating workerdb 
CREATE TABLE Worker(
    worker_id INT NOT NULL PRIMARY KEY, 
    first_name CHAR(25),
    last_name CHAR(25), 
    salary INT, 
    joining_date TIMESTAMP, 
    dept CHAR(25)
);

-- inserting data into Worker table 
INSERT INTO Worker 
	(worker_id, first_name, last_name,salary, joining_date,dept) VALUES
		(001, 'Monika', 'Arora', 100000, timestamp '14-02-20 09:00:00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, timestamp '2020-02-14 09:00:00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, timestamp '2020-02-13 09:00:00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, timestamp '2020-02-15 09:00:00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, timestamp '2020-02-14 09:00:00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, timestamp '2020-02-17 09:00:00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, timestamp '2020-02-14 09:00:00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, timestamp '2020-07-14 09:00:00', 'Admin');
		
-- creating Bonus table with workerid as the reference to the worker table 
CREATE TABLE Bonus(
    worker_id int  REFERENCES Worker(worker_id), 
    bonus_amount int,
    bonus_date date
);

-- inserting into Bonus tabl e
INSERT INTO Bonus 
	(worker_id,bonus,bonus_date) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');


-- afffect_from column should be renamed using alter method 
CREATE TABLE Title (
	worker_ref_id INT REFERENCES Worker(worker_id),
	worker_title  CHAR(25),
	afffect_from  TIMESTAMP
);

-- changing the column name to affect_from 
ALTER TABLE Title 
RENAME COLUMN afffect_from TO affect_from;


-- inserting data into Title 
INSERT INTO Title 
	(worker_ref_id, worker_title, affect_from) VALUES
 (001, 'Manager', TIMESTAMP '2016-02-20 00:00:00'),
 (002, 'Executive', TIMESTAMP '2016-06-11 00:00:00'),
 (008, 'Executive', TIMESTAMP '2016-06-11 00:00:00'),
 (005, 'Manager', TIMESTAMP '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', TIMESTAMP '2016-06-11 00:00:00'),
 (007, 'Executive',TIMESTAMP '2016-06-11 00:00:00'),
 (006, 'Lead', TIMESTAMP '2016-06-11 00:00:00'),
 (003, 'Lead', TIMESTAMP '2016-06-11 00:00:00');


 --joins 

 -- left join : 
 -- taking all from worker and matching from bonus 
select first_name, last_name, bonus_amount
from worker
left join bonus 
on worker.worker_id = bonus.worker_id;

-- right join 
-- all from bonus and matching from worker 
select first_name , last_name, bonus_amount
from worker
right join bonus 
on worker.worker_id = bonus.worker_id;


-- inner join 
-- taking matching from both 
select first_name, last_name , bonus_amount
from worker
right join bonus 
on worker.worker_id = bonus.worker_id ;





insert into subject values('DL101', 'deep learning - fundamentals','ds01')
insert into subject values('DL102', 'deep learning - advanced','ds03');
insert into subject values('sql101', 'sql - fundamentals','ds02');
insert into subject values('sql102', 'sql - advanced ','ds04');




UPDATE  subject
SET teacherid = 'ml301' where subid = 'DBTDS02';
UPDATE  subject
SET teacherid = 'ml302' where subid = 'ML101';

UPDATE  subject
SET teacherid = 'ml303' where subid = 'GRP102';

UPDATE  subject
SET teacherid = 'ml304' where subid = 'MFDS01'; 

UPDATE  subject
SET teacherid = 'ml305' where subid = 'REGRE103';
