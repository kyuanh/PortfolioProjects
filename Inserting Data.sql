SELECT *
FROM dept_nnh;
SELECT *
FROM comm_nnh;
SELECT *
FROM salesrep_nnh;
SELECT *
FROM customer_nnh;
SELECT *
FROM order_nnh;
SELECT *
FROM prodcat_nnh;
SELECT *
FROM product_nnh;
SELECT *
FROM orderdetail_nnh;

-- Department
INSERT INTO dept_nnh (DeptID, DeptName) VALUES (10, 'Store Sales');
INSERT INTO dept_nnh (DeptID, DeptName) VALUES (14, 'Corp Sales');
INSERT INTO dept_nnh (DeptID, DeptName) VALUES (16, 'Web Sales');

SELECT *
FROM dept_nnh;

-- Commmisson
INSERT INTO comm_nnh (CommClass, CommRate) VALUES ('A', 0.1);
INSERT INTO comm_nnh (CommClass, CommRate) VALUES ('B', 0.08);
INSERT INTO comm_nnh (CommClass, CommRate) VALUES ('Z', 0);
INSERT INTO comm_nnh (CommClass, CommRate) VALUES ('C', 0.05);

SELECT *
FROM comm_nnh;

-- Sales Rep
INSERT INTO salesrep_nnh (SalesRepID, SalesRepFName, SalesRepLName, CommClass, DeptID) VALUES (10, 'Alice', 'Jones', 'A', 10);
INSERT INTO salesrep_nnh (SalesRepID, SalesRepFName, SalesRepLName, CommClass, DeptID) VALUES (12, 'Greg', 'Taylor', 'B', 14);
INSERT INTO salesrep_nnh (SalesRepID, SalesRepFName, SalesRepLName, CommClass, DeptID) VALUES (14, 'Sara', 'Day', 'Z', 10);
INSERT INTO salesrep_nnh (SalesRepID, SalesRepFName, SalesRepLName, CommClass, DeptID) VALUES (8, 'Kay', 'Price', 'C', 14);
INSERT INTO salesrep_nnh (SalesRepID, SalesRepFName, SalesRepLName, CommClass, DeptID) VALUES (20, 'Bob', 'Jackson', 'B', 10);
INSERT INTO salesrep_nnh (SalesRepID, SalesRepFName, SalesRepLName, CommClass, DeptID) VALUES (22, 'Micah', 'Moore', 'Z', 16);

SELECT *
FROM salesrep_nnh;

-- Customer
INSERT INTO customer_nnh (CustID, CustFName, CustLName, Phone, SalesRepID) VALUES ('S100', 'John', 'Smith', '214-555-1212', 10);
INSERT INTO customer_nnh (CustID, CustFName, CustLName, Phone, SalesRepID) VALUES ('A120', 'Jane', 'Adams', '817-555-3434', 12);
INSERT INTO customer_nnh (CustID, CustFName, CustLName, Phone, SalesRepID) VALUES ('J090', 'Tim', 'Jones', NULL, 14);
INSERT INTO customer_nnh (CustID, CustFName, CustLName, Phone, SalesRepID) VALUES ('B200', 'Ann', 'Brown', '972-555-1212', 8);
INSERT INTO customer_nnh (CustID, CustFName, CustLName, Phone, SalesRepID) VALUES ('G070', 'Kate', 'Green', '817-555-1034', 20);
INSERT INTO customer_nnh (CustID, CustFName, CustLName, Phone, SalesRepID) VALUES ('S120', 'Nicole', 'Sims', NULL, 22);

SELECT * 
FROM customer_nnh;

-- Order
INSERT INTO order_nnh (OrderID, OrderDate, CustID) VALUES (100, '2022-01-24', 'S100');
INSERT INTO order_nnh (OrderID, OrderDate, CustID) VALUES (101, '2022-01-25', 'A120');
INSERT INTO order_nnh (OrderID, OrderDate, CustID) VALUES (102, '2022-01-25', 'J090');
INSERT INTO order_nnh (OrderID, OrderDate, CustID) VALUES (103, '2022-01-26', 'B200');
INSERT INTO order_nnh (OrderID, OrderDate, CustID) VALUES (104, '2022-01-26', 'S100');
INSERT INTO order_nnh (OrderID, OrderDate, CustID) VALUES (105,'2022-01-26', 'B200');
INSERT INTO order_nnh (OrderID, OrderDate, CustID) VALUES (106,'2022-01-27', 'G070');
INSERT INTO order_nnh (OrderID, OrderDate, CustID) VALUES (107,'2022-01-27', 'J090');
INSERT INTO order_nnh (OrderID, OrderDate, CustID) VALUES (108,'2022-01-27', 'S120');

SELECT *
FROM order_nnh;

-- Product Category Table
INSERT INTO prodcat_nnh (ProdCatID, ProdCatName) VALUES (1, 'Hand Tools');
INSERT INTO prodcat_nnh (ProdCatID, ProdCatName) VALUES (2, 'Power Tools');
INSERT INTO prodcat_nnh (ProdCatID, ProdCatName) VALUES (4, 'Fasteners');
INSERT INTO prodcat_nnh (ProdCatID, ProdCatName) VALUES (6, 'Misc');
INSERT INTO prodcat_nnh (ProdCatID, ProdCatName) VALUES (3, 'Measuring Tools');
INSERT INTO prodcat_nnh (ProdCatID, ProdCatName) VALUES (5, 'Hardware');

