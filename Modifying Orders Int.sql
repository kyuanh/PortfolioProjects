-- P1 Q4
SELECT *
FROM customer_nnh;

INSERT INTO customer_nnh (CustID, CustFName, CustLName, Phone, SalesRepID) VALUES ('T104', 'Wes', 'Thomas', '469-555-1215', 22);

-- P1 Q5
SELECT *
FROM product_nnh;

INSERT INTO product_nnh (ProdID, ProdName, ProdCatID, ProdPrice) VALUES (246, 'Milwaukee Power Drill', 2, 179.00);

-- P1 Q6
SELECT *
FROM order_nnh;

SELECT MAX(OrderID) + 1 AS 'New OrderID'
FROM order_nnh;

INSERT INTO order_nnh (OrderID, OrderDate, CustID) VALUES (110, '2022-01-28', 'T104');

SELECT *
FROM orderdetail_nnh;

INSERT INTO orderdetail_nnh (OrderID, ProdID, ProdQty, ProdPrice) VALUES (110, 618, 1, (SELECT ProdPrice FROM product_nnh WHERE ProdID = 618));
INSERT INTO orderdetail_nnh (OrderID, ProdID, ProdQty, ProdPrice) VALUES (110, 407, 2, (SELECT ProdPrice FROM product_nnh WHERE ProdID = 407));
INSERT INTO orderdetail_nnh (OrderID, ProdID, ProdQty, ProdPrice) VALUES (110, 124, 1, (SELECT ProdPrice FROM product_nnh WHERE ProdID = 124));

-- P1 Q7
SELECT *
FROM order_nnh;

SELECT MAX(OrderID) + 1 AS 'New OrderID'
FROM order_nnh;

INSERT INTO order_nnh (OrderID, OrderDate, CustID) VALUES (111, '2022-01-29', 'S100');

SELECT *
FROM orderdetail_nnh;

INSERT INTO orderdetail_nnh (OrderID, ProdID, ProdQty, ProdPrice) VALUES (111, 535, 3, (SELECT ProdPrice FROM product_nnh WHERE ProdID = 535));
INSERT INTO orderdetail_nnh (OrderID, ProdID, ProdQty, ProdPrice) VALUES (111, 246, 1, (SELECT ProdPrice FROM product_nnh WHERE ProdID = 246));
INSERT INTO orderdetail_nnh (OrderID, ProdID, ProdQty, ProdPrice) VALUES (111, 610, 1, (SELECT ProdPrice FROM product_nnh WHERE ProdID = 610));

-- P1 Q8
SELECT *
FROM customer_nnh;

UPDATE customer_nnh
SET Phone = '817-555-8918'
WHERE CustID = 'B200';

COMMIT;

-- P2 Q1
SELECT *
FROM comm_nnh;

SELECT 
	CONCAT(s.SalesRepFName, ' ', s.SalesRepLName) AS 'SalesRep Name',
	s.SalesRepID AS 'Sales Rep ID',
    s.CommClass AS 'Commisson Class',
    c.CommRate AS 'Commission Rate'
FROM salesrep_nnh s
JOIN comm_nnh c ON s.CommClass = c.CommClass
ORDER BY s.SalesRepLName ASC;

-- P2 Q2
SELECT 
	OrderID AS 'Order ID',
	ProdID AS 'Product ID',
	ProdQty AS 'Qty',
    CONCAT('$',FORMAT(ProdPrice,2)) AS 'Price'
FROM orderdetail_nnh
ORDER BY OrderID, ProdID ASC;

-- P2 Q3
SELECT
	c.CustID AS 'CustID',
    c.CustFName AS 'CustFirstName',
    c.CustLName AS 'CustLastName',
    CONCAT('(', SUBSTR(c.Phone, 1,3), ')', SUBSTR(c.Phone, 4,3), '-', SUBSTR(c.Phone, 7, 4)) AS  'CustPhone',
    s.SalesRepID AS 'SalesRepID',
    s.SalesRepFName AS 'SalesRepFirstName',
    s.SalesRepLName AS 'SalesRepLastName'
FROM customer_nnh c
JOIN salesrep_nnh s ON c.SalesRepID = s.SalesRepID
ORDER BY c.CustID ASC;

-- P2 Q4
WITH high_sales AS 
(
	SELECT
		s.DeptID,
		MAX(c.CommRate) AS 'MaxRate'
	FROM salesrep_nnh s
    JOIN comm_nnh c ON s.CommClass = c.CommClass
    GROUP BY s.DeptID
)

SELECT
	d.DeptID AS 'Dept_ID',
    d.DeptName AS 'Dept_Name',
    s.SalesRepID AS 'Sales_Rep_ID',
    s.SalesRepFName AS 'First_Name',
    s.SalesRepLName AS 'Last_Name',
    c.CommClass AS 'Commission_Class',
    c.CommRate AS 'Commission_Rate'
FROM salesrep_nnh s
JOIN comm_nnh c ON c.CommClass = s.CommClass
JOIN dept_nnh d ON d.DeptID = s.DeptID
JOIN high_sales hs ON s.DeptID = hs.DeptID AND c.CommRate = hs.MaxRate
ORDER BY d.DeptID ASC;

