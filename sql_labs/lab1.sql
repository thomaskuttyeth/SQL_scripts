CREATE TABLE Student(
    studId VARCHAR(25) NOT NULL PRIMARY KEY,
    stName VARCHAR(50) NOT NULL,
    stAddress VARCHAR(250),
    stState VARCHAR(50));

    
CREATE TABLE Subjects(
    subId VARCHAR(10) NOT NULL PRIMARY KEY,
    subName VARCHAR(50) NOT NULL
);
CREATE TABLE Marks(
    studId VARCHAR(25) NOT NULL REFERENCES Student(studId),
    subId VARCHAR(10) NOT NULL REFERENCES Subjects(subId),
    marks FLOAT NOT NULL CHECK (marks <=50)
);
CREATE VIEW view2 AS 
    SELECT  stName,subId,marks
    FROM Marks
    INNER JOIN Student
    ON Student.studId = Marks.studId
CREATE VIEW view1 AS
    SELECT subName,stName,marks
    FROM view2
    INNER JOIN Subjects
    ON Subjects.subId = view2.subId


-- insert into student table 
INSERT INTO  Student (studId,stName,stAddress,stState) VALUES ('20122001','Thomaskutty', 'house address of thomaskutty', 'Kerala');
INSERT INTO  Student (studId,stName,stAddress,stState) VALUES ('20122002','Austin', 'house address of Austin', 'Delhi');
INSERT INTO  Student (studId,stName,stAddress,stState) VALUES ('20122003','Maria', 'house address of Maria', 'Maharashtra');
INSERT INTO  Student (studId,stName,stAddress,stState) VALUES ('20122004','Joseph', 'house address of Joseph', 'Tamilnadu');
INSERT INTO  Student (studId,stName,stAddress,stState) VALUES ('20122005','Phelix', 'house address of Phelix', 'Karnataka');
INSERT INTO  Student (studId,stName,stAddress,stState) VALUES ('20122006','Steve', 'house address of Steve', 'Jharkhad');

-- insert into subject table 
INSERT INTO Subjects (subId,subName) VALUES ('MFDS01','Mathematical foundation for ds');
INSERT INTO Subjects (subId,subName) VALUES ('DBTDS02','Data Base Technologies for ds');

-- insert into mark table 
INSERT INTO Marks (studId,subId,marks) VALUES ('20122001','MFDS01',48);
INSERT INTO Marks (studId,subId,marks) VALUES ('20122001','DBTDS02',41);
INSERT INTO Marks (studId,subId,marks) VALUES ('20122002','MFDS01',32);
INSERT INTO Marks (studId,subId,marks) VALUES ('20122002','DBTDS02',28);
INSERT INTO Marks (studId,subId,marks) VALUES ('20122003','MFDS01',28);
INSERT INTO Marks (studId,subId,marks) VALUES ('20122003','DBTDS02',30);
INSERT INTO Marks (studId,subId,marks) VALUES ('20122004','MFDS01',26.5);
INSERT INTO Marks (studId,subId,marks) VALUES ('20122004','DBTDS02',41.6);
INSERT INTO Marks (studId,subId,marks) VALUES ('20122005','MFDS01',21.5);
INSERT INTO Marks (studId,subId,marks) VALUES ('20122005','DBTDS02',30);
INSERT INTO Marks (studId,subId,marks) VALUES ('20122006','MFDS01',32);
INSERT INTO Marks (studId,subId,marks) VALUES ('20122006','DBTDS02',26);


select name from tblstudent
where rollno = (
    select rollno from tblmarks where marks >= select avg(marks) from tblmarks
)



select name from tblemployee where id in 
select id from tblsalaries where salary > 40000


select name from tblemployee
WHERE age not in (SELECT MAX(age))
    ORDER BY age DESC
    FETCH NEXT 1 ROWS ONLY);


