
CREATE TABLE tblCompany( 
    companyId VARCHAR(50) NOT NULL PRIMARY KEY, 
    companyName VARCHAR(50) NOT NULL, 
    cmpAddress VARCHAR(250) NOT NULL);

CREATE TABLE tblProduct( 
    productID VARCHAR(25) NOT NULL PRIMARY KEY, 
    productName CHAR(25) NOT NULL, 
    companyId VARCHAR(25) NOT NULL REFERENCES tblCompany(companyId),
    price FLOAT NOT NULL);


insert into tblCompany(companyId,companyName,cmpAddress) values ('cmp001','Welspsn India Ltd','9,Senapati Bapat Marg,Maharashtra 400013');
insert into tblCompany(companyId,companyName,cmpAddress) values ('cmp002','Raymosd Ltd','New Hind House,Ballard Estate, Mumbai – 400 001');
insert into tblCompany(companyId,companyName,cmpAddress) values ('cmp003','Tridsnt Ltd','Trident Group Raikot Road Sanghera - India');
insert into tblCompany(companyId,companyName,cmpAddress) values ('cmp004','Pase Industries','Cessna Business Park,7th Floor,Umiya Business Bay, Varthur Hobli');
insert into tblCompany(companyId,companyName,cmpAddress) values ('cmp005','samsung','seocho district seoul');
insert into tblCompany(companyId,companyName,cmpAddress) values ('cmp006','huawei','shenzen china ,strrt ed243');
insert into tblCompany(companyId,companyName,cmpAddress) values ('cmp007','rolex','geneva switzerland');
insert into tblCompany(companyId,companyName,cmpAddress) values ('cmp008','yamaha','Iwata, Shizuoka, Japan');
insert into tblCompany(companyId,companyName,cmpAddress) values ('cmp009','classmate', 'kolkata india, hgg str342');
insert into tblCompany(companyId,companyName,cmpAddress) values ('cmp0010','hp','Palo Alto, 56444447 California');
insert into tblCompany(companyId,companyName,cmpAddress) values ('cmp0011','Godrej','mumbai, 1100222 - maharashtra');
insert into tblCompany(companyId,companyName,cmpAddress) values ('cmp0012','Kokuyo Camlin','mumbai - Maharastra -0011111');


insert into tblProduct(productID,productName,companyId,price) values ('PR-AOOO1','hp_150','cmp001',48000);
insert into tblProduct(productID,productName,companyId,price) values ('PR-AOOO2','t shirt','cmp002',280);
insert into tblProduct(productID,productName,companyId,price) values ('PR-AOOO3','jeans','cmp003',850);
insert into tblProduct(productID,productName,companyId,price) values ('PR-AOOO4','samsung galaxy j7','cmp002',16000);
insert into tblProduct(productID,productName,companyId,price) values ('PR-AOOO5','yamaha p 45','cmp004',40000);
insert into tblProduct(productID,productName,companyId,price) values ('PR-AOOO6','classmate books','cmp004',500);
insert into tblProduct(productID,productName,companyId,price) values ('PR-AOOO7','rolex3d','cmp006',21000);
insert into tblProduct(productID,productName,companyId,price) values ('PR-AOOO8','hp_3gh','cmp004',58000);
insert into tblProduct(productID,productName,companyId,price) values ('PR-AOOO9','yamaha p150','cmp007',61000);
insert into tblProduct(productID,productName,companyId,price) values ('PR-AOOO10','papergrid','cmp008',62);
insert into tblProduct(productID,productName,companyId,price) values ('PR-AOOO11','rolex 4f','cmp009',25000);
insert into tblProduct(productID,productName,companyId,price) values ('PR-AOOO12','huawei fh','cmp0011',12000);
insert into tblProduct(productID,productName,companyId,price) values ('PR-AOOO13','huawei Gh','cmp0012',12000);
insert into tblProduct(productID,productName,companyId,price) values ('PR-AOOO14','fan hc model','cmp0010',6000);
insert into tblProduct(productID,productName,companyId,price) values ('PR-AOOO15','samsungtv g series','cmp007',52000);
insert into tblProduct(productID,productName,companyId,price) values ('PR-AOOO16','notepad sgn','cmp004',14000);

--1.  display Compnay Name , Product and Price for all the products 
SELECT productid,companyName,price FROM tblProdut
LEFT JOIN tblCompany
ON tblProdut.companyId = tblCompany.companyId;

--2. Using a suitable SQL Statement display Company Name ,Average Price of their products
SELECT companyName,avg(price) FROM (
    SELECT companyName, price ,productid FROM tblProdut
    LEFT JOIN tblCompany
    on tblCompany.companyId = tblProdut.companyId)
GROUP BY companyName
ORDER BY AVG(price) desc 
FETCH NEXT 1 ROWS ONLY;


--3.  using a group by and order by based on aggragate function
SELECT login,
SUM(score) AS total_score
FROM training
GROUP BY login
ORDER BY SUM(score) DESC;

--4. write a query to select name of company that has the product 
-- with highest price
SELECT companyName,price FROM(
    SELECT productid,companyName,price FROM tblProduct
    LEFT JOIN tblCompany
    ON tblProdut.companyId = tblCompany.companyId)
ORDER BY price DESC
FETCH NEXT 1 ROWS ONLY;

-- 5. Write a query to select name of company that has the product 
-- with second highest price
SELECT companyName, price FROM (
    SELCT productid,companyName, price FROM tblProduct
    LEFT JOIN tblCompany
    ON tblCompany.companyId = tblProduct.companyId)
WHERE price < (
    SELECT MAX(Price) FROM tblProduct
    ORDER BY Price DESC
    FETCH NEXT 1 ROWS ONLY);


