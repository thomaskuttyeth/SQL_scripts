




-- question 1 :
-- create a table tblEmployee(id,name,age) insert 8 records and 
-- find out all those who are elder than renjana 


create table tblEmployee(
    id int not null primary key,
    name varchar(25) not null,
    age int not null 
);
insert into tblEmployee( id, name , age) values (001,'thomas', 24);
insert into tblEmployee( id, name , age) values (002,'anto', 29);
insert into tblEmployee( id, name , age) values (003,'joseph', 23);
insert into tblEmployee( id, name , age) values (004,'renjana', 25);
insert into tblEmployee( id, name , age) values (005,'agustine', 36);
insert into tblEmployee( id, name , age) values (006,'maria', 24);
insert into tblEmployee( id, name , age) values (007,'martin', 29);
insert into tblEmployee( id, name , age) values (008,'steve', 30);

select name
from tblEmployee
where age > (select age from tblEmployee 
            where name = 'renjana');

-- quesion 2 
-- create tblStudent (rollno, Name, Age) and tblMarks(rollNo,Marks) and list out names of students with marks 
-- greater than avaerage marks of the class 

create table tblStudent(
    rollNo int not null primary key,
    Name varchar(25) not null , 
    Age int not null
);
create table tblMarks(
    rollNo int not null references tblStudent(rollNo),
    Marks float not null,
    primary key (rollNo)
);

insert into tblStudent ( rollNo,Name, Age) values (001, 'thomas', 24);
insert into tblStudent ( rollNo,Name, Age) values (002, 'austin', 23);
insert into tblStudent ( rollNo,Name, Age) values (003, 'maria', 22);
insert into tblStudent ( rollNo,Name, Age) values (004, 'martin', 24);
insert into tblStudent ( rollNo,Name, Age) values (005, 'joseph', 21);
insert into tblStudent ( rollNo,Name, Age) values (006, 'emilda', 22);
insert into tblStudent ( rollNo,Name, Age) values (007, 'anis', 23);
insert into tblStudent ( rollNo,Name, Age) values (008, 'victor', 25);


insert into tblMarks (rollNo, Marks) values (001,93);
insert into tblMarks (rollNo, Marks) values (002,70);
insert into tblMarks (rollNo, Marks) values (003,73);
insert into tblMarks (rollNo, Marks) values (004,81);
insert into tblMarks (rollNo, Marks) values (005,52);
insert into tblMarks (rollNo, Marks) values (006,62);
insert into tblMarks (rollNo, Marks) values (007,75);
insert into tblMarks (rollNo, Marks) values (008,61);

select Name from tblStudent where rollNo in 
    (select rollNo 
    from tblMarks where Marks> (select avg(Marks) 
                                from tblMarks));  




-- question 3:
-- create EmpSalary( id,salary) insert 8 rows and 
--find the names of employees who are getting salary greater than 40000   


create table tblEmployee(
    id int not null primary key,
    name varchar(25) not null,
    age int not null 
);
insert into tblEmployee( id, name , age) values (001,'thomas', 24);
insert into tblEmployee( id, name , age) values (002,'anto', 29);
insert into tblEmployee( id, name , age) values (003,'joseph', 23);
insert into tblEmployee( id, name , age) values (004,'renjana', 25);
insert into tblEmployee( id, name , age) values (005,'agustine', 36);
insert into tblEmployee( id, name , age) values (006,'maria', 24);
insert into tblEmployee( id, name , age) values (007,'martin', 29);
insert into tblEmployee( id, name , age) values (008,'steve', 30);

create table EmpSalary(
    id int not null references tblEmployee(id),
    salary float not null,
    primary key (id)
);
insert into EmpSalary (id, salary) values (001, 45000);
insert into EmpSalary (id, salary) values (002, 35000);
insert into EmpSalary (id, salary) values (003, 55000);
insert into EmpSalary (id, salary) values (004, 60000);
insert into EmpSalary (id, salary) values (005, 39000);
insert into EmpSalary (id, salary) values (006, 33000);
insert into EmpSalary (id, salary) values (007, 46000);
insert into EmpSalary (id, salary) values (008, 26000);

select name from tblEmployee 
where id in 
(select id from EmpSalary 
where salary > 40000);


-- question 4
-- find the second eldermost emplotee in the company 

create table tblEmployee(
    id int not null primary key,
    name varchar(25) not null,
    age int not null 
);
insert into tblEmployee( id, name , age) values (001,'thomas', 24);
insert into tblEmployee( id, name , age) values (002,'anto', 29);
insert into tblEmployee( id, name , age) values (003,'joseph', 23);
insert into tblEmployee( id, name , age) values (004,'renjana', 25);
insert into tblEmployee( id, name , age) values (005,'agustine', 36);
insert into tblEmployee( id, name , age) values (006,'maria', 24);
insert into tblEmployee( id, name , age) values (007,'martin', 29);
insert into tblEmployee( id, name , age) values (008,'steve', 30);

select name from tblEmployee
where age = (select max(age) from tblEmployee
            where age != (select max(age) from tblEmployee)) ;


-- question 5 ;
-- create  tblToppers(rollNo, Name, age) 
-- insert details for students who got marks greater than average marks of the class

create tblToppers (
    rollNo int  not null  references references tblStudent(rollNo) , 
    Name  varchar(25) not null references tblStudent(Name), 
    age  int not null references tblStudent(age),
    primary key (rollNo)
);

create table tblStudent(
    rollNo int not null primary key,
    Name varchar(25) not null , 
    Age int not null
);
create table tblMarks(
    rollNo int not null references tblStudent(rollNo),
    Marks float not null,
    primary key (rollNo)
);

insert into tblStudent ( rollNo,Name, Age) values (001, 'thomas', 24);
insert into tblStudent ( rollNo,Name, Age) values (002, 'austin', 23);
insert into tblStudent ( rollNo,Name, Age) values (003, 'maria', 22);
insert into tblStudent ( rollNo,Name, Age) values (004, 'martin', 24);
insert into tblStudent ( rollNo,Name, Age) values (005, 'joseph', 21);
insert into tblStudent ( rollNo,Name, Age) values (006, 'emilda', 22);
insert into tblStudent ( rollNo,Name, Age) values (007, 'anis', 23);
insert into tblStudent ( rollNo,Name, Age) values (008, 'victor', 25);


insert into tblMarks (rollNo, Marks) values (001,93);
insert into tblMarks (rollNo, Marks) values (002,70);
insert into tblMarks (rollNo, Marks) values (003,73);
insert into tblMarks (rollNo, Marks) values (004,81);
insert into tblMarks (rollNo, Marks) values (005,52);
insert into tblMarks (rollNo, Marks) values (006,62);
insert into tblMarks (rollNo, Marks) values (007,75);
insert into tblMarks (rollNo, Marks) values (008,61);


insert into tblToppers
select rollNo, Name, Age from tblStudent where rollNo in 
    (select rollNo 
     from tblMarks where Marks> (select avg(Marks) 
                                 from tblMarks));

