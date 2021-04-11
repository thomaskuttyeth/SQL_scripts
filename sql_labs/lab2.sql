


CREATE TABLE Product( 
    prodID VARCHAR(25) NOT NULL PRIMARY KEY, 
    prodName CHAR(25) NOT NULL, 
    unitPrice FLOAT NOT NULL);
    
create table SalesMaster(
    saleID varchar(25) not null primary key,
    saleDate varchar(10) not null,
    sale_amount float not null);

create table SalesDetails(
    saleID varchar(25) not null references SalesMaster(saleID),
    itemNo varchar(25) not null,
    prodID varchar(25) references Product(prodID),
    NoOfUnits integer not null CHECK (NoOfUnits > 0),
    Total float not null,
    primary key (saleID,itemNo)
    );


-- insert into Product table 
insert into Product values ('PR001','Samsung j7 prime',12);
insert into Product values ('PR002','Asus vivobook s 510',45);
insert into Product values ('PR003','alexbook e10',6);
insert into Product values ('PR004','headphone sony',24);
insert into Product values ('PR005','yamaha p45 piano',32);
insert into Product values ('PR006','Redmi note pro',15);

-- insert into salesmaster table 
insert into SalesMaster values ('SL101','Nov18',65);
insert into SalesMaster values ('SL102','Nov18',70);
insert into SalesMaster values ('SL103','Nov19',90);
insert into SalesMaster values ('SL104','Nov19',18);



-- insert into sales details    
insert into SalesDetails  values ('SL101','item1','PR003',2,12);
insert into SalesDetails  values ('SL101','item2','PR006',1,15);
insert into SalesDetails  values ('SL101','item3','PR005',1,32);
insert into SalesDetails  values ('SL102','item1','PR001',1,12);
insert into SalesDetails  values ('SL102','item2','PR003',1,6);
insert into SalesDetails  values ('SL102','item3','PR006',3,45);
insert into SalesDetails  values ('SL103','item1','PR004',2,48);
insert into SalesDetails  values ('SL103','item2','PR006',3,36);
insert into SalesDetails  values ('SL104','item1','PR006',4,15);



-- question 1;
-- display saleid,saledate,productname,unitprice, noofunits,amount 
create view view1 as
    select saleId,prodName,unitPrice,NoOfUnits 
    from SalesDetails
    inner join Product
    on SalesDetails.prodID = Product.prodID 
    order by saleId;
select view1.saleId,SalesMaster.saleDate,view1.prodName,view1.unitPrice,view1.NoOfUnits,SalesMaster.sale_amount
from view1
inner join SalesMaster
on SalesMaster.saleId = view1.saleId

-- question 2;
--Write an SQL statement which can give the salesDate and TotalSales ie. it
--should display the dates and total sales happened on that dates.

select saleDate, count(*) as Tot
from SalesMaster
group by saleDate;

select saleDate, sum(sale_amount) as total_Sales
from SalesMaster 
group by saleDate;



