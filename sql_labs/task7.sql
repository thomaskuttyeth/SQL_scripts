

--JOINS / AGGREGATE FUNCTIONS/ ORDER BY/ GROUP BY

CREATE TABLE Store_D( 
    Store_Id VARCHAR(10) NOT NULL PRIMARY KEY, 
    SName VARCHAR(100) NOT NULL, 
    Saddress VARCHAR(500), 
    SState VARCHAR(75));

-- inserting values to store tables:
insert into Store_D values ('ST001','Welspsn stores','9,Senapati Bapat Marg,Maharashtra 400013','Maharashtra');
insert into Store_D values ('ST002','Raymosd stores','New Hind House,Ballard Estate, Mumbai – 400 001','Kerala');
insert into Store_D values ('ST003','Tridsnt stores','Cessna Business Park,7th Floor,Umiya Business Bay, Varthur Hobli','Goa');
insert into Store_D values ('ST004','Kokuyo stores','national part street 2423 de','Delhi');
insert into Store_D values ('ST005','Pase stores','Trident Group Raikot Road Sanghera -street 12','west bengal');

CREATE TABLE Customer_D( 
    CustId VARCHAR(10) NOT NULL PRIMARY KEY, 
    CName VARCHAR(100) NOT NULL, 
    Gender VARCHAR(10), 
    AgeGroup VARCHAR(10));
-- inserting values to customer tables:
insert into Customer_D values('CT001','Thomaskutty','Male','20-30');
insert into Customer_D values('CT002','Joseph','Male','10-20');
insert into Customer_D values('CT003','Maria','Female','30-40');
insert into Customer_D values('CT004','Reethu','Female','20-30');
insert into Customer_D values('CT005','James','Male','40-50');
insert into Customer_D values('CT006','Anto','Male','40-50');

CREATE TABLE Product_D( 
    ProdId VARCHAR(10) NOT NULL PRIMARY KEY, 
    ProdName VARCHAR(100)  NOT NULL unique, 
    ProdBrand VARCHAR(100));

-- inserting values to Product tables:
insert into Product_D values ('PR001','j7 prime phone','Samsung');
insert into Product_D values ('PR002','vivobook x 519-laptop','ASUS');
insert into Product_D values ('PR003','G-4 series guitar','Kiesel');
insert into Product_D values ('PR004','p45-piano','Yamaha');
insert into Product_D values ('PR005','11-pro ipad','Apple');
insert into Product_D values ('PR006','headphone -f series','Sony');
insert into Product_D values ('PR007','p120-piano','Yamaha');

CREATE TABLE Sales_D( 
    SaleId VARCHAR(10) NOT NULL PRIMARY KEY, 
    CustId VARCHAR(100) not null references Customer_D, 
    Store_Id VARCHAR(10) not null references Store_D, 
    ProdId VARCHAR(100) not null references Product_D,
    Quantity int NOT NULL ,
    price float NOT NULL,
    SalesAmount float NOT NULL);