-- P2 Q5
SELECT
	p.ProdID AS 'Product_ID',
    p.ProdName AS 'Product_Name',
    pc.ProdCatName AS 'Category',
    CONCAT('$', FORMAT(p.ProdPrice, 2)) AS 'Price'
FROM product_nnh p
JOIN orderdetail_nnh o ON o.ProdID = p.ProdID
JOIN prodcat_nnh pc ON pc.ProdCatID = p.ProdCatID
WHERE p.ProdPrice = (
	SELECT MAX(p2.ProdPrice)
    FROM orderdetail_nnh o2
    JOIN product_nnh p2 ON o2.ProdID = p2.ProdID
    WHERE o2.OrderID = 100
);

-- P2 Q6
SELECT 
	d.DeptName AS 'Dept_Name',
    COUNT(s.SalesRepID) AS 'Sales_Rep_Count'
FROM dept_nnh d 
JOIN salesrep_nnh s ON s.DeptID = d.DeptID
GROUP BY d.DeptName
ORDER BY Sales_Rep_Count;
    
-- P2 Q7
SELECT
	s.SalesRepID AS 'Sales_Rep_ID',
    s.SalesRepFName AS 'First_Name',
    s.SalesRepLName AS 'Last_Name',
    CONCAT(FORMAT(c.CommRate * 100,0), '%') AS 'Commission_Rate'
FROM salesrep_nnh s
JOIN comm_nnh c ON c.commclass = s.commclass
WHERE c.CommRate >= .05
ORDER BY c.CommRate DESC;

-- P2 Q8
SELECT
	o.OrderID AS 'Order ID',
    DATE_FORMAT(o.OrderDate, '%m/%d/%y') AS 'Order Date',
    o.CustID AS 'Customer ID',
    c.CustFName AS 'Customer First Name',
    c.CustLName AS 'Customer Last Name',
    c.SalesRepID AS 'Sales Rep ID',
    s.SalesRepFName AS 'Sales Rep First Name',
    s.SalesRepLName AS 'Sales Rep Last Name'
    FROM order_nnh o
    JOIN customer_nnh c ON c.CustID = o.CustID
    JOIN salesrep_nnh s ON s.SalesRepID = c.SalesRepID
    ORDER BY o.OrderID;

-- P2 Q9
SELECT
	od.OrderID AS 'OrderID',
    od.ProdID AS 'ProdID',
    p.ProdName AS 'ProdName',
    p.ProdCatID AS 'CatID',
    CONCAT('$', FORMAT(p.ProdPrice, 2)) AS 'Price',
    CONCAT('$', FORMAT(p.ProdPrice * od.ProdQty, 2)) AS 'ExtPrice'
    FROM orderdetail_nnh od
    JOIN product_nnh p ON p.ProdID = od.ProdID
    WHERE od.OrderID = 104;
    
-- P2 Q10
SELECT
	d.DeptID AS 'DeptID',
    d.DeptName AS 'DeptName',
    COUNT(s.SalesRepID) AS 'SalesRepCount',
    CONCAT(FORMAT(AVG(c.CommRate) * 100, 0), '%') AS 'AvgCommRate'
    FROM dept_nnh d
    JOIN salesrep_nnh s ON s.DeptID = d.DeptID
    JOIN comm_nnh c ON c.CommClass = s.CommClass
    GROUP BY d.DeptID
    ORDER BY AvgCommRate;
    
    -- P2 Q11
    SELECT
		s.SalesRepID AS 'SalesRepID',
        s.SalesRepFName AS 'SalesRepFName',
        s.SalesRepLName AS 'SalesRepLName',
        d.DeptName AS 'DeptName',
        s.CommClass AS 'CommissionClass',
        c.CommRate AS 'CommissionRate'
	FROM salesrep_nnh s
	JOIN dept_nnh d ON d.DeptID = s.DeptID
    JOIN comm_nnh c ON c.CommClass = s.CommClass
    ORDER BY s.SalesRepID;
    
    -- P2 Q 12
    SELECT
		s.SalesRepID AS 'SalesRepID',
        CONCAT(s.SalesRepFName, ' ' ,s.SalesRepLName) AS 'SalesRep_Name',
        s.DeptID AS 'DeptID',
        d.DeptName AS 'DeptName'
        FROM salesrep_nnh s
        JOIN dept_nnh d ON d.DeptID = s.DeptID
        JOIN comm_nnh c ON c.CommClass = s.CommClass
        WHERE c.CommClass = 'A'
        ORDER BY d.DeptID, s.SalesRepID;
        
	-- P2 Q13
	SELECT
		c.CustID AS 'CustID',
        c.CustFName AS 'CustFName',
        c.CustLName AS 'CustLName',
        c.SalesRepID AS 'SalesRepID',
        s.SalesRepFName AS 'SalesRepFName',
        s.SalesRepLName AS 'SalesRepLName'
	FROM customer_nnh c
    LEFT JOIN order_nnh o ON o.CustID = c.CustID
    JOIN salesrep_nnh s ON c.SalesRepID = s.SalesRepID
    WHERE o.OrderID is NULL
    ORDER BY c.CustID;
    