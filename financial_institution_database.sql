-- Modified Bank Management System Database

CREATE TABLE FINANCIAL_INSTITUTION(
institution_ID numeric primary key,
institution_name varchar(20) not null,
head_office_location varchar(20)
); 

INSERT INTO FINANCIAL_INSTITUTION VALUES(011,'HDFC','Marine Drive');
INSERT INTO FINANCIAL_INSTITUTION VALUES(022,'ICICI','Connaught Place');
INSERT INTO FINANCIAL_INSTITUTION VALUES(033,'AXIS','Sector 18');
INSERT INTO FINANCIAL_INSTITUTION VALUES(044,'KOTAK','MG Road');
INSERT INTO FINANCIAL_INSTITUTION VALUES(055,'YES','Bandra West');

SELECT * FROM FINANCIAL_INSTITUTION;
 
CREATE TABLE REGIONAL_OFFICE(
institution_ID numeric,
office_ID numeric primary key,
office_name varchar(20) not null,
office_location varchar(20), 
FOREIGN KEY(institution_ID) REFERENCES FINANCIAL_INSTITUTION
); 

INSERT INTO REGIONAL_OFFICE VALUES(011,501,'Mumbai Central','Dadar East');
INSERT INTO REGIONAL_OFFICE VALUES(022,502,'NCR Hub','Dwarka');
INSERT INTO REGIONAL_OFFICE VALUES(033,503,'Madhya Pradesh','Indore');
INSERT INTO REGIONAL_OFFICE VALUES(044,504,'Karnataka','Whitefield');
INSERT INTO REGIONAL_OFFICE VALUES(055,505,'Northeast','Guwahati');

SELECT * FROM REGIONAL_OFFICE;

CREATE TABLE CUSTOMER_ACCOUNT(
acc_number numeric primary key,
office_ID numeric,
holder_name varchar(20) not null,
acc_category varchar(20) not null,
FOREIGN KEY(office_ID) REFERENCES REGIONAL_OFFICE
); 

INSERT INTO CUSTOMER_ACCOUNT VALUES(701,501,'Priya','Current account');
INSERT INTO CUSTOMER_ACCOUNT VALUES(702,502,'Aditya','Savings account');
INSERT INTO CUSTOMER_ACCOUNT VALUES(703,503,'Kavya','Term deposit');
INSERT INTO CUSTOMER_ACCOUNT VALUES(704,504,'Rohit','Investment account');
INSERT INTO CUSTOMER_ACCOUNT VALUES(705,505,'Sneha','Foreign currency account');

SELECT * FROM CUSTOMER_ACCOUNT;

CREATE TABLE CREDIT_FACILITY(
acc_number numeric,
credit_ID numeric primary key,
borrower_name varchar(20) not null,
credit_category varchar(20) not null,
sanctioned_amount numeric,
FOREIGN KEY(acc_number) REFERENCES CUSTOMER_ACCOUNT
); 

INSERT INTO CREDIT_FACILITY VALUES(701,801,'Priya','Vehicle financing',180000);
INSERT INTO CREDIT_FACILITY VALUES(702,802,'Aditya','Property loan',3500000);
INSERT INTO CREDIT_FACILITY VALUES(703,803,'Kavya','Gold loan',85000);
INSERT INTO CREDIT_FACILITY VALUES(704,804,'Rohit','Study abroad loan',1200000);
INSERT INTO CREDIT_FACILITY VALUES(705,805,'Sneha','Working capital',450000);

SELECT * FROM CREDIT_FACILITY;

CREATE TABLE ACCOUNT_HOLDER(
acc_number numeric,
holder_ID numeric primary key,
full_name varchar(20) not null,
residential_address varchar(500) not null,
FOREIGN KEY(acc_number) REFERENCES CUSTOMER_ACCOUNT
); 

INSERT INTO ACCOUNT_HOLDER VALUES(701,901,'Priya','Flat 305, Orchid Towers');
INSERT INTO ACCOUNT_HOLDER VALUES(702,902,'Aditya','House 42, Green Park');
INSERT INTO ACCOUNT_HOLDER VALUES(703,903,'Kavya','Apartment 8B, Skyline Heights');
INSERT INTO ACCOUNT_HOLDER VALUES(704,904,'Rohit','Villa 15, Palm Grove');
INSERT INTO ACCOUNT_HOLDER VALUES(705,905,'Sneha','Block C-201, River View');

SELECT * FROM ACCOUNT_HOLDER;
