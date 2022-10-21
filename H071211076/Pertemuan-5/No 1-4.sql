USE classicmodels
NOMOR 1
SELECT * FROM customers;
SELECT * FROM orders;

SELECT c.customerName, c.creditLimit, o.status, o.comments
FROM customers AS c
JOIN orders AS o
ON c.customerNumber = o.customerNumber
WHERE o.status = 'On Hold' AND o.comments LIKE '%credit limit%';


NOMOR 2
SELECT * FROM products;

SELECT c.customerName, o.status, o.comments
FROM customers AS c
JOIN orders AS o
ON c.customerNumber = o.customerNumber
WHERE o.comments LIKE '%dhl%';
-- 
NOMOR 3
SELECT * FROM customers;
SELECT * FROM payments;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM orderdetails;

SELECT c.customerName, pr.productName, o.status, o.orderDate
FROM customers AS c
JOIN payments AS p
ON c.customerNumber = p.customerNumber
JOIN orders AS o
ON c.customerNumber = o.customerNumber
JOIN orderdetails AS od
ON o.orderNumber = od.orderNumber
JOIN products AS pr
ON od.productCode = pr.productCode
WHERE pr.productName LIKE '%Ferrari%' AND o.status = 'Shipped'
ORDER BY o.orderDate DESC;

NOMOR 4
INSERT INTO orders 
VALUE (10426, CURRENT_DATE(), ADDDATE(CURRENT_DATE(), INTERVAL 1 YEAR), NULL, "In Process", NULL, 465);
                                                                                                                                                                                                                                                                                                                                                                                                                                                        
INSERT INTO orderdetails (orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
VALUES (10426, 'S18_2957', '50', '62.46', '20');

SELECT c.customerName, o.`status`, o.orderDate, o.requiredDate, od.priceEach
FROM orders AS o
JOIN customers AS c
USING (customerNumber)
JOIN orderdetails AS od
USING (orderNumber)
WHERE orderNumber = 10426;

SELECT c.customerName, o.`status`, o.orderDate, o.requiredDate, od.priceEach
FROM orders AS o
JOIN customers AS c
ON c.customerNumber = o.customerNumber
JOIN orderdetails AS od
ON o.orderNumber = od.orderNumber
WHERE od.orderNumber = 10426;