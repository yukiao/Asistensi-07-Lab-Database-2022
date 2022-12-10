SELECT * FROM orders;
-- nomor [1]
SELECT customers.customerName, orders.`status`, orders.comments
FROM customers
INNER JOIN orders
ON customers.customerNumber = orders.customerNumber
WHERE orders.comments LIKE '%credit limit exceeded%' and orders.status LIKE '%On Hold%';

SELECT DISTINCT customers.customerName, orders.`status`, orders.comments
FROM customers
INNER JOIN orders
ON customers.customerNumber = orders.customerNumber

-- nomor [2]
SELECT customers.customerName, orders.`status`, orders.comments
FROM customers
INNER JOIN orders
ON customers.customerNumber = orders.customerNumber
WHERE orders.comments LIKE '%DHL%';

-- nomor [3]
SELECT products.productName, customers.customerName, orders.status, orders.shippedDate
FROM products
JOIN orderdetails
USING(productCode)
JOIN orders
USING(orderNumber)
JOIN customers\

USING(customerNumber)
WHERE products.productName LIKE '%Ferrari%' ORDER BY shippedDate DESC;

-- nomor [4]
INSERT INTO orders (orderNumber, orderDate, requiredDate, `status`, customerNumber)
SELECT 10426, CURRENT_DATE, DATE_ADD(CURRENT_DATE, INTERVAL 1 YEAR), 'In Process', customerNumber FROM customers
WHERE customerName = 'Anton Designs, Ltd.'; 

SELECT * FROM orders 
WHERE ORDERNUMBER = 10426

INSERT INTO orderdetails (orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
SELECT 10426, productCode, 50, MSRP * 0.8, 1 FROM products
WHERE productName = '1934 Ford V8 Coupe';

SELECT * FROM orderdetails
WHERE ORDERNUMBER = 10426










