#Nomor 1
SELECT customers.customerName, orders.`status`, orders.comments 
FROM customers
JOIN orders
ON customers.customerNumber = orders.customerNumber
WHERE orders.status = 'On Hold' AND orders.comments LIKE '%credit limit%';

#Nomor 2
SELECT customers.customerName, orders.`status`, orders.comments
FROM customers
JOIN orders
ON customers.customerNumber = orders.customerNumber
WHERE orders.comments LIKE '%DHL%';

#Nomor 3
SELECT * FROM products
SELECT customers.customerName, products.productName, orders.`status`, orders.shippedDate
FROM customers
JOIN orders
ON customers.customerNumber = orders.customerNumber
JOIN orderdetails
ON orders.orderNumber= orderdetails.orderNumber
JOIN products
ON orderdetails.productCode = products.productCode
WHERE products.productName LIKE '%ferrari%'
ORDER BY orders.shippedDate DESC;

#Nomor 4
SELECT * FROM customers WHERE customerName LIKE '%Anton Designs%';
SELECT * FROM orders
INSERT INTO orders (orderNumber, orderDate, requiredDate, shippedDate, STATUS, comments, customerNumber)
VALUES (10426, CURRENT_DATE(), DATE_ADD(CURRENT_DATE(),INTERVAL 1 YEAR), NULL,'In Process', NULL, 465);

SELECT * FROM orderdetails 
SELECT * FROM products
SELECT * FROM products WHERE productName = '1934 Ford V8 Coupe'
INSERT INTO orderdetails(orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
VALUES (10426, 'S18_2957', 50, 62.46, 1);

INSERT INTO orders (orderNumber, orderDate, requiredDate, shippedDate, STATUS, comments, customerNumber)
SELECT 10499, CURRENT_DATE(),  DATE_ADD(CURRENT_DATE(),INTERVAL 1 YEAR), NULL, 'In Process', NULL, customerNumber FROM customers WHERE customerName LIKE 'Anton Designs, Ltd.';

INSERT INTO orderdetails (orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
SELECT 10499, productCode, 50, MSRP, 1 FROM products WHERE productName = '1934 Ford V8 Coupe'
 