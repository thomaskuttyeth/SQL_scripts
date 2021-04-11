CREATE TABLE tblCompany( 
    cmpName VARCHAR(50) NOT NULL PRIMARY KEY, 
    cmpAddress VARCHAR(250) NOT NULL, 
    cmpDescr VARCHAR(500), 
    cmpTollfree INTEGER, 
    cmpEmail VARCHAR(25) NOT NULL) ;

CREATE TABLE tblCustomer( 
    CustomerName VARCHAR(25) NOT NULL PRIMARY KEY, 
    pwd VARCHAR(25) NOT NULL , 
    email VARCHAR(25) UNIQUE, 
    firstName CHAR(25) NOT NULL, 
    lastName CHAR(25) NOT NULL, 
    phNo INTEGER NOT NULL , 
    cardNo VARCHAR(15) NOT NULL , 
    zip INTEGER, 
    city CHAR(25), 
    last_login TIMESTAMP, 
    accCreated DATE);

CREATE TABLE tblCategory( 
    catID VARCHAR(25) NOT NULL PRIMARY KEY, 
    catName CHAR(25) NOT NULL UNIQUE, 
    item_quant INTEGER NOT NULL, 
    catDescrip VARCHAR (500), 
    lst_update DATE NOT NULL)  ;

CREATE TABLE tblOrder( 
    orderID VARCHAR(25) NOT NULL PRIMARY KEY, 
    orderDate DATE NOT NULL, 
    CustomerName VARCHAR(25) NOT NULL REFERENCES tblCustomer(CustomerName), 
    No_quantity INTEGER NOT NULL CHECK (No_quantity <5))  ;

CREATE TABLE tblProduct( 
    productID VARCHAR(25) NOT NULL PRIMARY KEY, 
    productName CHAR(25) NOT NULL, 
    cmpName VARCHAR(25) NOT NULL REFERENCES tblCompany(cmpName), 
    prodct_descrip VARCHAR(500) NOT NULL, 
    catID VARCHAR(25) NOT NULl REFERENCES tblCategory(catID), 
    prod_rating FLOAT CHECK (prod_rating <=5), 
    product_price FLOAT NOT NULL);

CREATE TABLE tblPayment( 
    payID VARCHAR(25) NOT NULL PRIMARY KEY, 
    CustomerName VARCHAR(25) REFERENCES tblCustomer(CustomerName), 
    orderID VARCHAR(25) REFERENCES tblOrder(orderID), 
    amount DECIMAL NOT NULL, 
    payDate DATE NOT NULL, 
    payMode CHAR(25) NOT NULL)  ;

CREATE TABLE tblBranch( 
    branch_id VARCHAR(25)  NOT NULL PRIMARY KEY, 
    branch_name VARCHAR(25) unique, 
    br_staff_count INTEGER NOT NULL, 
    br_email VARCHAR(25) NOT NULL, 
    br_phNo INTEGER NOT NULL UNIQUE) ;

CREATE TABLE tblStaff( 
    staff_id VARCHAR(25) NOT NULL PRIMARY KEY, 
    st_first_name CHAR(25)NOT NULL, 
    st_last_name CHAR(25)NOT NULL, 
    designation CHAR(25)NOT NULL, 
    branch_id VARCHAR(25) NOT NULL REFERENCES tblBranch(branch_id), 
    st_email VARCHAR(25) NOT NULL, 
    st_phNo INTEGER NOT NULL, 
    st_salary FLOAT NOT NULL CHECK (st_salary <=50000));

CREATE TABLE tblDelivery( 
    orderID VARCHAR(25) NOT NULL REFERENCES tblOrder(orderID) PRIMARY KEY, 
    staff_id VARCHAR(25) NOT NULL REFERENCES tblStaff(staff_id), 
    CustomerName VARCHAR(25) REFERENCES tblCustomer(CustomerName), 
    deliveryDate DATE NOT NULL, 
    delivery_fdbk DECIMAL CHECK (delivery_fdbk <=5));

