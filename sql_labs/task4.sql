-- write an sql statement to add one new attribute to one of your tables
ALTER TABLE tblProsuct
ADD item_details INTEGER;

-- Write and sql statement to rename one of your tables
ALTER TABLE tblProduct
RENAME TO tblItems;

--Write and execute a select query to select all the columns of all the records in one of your tables
SELECT * FROM tblOrder;

-- write and execute a select query to select any towo attributes of one of your table based on minimum of two conditions
SELECT email,last_login
FROM tblCustomer
WHERE lastName = 'reji' AND city = 'kottayam';

-- write and exceute a select query to select all the data from one of your tables 
-- and order them based on one of the attribute in descending order
SELECT * FROM tblItems
ORDER BY product_price desc;

-- demonstrate the use of avg and sum 
SELECT AVG(prod_rating)
FROM tblItems
WHERE cmpName = 'samsung';

SELECT SUM(st_salary)
FROM tblStaff
WHERE designation = 'agent' ;

-- demostrate the use of groupby clause;
SELECT staff_id, AVG(delivery_fdbk) 
FROM tblDelivery
GROUP BY staff_id;

-- demonstrate the having clause
SELECT staff_id,AVG(delivery_fdbk) 
FROM tblDelivery
GROUP BY staff_id
HAVING AVG(delivery_fdbk) < 4;

