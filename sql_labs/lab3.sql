DROP TABLE IF EXISTS sales_table;
CREATE TEMPORARY TABLE sales_table
(
    key       varchar(6),
    customerID  varchar(10),
    productID   varchar(10),
    price     float
);
INSERT INTO sales_table
VALUES ('1', 'Customer1', 'Product1', 100),
       ('2', 'Customer1', 'Product1', 200),
       ('3', 'Customer1', 'Product2', 100),
       ('4', 'Customer2', 'Product2', 200),
       ('5', 'Customer2', 'Product3', 100);
SELECT customerID,
       productID,
       SUM(price) AS sales,
       SUM(SUM(price)) OVER (PARTITION BY customerID) AS sales_all
FROM sales_table
GROUP BY customerID, productID
ORDER BY customerID, productID
