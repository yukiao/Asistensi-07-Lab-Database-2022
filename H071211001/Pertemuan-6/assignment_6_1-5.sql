USE classicmodels

-- [nomor 1]
-- SELECT * FROM customers
-- SELECT * FROM payments

SELECT customers.customerName AS "Nama Pelanggan", SUM(payments.amount) AS "Total Belanja", customers.creditLimit 
AS "Batas Kredit",
SUM(payments.amount) - customers.creditLimit AS "Selisih"
FROM customers
JOIN payments
ON payments.customerNumber = customers.customerNumber
GROUP BY customers.customerName
HAVING "Total Belanja" > "Batas Kredit"
ORDER BY Selisih DESC

-- [nomor 2]

SELECT CONCAT(customers.customerName, " :", " ", customers.contactFirstName, " ", 
customers.contactLastName, " @", customers.addressLine1) AS "Pelanggan",
SUM(orderdetails.quantityOrdered) AS "Jumlah Orderan"
FROM customers
JOIN orders
ON customers.customerNumber = orders.customerNumber
JOIN orderdetails
ON orders.orderNumber = orderdetails.orderNumber
GROUP BY customers.customerName
ORDER BY "Jumlah Orderan" DESC
LIMIT 1

-- [nomor 3]
SELECT * FROM payments
SELECT * FROM customers

SELECT CONCAT(MONTHNAME(payments.paymentDate), " ", YEAR(payments.paymentDate)) AS "Hari Pembayaran",
COUNT(DISTINCT customers.customerName) AS "Jumlah Pelanggan", GROUP_CONCAT(DISTINCT customers.customerName 
ORDER BY customers.customerName SEPARATOR " , ")
AS "List Pelanggan", SUM(payments.amount) AS "Jumlah Pembayaran"
FROM payments
JOIN customers
ON payments.customerNumber = customers.customerNumber
WHERE MONTH(paymentDate) = "02"
GROUP BY `Hari Pembayaran`
ORDER BY `Jumlah Pembayaran` DESC

-- [nomor 4]
SELECT * FROM products
SELECT * FROM orderdetails;

SELECT UPPER(products.productName) AS "Nama Produk", COUNT(*) AS "Jumlah di order",
GROUP_CONCAT(orders.orderDate ORDER BY orders.orderDate SEPARATOR " , ") AS "Waktu Orderan",
products.buyPrice AS "Harga Beli", orderdetails.priceEach AS "Harga jual", SUM(orderdetails.quantityOrdered) AS "Total jumlah orderan",
CONCAT(SUM(orderdetails.priceEach * orderdetails.quantityOrdered), " - ", SUM(products.buyPrice * orderdetails.quantityOrdered), " = ",
(SUM(orderdetails.priceEach * orderdetails.quantityOrdered)) - (SUM(products.buyPrice * orderdetails.quantityOrdered))) AS "Pendapatan - Modal =Keuntungan"
FROM products 
JOIN orderdetails
ON orderdetails.productCode = products.productCode
JOIN orders
ON orderdetails.orderNumber = orders.orderNumber
WHERE products.productName LIKE "%2001%"
GROUP BY `Harga Jual`
HAVING (SUM(orderdetails.priceEach * orderdetails.quantityOrdered)) - (SUM(products.buyPrice * orderdetails.quantityOrdered)) > 5000
ORDER BY (SUM(orderdetails.priceEach * orderdetails.quantityOrdered)) - (SUM(products.buyPrice * orderdetails.quantityOrdered)) DESC

-- [nomor 5]

SELECT offices.addressLine1 AS "Alamat", REPLACE(offices.phone, RIGHT(offices.phone, 6), "* **") AS "Nomor Telepon", 
COUNT(DISTINCT employees.employeeNumber) AS "Jumlah Karyawan",
COUNT(DISTINCT customers.customerName) AS "Jumlah Pelanggan", ROUND(AVG(payments.amount), 2) AS "Rata-rata Penghasilan"
FROM customers
JOIN employees
ON employees.employeeNumber = customers.salesRepEmployeeNumber
JOIN offices
ON employees.officeCode = offices.officeCode
JOIN payments
ON customers.customerNumber = payments.customerNumber
GROUP BY Alamat
ORDER BY `Nomor Telepon` ASC



