CREATE TABLE tblOffer( 
    productID VARCHAR(25) NOT NULL REFERENCES tblProduct(productID) PRIMARY KEY, 
    discount FLOAT, 
    startDate DATE, 
    dueDate DATE, 
    save_amount FLOAT);

CREATE TABLE tblShipping( 
    shipID VARCHAR(25) NOT NULL PRIMARY KEY, 
    orderID VARCHAR(25) NOT NULL REFERENCES tblOrder(orderID), 
    branch_id VARCHAR(25) NOT NULL REFERENCES tblBranch(branch_id), 
    br_phNo INTEGER NOT NULL REFERENCES tblBranch(br_phNo), 
    shipDue INTEGER NOT NULL, 
    shipDate DATE);

CREATE TABLE tblProductOrder( 
	productID VARCHAR(25) NOT NULL REFERENCES tblProduct(productID), 
	orderID VARCHAR(25) NOT NULL REFERENCES tblOrder(orderID)) ;

        insert into tblCompany values ('Welspsn India Ltd','9,Senapati Bapat Marg,Maharashtra 400013','fabric productions',02224908000,'welpson@gmail.com');
        insert into tblCompany values ('Raymosd Ltd','New Hind House,Ballard Estate, Mumbai – 400 001.','textile industry',91226152700,'raymondgroup@gmail.com');
        insert into tblCompany values ('Tridsnt Ltd','Trident Group Raikot Road Sanghera - India','textile industry',911615039999,'corp@tridentindia.com');
        insert into tblCompany values ('Pase Industries','Cessna Business Park,7th Floor,Umiya Business Bay, Varthur Hobli,','textile industry',911615647999,'investors@jockndia.com');
        insert into tblCompany values ('samsung','seocho district seoul','digital tech',null,'www.samsung.com');
        insert into tblCompany values ('huawei','shenzen china',null,null,'huawei@support');
        insert into tblCompany values ('rolex','geneva switzerland','luxury watch manufacturer',null,'rolex.help@gmail.com');
        insert into tblCompany values ('yamaha','Iwata, Shizuoka, Japan','motorcycles, marine products',null,'yamaha.support@gmail.com');
        insert into tblCompany values ('classmate', 'kolkata india','stationary',null,'classmate.help@gmail.com');
        insert into tblCompany values ('hp','Palo Alto, California','information technology',null,'hp.care@gmail.com');
        insert into tblCompany values ('Godrej','mumbai, maharashtra','appliances, furniture',null,'godrej.hep@gmail.com');
        insert into tblCompany values ('Kokuyo Camlin','mumbai', 'stationry and printing',02266557007, 'camlin.help@gmail.com');


        
        insert into tblCustomer values('thomas','thomas123','thomas.reji@gmail.com','thomaskutty','reji',92623486628,'354657',686577,'kottayam',TIMESTAMP'2020-10-05 20:15:00',DATE '2015-1-17');
        insert into tblCustomer values ('joseph','joseph123','joseph.saj@gmail.com','joseph','saj',95483456628,'354654',686757,'thodupuzha',TIMESTAMP'2020-10-06 14:14:00',DATE '2015-02-26');
        insert into tblCustomer values ('anto','thanto3','anto.rian@gmail.com','antom','rian',856125486628,'021657',684277,'idukki',TIMESTAMP'2020-10-06 18:14:00',DATE '2015-03-16');
        insert into tblCustomer values ('rijo12','thskdjf23','rijoy23@gmail.com','rijose','james',75628486628,'376657',682577,'ernakulam',TIMESTAMP'2020-10-04 16:24:00',DATE '2015-03-17');
        insert into tblCustomer values ('este14','skfhso8','esteraugus2@gmail.com','ester','mathew',95563486628,'374657',686579,'kottayam',TIMESTAMP'2020-10-05 12:44:00',DATE '2015-06-17');
        insert into tblCustomer values ('rihsn45','rinso34','rinsonjames@gmail.com','rinson','augsustine',94823486628,'954657',686577,'kollam',TIMESTAMP'2020-10-04 06:24:00',DATE '2015-06-17');
        insert into tblCustomer values ('amlno28','skj234','algoretho23@gmail.com','algore','james',65623445688,'354657',686574,'alappuzha',TIMESTAMP'2020-10-07 05:13:00',DATE '2015-06-18');
        insert into tblCustomer values ('ljji46','lskjd842','lijinsf@gmail.com','liji','joseph',95623481234,'354657',684577,'thrissur',TIMESTAMP'2020-10-07 06:13:00',DATE '2015-11-17');
        insert into tblCustomer values ('hinja243','welkjf234','heoins234@1gmail.com','heroni','reji',74678456628,'354657',686572,'kottayam',TIMESTAMP'2020-10-06 04:14:00',DATE '2015-12-17');
        insert into tblCustomer values ('rithu','georg234','rithu.jens@gmail.com','rithu','george',8462349564,'854657',686548,'malappuram',TIMESTAMP'2020-10-05 07:14:00',DATE '2015-12-22');
        insert into tblCustomer values ('marin13','dflskj234','maria.reji@gmail123','maria','reji',86543486628,'348657',686549,'vayanad',TIMESTAMP'2020-10-06 06:14:00',DATE '2015-12-25');
        insert into tblCustomer values ('srinath','sri123','srinath.p@gmail.com','srinath','nair',25462132541,'945462',645121,'kollam',TIMESTAMP'2020-10-05 06:14:00',DATE '2015-12-26');
        
        insert into tblCategory values('AA001','fashion',13211,'fashion materials',DATE '2020-10-01');
        insert into tblCategory values('AA002','electronics',6542,'electronic devices',DATE '2020-10-01');
        insert into tblCategory values('AA003','laptop',657,'includes gaming and general laptops',DATE '2020-10-01');
        insert into tblCategory values('AA004','musical',945,'musical instruments both electric and acoustic',DATE '2020-10-01');
        insert into tblCategory values('AA005','mobiles',454,'smart phones ranges from 10k to 50k',DATE '2020-10-01');
        insert into tblCategory values('AA006','stationary','324','students materials and other general items',DATE '2020-10-01');
        insert into tblCategory values('AA007','food',214,'drinks,snacks and all',DATE '2020-10-01');
        insert into tblCategory values('AA008','toys',651,'kids corner',DATE '2020-10-01');
        insert into tblCategory values('AA009','appliances',653,'house appliances ranges to 50k',DATE '2020-10-01');
        insert into tblCategory values('AA0010','textiles',1232,'dresses  for kids, men and women',DATE '2020-10-01');
        insert into tblCategory values('AA0012','cosmetics',2323,'cosmetic items for all',DATE '2020-10-01');
        insert into tblCategory values('AA0013','trends',324,'new trends in the market',DATE '2020-10-01');

        insert into tblOrder values ('OI-1001',DATE '2020-10-02','thomas',2);
        insert into tblOrder values ('OI-1002',DATE '2020-10-01','joseph',2);
        insert into tblOrder values ('OI-1003',DATE '2020-10-01','anto',1);
        insert into tblOrder values ('OI-1004',DATE '2020-10-08','marin13',2);
        insert into tblOrder values ('OI-1005',DATE '2020-10-06','rijo12',1);
        insert into tblOrder values ('OI-1006',DATE '2020-10-09','este14',1);
        insert into tblOrder values ('OI-1007',DATE '2020-10-10','rihsn45',2);
        insert into tblOrder values ('OI-1008',DATE '2020-10-10','srinath',1);
        insert into tblOrder values ('OI-1009',DATE '2020-10-11','ljji46',1);
        insert into tblOrder values ('OI-10010',DATE '2020-10-12','amlno28',1);
        insert into tblOrder values ('OI-10011',DATE '2020-10-13','hinja243',1);

        insert into tblProduct values ('PR-AOOO1','hp_150','hp','hp laptop s series-ash color','AA003',4.3,48000);
        insert into tblProduct values ('PR-AOOO2','t shirt','Raymosd Ltd','red color, medium size-gents','AA0013',4.1,280);
        insert into tblProduct values ('PR-AOOO3','jeans','Tridsnt Ltd','blue, size - medium','AA0010',3.9,850);
        insert into tblProduct values ('PR-AOOO4','samsung galaxy j7','samsung','blue color with 4 gb ram','AA005',4.2,16000);
        insert into tblProduct values ('PR-AOOO5','yamaha p 45','yamaha','piano - black','AA004',4.3,40000);
        insert into tblProduct values ('PR-AOOO6','classmate books','classmate','one bundle - unruled','AA006',3.8,500);
        insert into tblProduct values ('PR-AOOO7','rolex3d','rolex','rolex watch- 3d model- silver','AA001',3.9,21000);
        insert into tblProduct values ('PR-AOOO8','hp_3gh','hp','hp laptop g series- black color','AA003',4.4,58000);
        insert into tblProduct values ('PR-AOOO9','yamaha p150','yamaha','piano 88 key black surface','AA004',4.4,61000);
        insert into tblProduct values ('PR-AOOO10','papergrid','classmate','book- 180 pages unruled','AA006',4.2,62);
        insert into tblProduct values ('PR-AOOO11','rolex 4f','rolex','rolex watch f series - white and brown-medium','AA001',4.0,25000);
        insert into tblProduct values ('PR-AOOO12','huawei fh','huawei','black- medium model- huawei phone','AA005',4.0,12000);
        insert into tblProduct values ('PR-AOOO13','huawei Gh','huawei','black-advanced-model- huawei phone','AA005',4.2,12000);
        insert into tblProduct values ('PR-AOOO14','fan h','huawei','brown- medium model- huawei fans','AA004',4.6,6000);
        insert into tblProduct values ('PR-AOOO15','samsungtv g series','samsung','black-samsung tv latest model','AA004',4.5,52000);
        insert into tblProduct values ('PR-AOOO16','notepad sgn','samsung','silver- model- samsung','AA004',4.5,14000);
        insert into tblPayment values ('PP-ID-OD-51','thomas','OI-1001',36062,DATE '2020-10-02','google pay');
        insert into tblPayment values ('PP-ID-OD-53','joseph','OI-1002',100700,DATE '2020-10-01','google pay');
        insert into tblPayment values ('PP-ID-OD-54','anto','OI-1003',500,DATE '2020-10-08','pay on delivery');
        insert into tblPayment values ('PP-ID-OD-55','marin13','OI-1004',32720,DATE '2020-10-08','google pay');
        insert into tblPayment values ('PP-ID-OD-56','rijo12','OI-1005',850,DATE '2020-10-11','pay on delivery');
        insert into tblPayment values ('PP-ID-OD-57','este14','OI-1006',252,DATE '2020-10-14','pay on delivery');
        insert into tblPayment values ('PP-ID-OD-58','rihsn45','OI-1007',43200,DATE '2020-10-10','google pay');
        insert into tblPayment values ('PP-ID-OD-59','srinath','OI-1008',6000,DATE '2020-10-10','google pay');
        insert into tblPayment values ('PP-ID-OD-60','ljji46','OI-1009',3000,DATE '2020-10-10','google pay');
        insert into tblPayment values ('PP-ID-OD-61','amlno28','OI-10010',26000,DATE '2020-10-12','google pay');
        insert into tblPayment values ('PP-ID-OD-62','hinja243','OI-10011',7000,DATE '2020-10-13','google pay');

        INSERT INTO tblBranch VALUES ('BB-01-1001','th123_pala',40,'br_plaa@gmail.com',8546758425);
        INSERT INTO tblBranch VALUES ('BB-01-1002','ch123_kottayam',35,'br_ktt@gmail.com',8545152535);
        INSERT INTO tblBranch VALUES ('BB-01-1003','msd_thodupuzha',26,'br_thd@gmail.com',4985464578);
        INSERT INTO tblBranch VALUES ('BB-01-1004','mn-paika123',28,'br_mnc@gmail.com',1354684549);
        INSERT INTO tblBranch VALUES ('BB-01-1005','pl_mutholi',45,'br_pmuth@gmail.com',2564589454);
        INSERT INTO tblBranch VALUES ('BB-01-1006','pl_cherpnk',51,'br_chrp@gmail.com',8978546125);
        INSERT INTO tblBranch VALUES ('BB-01-1007','pl_bhar123',51,'br_pbhar@gmail.com',4589768542);
        INSERT INTO tblBranch VALUES ('BB-01-1008','ch_ponk243',32,'br_pnkm@gmail.com',1626542653);
        INSERT INTO tblBranch VALUES ('BB-01-1009','ch_234jju',23,'br_jju@gmail.com',5956587812);
        INSERT INTO tblBranch VALUES ('BB-01-10010','hi243ooun',12,'br_onna@gmail.com',9465851524);
        INSERT INTO tblBranch VALUES ('BB-01-10011','hj_234kfhk',25,'br_kfk@gmail.com',9565656124);
        INSERT INTO tblBranch VALUES ('BB-01-10012','ji_123hfhgs',26,'br_hfeh@gmail.com',8545754857);

        insert into tblStaff values('ST-45551','justin','peter','manager','BB-01-1009','justinpeter12@gmail.com',5213246552,45000);
        insert into tblStaff values('ST-45552','alphy','thomas','agent','BB-01-1001','alphythomas34@gmail.com',6594587654,29000);
        insert into tblStaff values('ST-45553','jacob','paul','agent','BB-01-1005','jacobpaul46@gmail.com',2564512548,29000);
        insert into tblStaff values('ST-45554','george','mathew','vice manager','BB-01-1009','georgemathew52@gmail.com',2316452451,42000);
        insert into tblStaff values('ST-45555','vivek','rajan','agent','BB-01-1006','vivekrajan123@gmail.com',6454645484,35000);
        insert into tblStaff values('ST-45556','siraj','raval','agent','BB-01-1007','sirajravel@gmail.com',9454845474,35000);
        insert into tblStaff values('ST-45557','siddarth','dev','manager','BB-01-1004','siddartthd3@gmail.com',9465856595,45000);
        insert into tblStaff values('ST-45558','sunil','paul','agent','BB-01-1004','sunilpaul@gmail.com',9656458475,32000);
        insert into tblStaff values('ST-45559','kiran','mathew','agent','BB-01-1003','kiran_mathew@gmail.com',8457545754,38000);
        insert into tblStaff values('ST-455510','paul','jos','agent','BB-01-1009','pauljo@gmail.com',7545754654,32000);
        insert into tblStaff values('ST-455511','amar','sinha','agent','BB-01-1009','amar_sinha@gmail.com',7421536245,29000);
        insert into tblStaff values('ST-455512','jerson','eble','agent','BB-01-1009','jersonable@gmail.com',6124546854,31000);

        insert into tblDelivery values('OI-1001','ST-45551','thomas',DATE '2020-10-02',4.2);
        insert into tblDelivery values('OI-1002','ST-45552','joseph',DATE '2020-10-01',3.8);
        insert into tblDelivery values('OI-1003','ST-45553','anto',DATE '2020-10-08',3.9);
        insert into tblDelivery values('OI-1004','ST-45554','marin13',DATE '2020-10-08',3.7);
        insert into tblDelivery values('OI-1005','ST-45555','rijo12',DATE '2020-10-11',3.9);
        insert into tblDelivery values('OI-1006','ST-45556','este14',DATE '2020-10-14',4.1);
        insert into tblDelivery values('OI-1007','ST-45557','rihsn45',DATE '2020-10-10',4.1);
        insert into tblDelivery values('OI-1008','ST-45557','srinath',DATE '2020-10-15',4.1);
        insert into tblDelivery values('OI-1009','ST-45557','ljji46',DATE '2020-10-17',4.2);
        insert into tblDelivery values('OI-10010','ST-45559','amlno28',DATE '2020-10-16',3.1);
        insert into tblDelivery values('OI-10011','ST-45557','hinja243',DATE '2020-10-18',2.9);

        insert into tblOffer values('PR-AOOO1',10.0,DATE '2020-10-01',DATE '2020-11-01',4800);
        insert into tblOffer values('PR-AOOO2',10.0,DATE '2020-10-01',DATE '2020-11-01',28);
        insert into tblOffer values('PR-AOOO4',20.0,DATE '2020-10-01',DATE '2020-11-01',3200);
        insert into tblOffer values('PR-AOOO5',10.0,DATE '2020-10-01',DATE '2020-11-01',4000);
        insert into tblOffer values('PR-AOOO7',5.0,DATE '2020-10-01',DATE '2020-11-01',1050);
        insert into tblOffer values('PR-AOOO9',30.0,DATE '2020-10-01',DATE '2020-11-01',18300);
        insert into tblOffer values('PR-AOOO12',10.0,DATE '2020-10-01',DATE '2020-11-01',2500);
        insert into tblOffer values('PR-AOOO13',50.0,DATE '2020-10-01',DATE '2020-11-01',6000);
        insert into tblOffer values('PR-AOOO14',50.0,DATE '2020-10-02',DATE '2020-11-02',3000);
        insert into tblOffer values('PR-AOOO15',50.0,DATE '2020-10-2',DATE'2020-11-03',26000);
        insert into tblOffer values('PR-AOOO16',50.0,DATE '2020-10-2',DATE '2020-11-03',7000);

        INSERT INTO  tblShipping VALUES ('SS-1000-OI-1001','OI-1001','BB-01-1001',8546758425,5,DATE '2020-10-07');
        INSERT INTO  tblShipping VALUES ('SS-1000-OI-1002','OI-1002','BB-01-1005',2564589454,4,DATE '2020-10-06');
        INSERT INTO  tblShipping VALUES ('SS-1000-OI-1003','OI-1003','BB-01-1006',8978546125,7,DATE '2020-10-08');
        INSERT INTO  tblShipping VALUES ('SS-1000-OI-1004','OI-1004','BB-01-1007',4589768542,5,DATE '2020-10-13');
        INSERT INTO  tblShipping VALUES ('SS-1000-OI-1005','OI-1005','BB-01-1004',1354684549,5,DATE '2020-10-11');
        INSERT INTO  tblShipping VALUES ('SS-1000-OI-1006','OI-1006','BB-01-1003',4985464578,5,DATE '2020-10-14');
        INSERT INTO  tblShipping VALUES ('SS-1000-OI-1007','OI-1007','BB-01-1009',5956587812,6,DATE '2020-10-10');
        INSERT INTO  tblShipping VALUES ('SS-1000-OI-1008','OI-1008','BB-01-1004',1354684549,5,DATE '2020-10-10');
        INSERT INTO  tblShipping VALUES ('SS-1000-OI-1009','OI-1009','BB-01-1004',8545152535,6,DATE '2020-10-11');
        INSERT INTO  tblShipping VALUES ('SS-1000-OI-10010','OI-10010','BB-01-1003',4985464578,4,DATE '2020-10-12');
        INSERT INTO  tblShipping VALUES ('SS-1000-OI-10011','OI-10011','BB-01-1004',1354684549,5,DATE '2020-10-13');

        insert into tblProductOrder values ('PR-AOOO5','OI-1001');
        insert into tblProductOrder values ('PR-AOOO8','OI-1002');
        insert into tblProductOrder values ('PR-AOOO6','OI-1003');
        insert into tblProductOrder values ('PR-AOOO10','OI-1001');
        insert into tblProductOrder values ('PR-AOOO3','OI-1005');
        insert into tblProductOrder values ('PR-AOOO2','OI-1006');
        insert into tblProductOrder values ('PR-AOOO1','OI-1007');
        insert into tblProductOrder values ('PR-AOOO4','OI-1004');
        insert into tblProductOrder values ('PR-AOOO7','OI-1004');
        insert into tblProductOrder values ('PR-AOOO9','OI-1002');
        insert into tblProductOrder values('PR-AOOO13','OI-1008');
        insert into tblProductOrder values('PR-AOOO14','OI-1009');
        insert into tblProductOrder values('PR-AOOO15','OI-10010');
        insert into tblProductOrder values('PR-AOOO16','OI-10011');