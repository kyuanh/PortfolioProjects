DROP SCHEMA IF EXISTS project_nnh;
CREATE SCHEMA project_nnh;
USE project_nnh;

-- Department Table
CREATE TABLE dept_nnh (
	DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50)
    );

-- Commission Table
CREATE TABLE comm_nnh (
	CommClass VARCHAR(5) PRIMARY KEY,
    CommRate DECIMAL(5,2)
    );

-- Sales Rep Table 
CREATE TABLE salesrep_nnh (
	SalesRepID INT PRIMARY KEY,
    SalesRepFName VARCHAR(50),
    SalesRepLName VARCHAR(50),
    CommClass VARCHAR(5),
    DeptID INT,
    FOREIGN KEY (CommClass) REFERENCES comm_nnh(CommClass),
    FOREIGN KEY (DeptID) REFERENCES dept_nnh(DeptID)
    );
    
-- Customer Table
CREATE TABLE customer_nnh (
	CustID VARCHAR(5) PRIMARY KEY,
    CustFName VARCHAR(50),
    CustLName VARCHAR(50),
    Phone VARCHAR(50),
    SalesRepID INT,
    FOREIGN KEY (SalesRepID) REFERENCES salesrep_nnh(SalesRepID)
    );

-- Order Table
CREATE TABLE order_nnh (
	OrderID INT PRIMARY KEY,
    OrderDate DATE,
    CustID VARCHAR(5),
    FOREIGN KEY (CustID) REFERENCES customer_nnh(CustID)
    );

-- Product Category Table
CREATE TABLE prodcat_nnh (
	ProdCatID INT PRIMARY KEY,
    ProdCatName VARCHAR(50)
    );
 
-- Product Table  
CREATE TABLE product_nnh(
	ProdID INT PRIMARY KEY,
    ProdName VARCHAR(50),
    ProdCatID INT,
    ProdPrice DECIMAL(5,2),
    FOREIGN KEY (ProdCatID) REFERENCES prodcat_nnh(ProdCatID)
    );
    
-- Order Detail Table
CREATE TABLE orderdetail_nnh (
	OrderID INT,
    ProdID INT,
    ProdQty INT,
    ProdPrice DECIMAL(6,2),
    PRIMARY KEY (OrderID, ProdID),
    FOREIGN KEY (OrderID) REFERENCES order_nnh (OrderID),
    FOREIGN KEY (ProdID) REFERENCES product_nnh(ProdID)
    );

-- Describe statement for each table

DESC dept_nnh;
DESC comm_nnh;
DESC salesrep_nnh;
DESC customer_nnh;
DESC order_nnh;
DESC prodcat_nnh;
DESC product_nnh;
DESC orderdetail_nnh;



    