SELECT *
FROM prodcat_nnh;

-- Product Table
INSERT INTO product_nnh (ProdID, ProdName, ProdCatID, ProdPrice) VALUES (121, 'BD Hammer', 1, 8.00);
INSERT INTO product_nnh (ProdID, ProdName, ProdCatID, ProdPrice) VALUES (228, 'Makita Power Drill', 2, 65.00);
INSERT INTO product_nnh (ProdID, ProdName, ProdCatID, ProdPrice) VALUES (480, '1# BD Nails', 4, 3.00);
INSERT INTO product_nnh (ProdID, ProdName, ProdCatID, ProdPrice) VALUES (407, '1# BD Screws', 4, 4.25);
INSERT INTO product_nnh (ProdID, ProdName, ProdCatID, ProdPrice) VALUES (610, '3M Duct Tape', 6, 1.75);
INSERT INTO product_nnh (ProdID, ProdName, ProdCatID, ProdPrice) VALUES (618, '3M Masking Tape', 6, 1.25);
INSERT INTO product_nnh (ProdID, ProdName, ProdCatID, ProdPrice) VALUES (380, 'Acme Yard Stick', 3, 1.25);
INSERT INTO product_nnh (ProdID, ProdName, ProdCatID, ProdPrice) VALUES (535, 'Schlage Door Knob', 5, 7.50);
INSERT INTO product_nnh (ProdID, ProdName, ProdCatID, ProdPrice) VALUES (123, 'Acme Pry Bar', 1, 5.00);
INSERT INTO product_nnh (ProdID, ProdName, ProdCatID, ProdPrice) VALUES (229, 'BD Power Drill', 2, 50.00);
INSERT INTO product_nnh (ProdID, ProdName, ProdCatID, ProdPrice) VALUES (124, 'Acme Hammer', 1, 6.50);
INSERT INTO product_nnh (ProdID, ProdName, ProdCatID, ProdPrice) VALUES (235, 'Makita Power Drill', 2, 65.00);


SELECT *
FROM product_nnh;

-- Order Detail Table
INSERT INTO orderdetail_nnh (OrderID, ProdID, ProdQty, ProdPrice) VALUES (100, 121, 2, 8.00);
INSERT INTO orderdetail_nnh (OrderID, ProdID, ProdQty, ProdPrice) VALUES (100, 228, 1, 65.00);
INSERT INTO orderdetail_nnh (OrderID, ProdID, ProdQty, ProdPrice) VALUES (100, 480, 2, 3.00);
INSERT INTO orderdetail_nnh (OrderID, ProdID, ProdQty, ProdPrice) VALUES (100, 407, 1, 4.25);
INSERT INTO orderdetail_nnh (OrderID, ProdID, ProdQty, ProdPrice) VALUES (101, 610, 200, 1.75);
INSERT INTO orderdetail_nnh (OrderID, ProdID, ProdQty, ProdPrice) VALUES (101, 618, 100, 1.25);
INSERT INTO orderdetail_nnh (OrderID, ProdID, ProdQty, ProdPrice) VALUES (102, 380, 2, 1.25);
INSERT INTO orderdetail_nnh (OrderID, ProdID, ProdQty, ProdPrice) VALUES (102, 121, 1, 7.00);
INSERT INTO orderdetail_nnh (OrderID, ProdID, ProdQty, ProdPrice) VALUES (102, 535, 4, 7.50);
INSERT INTO orderdetail_nnh (OrderID, ProdID, ProdQty, ProdPrice) VALUES (103, 121, 50, 7.00);
INSERT INTO orderdetail_nnh (OrderID, ProdID, ProdQty, ProdPrice) VALUES (103, 123, 20, 6.25);
INSERT INTO orderdetail_nnh (OrderID, ProdID, ProdQty, ProdPrice) VALUES (104, 229, 1, 50.00);
INSERT INTO orderdetail_nnh (OrderID, ProdID, ProdQty, ProdPrice) VALUES (104, 610, 200, 1.75);
INSERT INTO orderdetail_nnh (OrderID, ProdID, ProdQty, ProdPrice) VALUES (104, 380, 2, 1.25);
INSERT INTO orderdetail_nnh (OrderID, ProdID, ProdQty, ProdPrice) VALUES (104, 535, 4, 7.50);
INSERT INTO orderdetail_nnh (OrderID, ProdID, ProdQty, ProdPrice) VALUES (105, 610, 200, 1.75);
INSERT INTO orderdetail_nnh (OrderID, ProdID, ProdQty, ProdPrice) VALUES (105, 123, 40, 5.00);
INSERT INTO orderdetail_nnh (OrderID, ProdID, ProdQty, ProdPrice) VALUES (106, 124, 1, 6.50);
INSERT INTO orderdetail_nnh (OrderID, ProdID, ProdQty, ProdPrice) VALUES (107, 229, 1, 59.00);
INSERT INTO orderdetail_nnh (OrderID, ProdID, ProdQty, ProdPrice) VALUES (108, 235, 1, 65.00);

COMMIT;

