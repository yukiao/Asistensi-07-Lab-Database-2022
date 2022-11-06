-- no 1
-- Siapa saja customers yang status pesanannya tertahan karena melebihi batas kredit?
SELECT customers.customerName, orders.`status`, orders.comments
FROM customers
INNER JOIN orders
ON customers.customerNumber = orders.customerNumber
WHERE  orders.STATUS ='On Hold' and orders.comments LIKE '%credit limit%';

-- no 2
-- Siapa saja customers yang berkomentar untuk menggunakan jasa pengantaran
-- DHL? Tampilkan nama mereka, status order mereka, serta komentar yang dimaksud.
SELECT customers.customerName, orders.`status`, orders.comments
FROM customers
INNER JOIN orders
ON customers.customerNumber = orders.customerNumber
WHERE comments LIKE '%DHL%';

-- no 3
-- Tampilkan semua order mobil bermerk Ferrari pada database classicmodels!
-- Tampilkan pula nama customer, nama mobilnya, status order, serta tanggal
-- pengiriman yang berurut dari terkini.
SELECT customers.customerName, products.productName, orders.`status`, orders.shippedDate
FROM customers
INNER JOIN orders
ON customers.customerNumber = orders.customerNumber
INNER JOIN orderdetails
ON orders.orderNumber = orderdetails.orderNumber
INNER JOIN products
ON orderdetails.productCode = products.productCode
WHERE products.productName LIKE '%Ferrari%'
ORDER BY shippedDate DESC;

-- no 4
-- Anton Designs, Ltd. memesan sebanyak 50 mobil “1934 Ford V8 Coupe”. Masukkan
-- data pemesanan ke database, dengan ketentuan tambahan:
-- a. Status order = In Process
-- b. Tanggal order = gunakan fungsi untuk mendapatkan tanggal sekarang
-- c. Deadline pengiriman = satu tahun dari sekarang
-- d. Mobil akan dijual kembali dengan harga yang sama dengan harga eceran resmi/Harga retail

INSERT INTO orders (orderNumber, orderDate, requiredDate, shippedDate, STATUS, comments, customerNumber)
SELECT 10428, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 1 YEAR), NULL, 'In Process', NULL, customerNumber
FROM customers
WHERE customerName = 'Anton Designs, Ltd.';

INSERT INTO orderdetails (orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
SELECT 10426, productCode, 50, MSRP, 7
FROM products
WHERE productName = '1934 Ford V8 Coupe';

SELECT * FROM orderdetails



