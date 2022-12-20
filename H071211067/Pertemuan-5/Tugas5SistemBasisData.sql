-- No. 1
SELECT c.customerName, o.`status`, o.comments
FROM customers AS c
INNER JOIN orders AS o
ON c.customerNumber = o.customerNumber
WHERE o.`status` = "On Hold" && o.comments LIKE "Customer credit limit%";

-- No. 2
SELECT c.customerName, o.`status`, o.comments
FROM customers AS c
INNER JOIN orders AS o
ON c.customerNumber = o.customerNumber 
WHERE o.comments LIKE "%DHL%";

-- No. 3
SELECT c.customerName, p.productName, o.`status`, o.orderDate
FROM customers AS c 
INNER JOIN orders AS o 
ON c.customerNumber = o.customerNumber
INNER JOIN orderdetails AS od 
ON o.orderNumber = od.orderNumber 
INNER JOIN products AS p 
ON od.productCode = p.productCode 
WHERE p.productName LIKE "%Ferrari%" order BY o.orderDate DESC;

-- No. 4
INSERT INTO orders(orderNumber, orderDate, requiredDate, shippedDate, `status`, comments, customerNumber)
VALUES ('10426', CURRENT_DATE(), CURRENT_DATE(), CURRENT_DATE() + INTERVAL 1 YEAR, 'In Process', NULL, '465');
SELECT * FROM orders WHERE customerNumber = '465';

INSERT INTO orderdetails(orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
VALUES ('10426', 'S18_2957', '50', '135.59', '20');
SELECT * FROM orderdetails WHERE orderNumber = '10426';