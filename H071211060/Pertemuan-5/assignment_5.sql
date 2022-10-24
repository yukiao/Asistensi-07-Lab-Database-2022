USE classicmodels;
-- NOMOR 1
select * FROM customers;
SELECT * FROM orders;

SELECT c.customerName, c.creditLimit, o.`status`, o.comments
FROM customers AS c
JOIN orders AS o
ON c.customerNumber = o.customerNumber
WHERE o.`status` = 'On Hold' AND o.comments LIKE '%credit limit%';

-- NOMOR 2
SELECT * FROM products;

SELECT c.customerName, o.`status`, o.comments
FROM customers AS c
JOIN orders AS o
ON c.customerNumber = o.customerNumber
WHERE o.comments LIKE '%dhl%';

-- NOMOR 3

SELECT distinct c.customerName, pr.productName, o.`status`, o.orderDate
FROM customers AS c
JOIN payments AS p
ON c.customerNumber = p.customerNumber
JOIN orders AS o
ON c.customerNumber = o.customerNumber
JOIN orderdetails AS od
ON o.orderNumber = od.orderNumber
JOIN products AS pr
ON od.productCode = pr.productCode
WHERE pr.productName LIKE '%Ferrari%'
ORDER BY o.orderDate DESC

-- NOMOR 4
INSERT  INTO orders(orderNumber,orderDate,requiredDate,shippedDate, `status`, comments, customerNumber)
SELECT 9999, CURRENT_DATE(), CURRENT_DATE() + INTERVAL 1 YEAR, NULL, 'In Process', NULL, customerNumber FROM customers
WHERE customerName = 'Anton Designs, Ltd.';

SELECT * FROM orders
WHERE orderNumber = '9999';

INSERT INTO orderdetails(orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
SELECT 9999, productCode, '50', MSRP,'20' FROM products
WHERE productName = '1934 Ford V8 Coupe';

SELECT * FROM orderdetails
WHERE orderNumber = '9999';

-- SHOW CREATE TABLE orders
-- INSERT  INTO orders(orderNumber,orderDate,requiredDate,shippedDate, `status`, comments,customerNumber)
-- VALUES ('2022',CURRENT_DATE(),CURRENT_DATE() + INTERVAL 1 YEAR, CURRENT_DATE(),'In Process',NULL,'465');
-- SELECT * FROM orders WHERE customerNumber = '465';
-- 
-- INSERT INTO orderdetails(orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
-- VALUES ('2022', 'S18_2957', '50', '135,59', '20');
-- SELECT * FROM orderdetails WHERE orderNumber = '2022';
-- 
-- SELECT c.customerNumber, c.customerName, o.`status`, o.orderDate, o.shippedDate, od.quantityOrdered, p.productName
-- FROM customers AS c
-- JOIN orders AS o
-- ON c.customerNumber = o.customerNumber
-- JOIN orderdetails AS od
-- ON o.orderNumber = od.orderNumber
-- JOIN products AS p
-- ON od.productCode = p.productCode
-- WHERE c.customerNumber = '465';