-- inserting values to Sales tables:
insert into Sales_D (SaleId,CustId,Store_Id,ProdID,Quantity,price,SalesAmount) values ('SL0001','CT001','ST004','PR002',2,48000,96025);
insert into Sales_D (SaleId,CustId,Store_Id,ProdID,Quantity,price,SalesAmount) values ('SL0002','CT004','ST001','PR001',1,17000,34015.62);
insert into Sales_D (SaleId,CustId,Store_Id,ProdID,Quantity,price,SalesAmount) values ('SL0003','CT003','ST002','PR004',3,36000,72056.53);
insert into Sales_D (SaleId,CustId,Store_Id,ProdID,Quantity,price,SalesAmount) values ('SL0004','CT001','ST005','PR003',1,13000,13120);
insert into Sales_D (SaleId,CustId,Store_Id,ProdID,Quantity,price,SalesAmount) values ('SL0005','CT005','ST002','PR004',1,36000,36123);
insert into Sales_D (SaleId,CustId,Store_Id,ProdID,Quantity,price,SalesAmount) values ('SL0006','CT006','ST004','PR007',2,69000,138078);
insert into Sales_D (SaleId,CustId,Store_Id,ProdID,Quantity,price,SalesAmount) values ('SL0007','CT002','ST001','PR002',3,48000,144045);
insert into Sales_D (SaleId,CustId,Store_Id,ProdID,Quantity,price,SalesAmount) values ('SL0008','CT001','ST001','PR005',2,53000,106026);
insert into Sales_D (SaleId,CustId,Store_Id,ProdID,Quantity,price,SalesAmount) values ('SL0009','CT003','ST002','PR002',2,48000,96089);
insert into Sales_D (SaleId,CustId,Store_Id,ProdID,Quantity,price,SalesAmount) values ('SL0010','CT004','ST005','PR007',1,69000,69075);
insert into Sales_D (SaleId,CustId,Store_Id,ProdID,Quantity,price,SalesAmount) values ('SL0011','CT006','ST002','PR002',1,48000,48023);
insert into Sales_D (SaleId,CustId,Store_Id,ProdID,Quantity,price,SalesAmount) values ('SL0012','CT004','ST004','PR003',1,13000,13023.95);
insert into Sales_D (SaleId,CustId,Store_Id,ProdID,Quantity,price,SalesAmount) values ('SL0013','CT002','ST005','PR002',1,48000,48089);
insert into Sales_D (SaleId,CustId,Store_Id,ProdID,Quantity,price,SalesAmount) values ('SL0014','CT001','ST003','PR006',3,4000,12100);
insert into Sales_D (SaleId,CustId,Store_Id,ProdID,Quantity,price,SalesAmount) values ('SL0015','CT005','ST002','PR006',4,4000,16200.25);
insert into Sales_D (SaleId,CustId,Store_Id,ProdID,Quantity,price,SalesAmount) values ('SL0016','CT002','ST005','PR003',5,8000,40036);
insert into Sales_D (SaleId,CustId,Store_Id,ProdID,Quantity,price,SalesAmount) values ('SL0017','CT006','ST005','PR002',1,48000,48069);
insert into Sales_D (SaleId,CustId,Store_Id,ProdID,Quantity,price,SalesAmount) values ('SL0018','CT003','ST004','PR003',3,8000,24086);
insert into Sales_D (SaleId,CustId,Store_Id,ProdID,Quantity,price,SalesAmount) values ('SL0019','CT001','ST002','PR002',2,48000,96075);
insert into Sales_D (SaleId,CustId,Store_Id,ProdID,Quantity,price,SalesAmount) values ('SL0020','CT003','ST001','PR005',1,53000,53026);


-- question 1;
-- display customer name , storename, product name ,quantity , price, 
--sales amount sorted using store name in the first level and product name in the second
create view  view1 as
    select CName,Store_Id,ProdID,Quantity,price,SalesAmount FROM Sales_D
    inner join Customer_D
    on Sales_D.CustId = Customer_D.CustID;
create view view2 as 
    select CName,SName,ProdID,Quantity,price,SalesAmount FROM view1
    INNER JOIN Store_D
    on view1.Store_Id = Store_D.Store_Id;
select CName,SName,ProdName,Quantity,price,SalesAmount from view2
    inner join Product_D
    on Product_D.ProdID = view2.ProdID
    order by SName asc, ProdName;

-- qustion 2 :
-- display statename and average sales amount for every state: 
CREATE VIEW view3 as 
    select SState, SalesAmount 
    from Sales_D
    inner join Store_D
    on Store_D.Store_Id = Sales_D.Store_Id;
select SState,avg(SalesAmount)
    from view3
    group by SState;

-- QUESTION 3;
-- display store, total sales amount for every store
CREATE VIEW view4 as 
    select SName, SalesAmount 
    from Sales_D
    inner join Store_D
    on Store_D.Store_Id = Sales_D.Store_Id;

select SName,SUM(SalesAmount)
    from view4
    group by SName;

-- QUESTION 4
-- display statename, total sales amount of every state for sales made to women
create view view5 as
    select Gender,SalesAmount,Store_Id from Sales_D
    inner join Customer_D
    on Customer_D.CustId = Sales_D.CustId
    where Gender = 'Female';
create view  view6 as
    select SState,Gender,SalesAmount 
    from view5 
    inner join Store_D
    on view5.Store_Id = Store_D.Store_Id;
select SState,sum(SalesAmount) 
    from view6
    group by SState;




