USE classicmodels;

# No. 1
-- Siapa saja customers yang status pesanannya tertahan karena melebihi batas kredit?
SELECT c.customerName, o.`status`, o.comments
FROM orders AS o
JOIN customers AS c
ON c.customerNumber = o.customerNumber
WHERE o.`status` = 'On Hold' AND o.comments LIKE '%credit limit%';

# No. 2
-- Siapa saja customers yang berkomentar untuk menggunakan jasa pengantaran DHL?
-- Tampilkan nama mereka, status order mereka, serta komentar yang dimaksud
SELECT c.customerName, o.`status`, o.comments
FROM orders AS o
JOIN customers AS c
ON c.customerNumber = o.customerNumber
WHERE o.comments LIKE '%DHL%';

# No. 3
-- Tampilkan semua order mobil bermerk Ferrari pada database classicmodels
-- Tampilkan pula nama customer, nama mobilnya, status order, serta tanggal pengiriman yang berurut dari terkini
SELECT c.customerName,  p.productName, o.`status`, o.shippedDate
FROM orders AS o
JOIN customers AS c
ON c.customerNumber = o.customerNumber
JOIN orderdetails AS od
ON o.orderNumber = od.orderNumber
JOIN products AS p
ON od.productCode = p.productCode
WHERE p.productName LIKE '%Ferrari%'
ORDER BY o.shippedDate DESC;

# No. 4
-- Tambah pemesanan
INSERT INTO orders (orderNumber, orderDate, requiredDate, `status`, customerNumber)
SELECT 12346, CURRENT_DATE, ADDDATE(CURRENT_DATE, INTERVAL 1 YEAR), 'In Process', customerNumber
FROM customers
WHERE customerName = 'Anton Designs, Ltd.'; 

INSERT INTO orderdetails (orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
SELECT 12346, productCode, 50, MSRP, 1
FROM products
WHERE productName = '1934 Ford V8 Coupe';

-- Tampilkan pemesanan
SELECT
o.orderNumber, c.customerName, od.quantityOrdered, p.productName,
od.priceEach, p.MSRP, o.orderDate, o.requiredDate, o.status
FROM orders as o
JOIN orderdetails AS od
ON o.orderNumber = od.orderNumber
JOIN customers AS c
ON c.customerNumber = o.customerNumber
JOIN products AS p
ON od.productCode = p.productCode
WHERE c.customerName LIKE 'Anton%';
