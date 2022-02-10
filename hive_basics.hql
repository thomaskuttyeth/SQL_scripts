-- entering into hive shell 

-- creating a database 
CREATE DATABASE  emp_details;

-- using a particular database 
-- USE emp_details 

-- creating a managed table in hive  

CREATE table emp(empno int , ename string , sal int, deptno int)
    row format delimited fields terminated by ',';


-- overwriting the table 
LOAD DATA LOCAL INPATH '/home/cloudera/Desktop/filename.txt' overwrite  into table emp;

-- checking the contents inside emp 
-- hadoop fs -ls /user/hive/warehouse/emp_details.db 


-- getting the schema of the created table 
describe emp;  

-- getting the tables in the present database 
show tables;

-- creating an external table
create external table external1 (a int, b int , c int)
    row format delimited fields terminated by ','
    LOCATION '/user/cloudera/hivedata';

-- all the queries are similar to sql 
-- selecting everything from a particular table(emp):
select * from emp;

alter table emp rename to empl;
alter table emp add COLUMNS(lastname string);
drop TABLE emp;
select deptno,sum(sal) from emp group by deptno;
