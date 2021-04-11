-- demostrate inner join 
SELECT tblCustomer.CustomerName,tblOrder.OrderDate
FROM tblCustomer 
INNER JOIN tblOrder
on tblCustomer.CustomerName = tblOrder.CustomerName;


-- demostrate left join 
SELECT tblCustomer.CustomerName,tblOrder.OrderDate
FROM tblCustomer
LEFT JOIN tblOrder
ON tblCustomer.CustomerName = tblOrder.CustomerName
ORDER BY tblCustomer.CustomerName ;

-- FULL JOIN 
SELECT tblStaff.st_email, tblDelivery.deliverydata
FROM tblStaff
FULL JOIN tblDelivery
ON tblStaff.staff_id = tblDelivery.staff_id;

-- SUBQUERY 
SELECT staff_id,st_salary 
FROM tblStaff
WHERE st_salary> (
    SELECT ROUND(AVG(st_salary),3)
    FROM tblStaff);


-- delete basedon condition 
DELETE FROM tblPayment
WHERE paymode = 'pay on delivery';

-- view using join or subquery 
CREATE VIEW V_details AS
SELECT tblDelivery.CustomerName,tblDelivery.orderID,
       tblDelivery.deliverydate, tblPayment.amount
FROM tblDelivery
INNER JOIN tblPayment
ON tblDelivery.CustomerName = tblPayment.CustomerName;


-- display view details 
SELECT * FROM V_details;
