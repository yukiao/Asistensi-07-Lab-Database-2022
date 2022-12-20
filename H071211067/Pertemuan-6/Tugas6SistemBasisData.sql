-- No. 1
SELECT c.customerName AS "Nama Pelanggan", sum(p.amount) AS "Total Belanja", c.creditLimit AS "Batas Kredit", (sum(p.amount) - c.creditLimit) AS "Selisih"
FROM customers AS c
INNER JOIN payments AS p
ON c.customerNumber = p.customerNumber
GROUP BY c.customerNumber
ORDER BY (sum(p.amount) - c.creditLimit) DESC
LIMIT 5

-- No. 2 
SELECT GROUP_CONCAT(c.customerName, " : ", c.contactFirstName, " ", c.contactLastName, c.addressLine1) AS "Pelanggan", SUM(od.quantityOrdered) AS "Jumlah Orderan"
FROM customers AS C
INNER JOIN orders AS o
ON c.customerNumber = o.customerNumber
INNER JOIN orderdetails AS od
ON o.orderNumber = od.orderNumber
GROUP BY c.customerName
ORDER BY SUM(od.quantityOrdered) DESC LIMIT 1

-- No. 3
SELECT p.paymentDate, CONCAT(MONTHNAME(p.paymentDate), ' ', YEAR(p.paymentDate)) AS 'Hari Pembayaran', COUNT(DISTINCT c.customerName) AS 'Jumlah Pelanggan',
GROUP_CONCAT(DISTINCT c.customerName SEPARATOR ', ') AS 'List Pelanggan', SUM(p.amount) AS 'Jumlah Pembayaran'
FROM customers AS c
JOIN payments AS p
USING (customerNumber)
GROUP BY `Hari Pembayaran`
HAVING `Hari Pembayaran` LIKE 'Feb%'
ORDER BY `Jumlah Pembayaran` DESC;

-- No. 4
SELECT UPPER(p.productName) AS 'Nama Produk', count(od.orderLineNumber) AS 'Jumlah di Order',
GROUP_CONCAT(o.orderDate SEPARATOR ', ') AS 'Waktu Orderan', p.buyPrice AS 'Harga Beli',
od.priceEach AS 'Harga Jual', SUM(od.quantityOrdered) AS 'Total Jumlah Orderan',
CONCAT(
((sum(od.quantityOrdered)*od.priceEach)), ' - ',
(p.buyPrice*(sum(od.quantityOrdered))), ' = ',
(((sum(od.quantityOrdered)*od.priceEach)) - (p.buyPrice*(sum(od.quantityOrdered))))
) AS 'Pendapatan - Modal = Keuntungan'
FROM products p
JOIN orderdetails od
ON od.productCode = p.productCode
JOIN orders o
ON o.orderNumber = od.orderNumber
WHERE p.productName = '2001 Ferrari Enzo'
GROUP BY priceEach
HAVING (((sum(od.quantityOrdered)*od.priceEach)) - (p.buyPrice*(sum(od.quantityOrdered)))) > 5000
ORDER BY (((sum(od.quantityOrdered)*od.priceEach)) - (p.buyPrice*(sum(od.quantityOrdered)))) DESC;

-- No. 5
SELECT ofc.addressLine1 AS 'Alamat', REPLACE(ofc.phone, RIGHT(ofc.phone, 5), ' * ****') AS 'Nomor Telepon',
COUNT(DISTINCT e.employeeNumber) AS 'Jumlah Karyawan', COUNT(DISTINCT c.customerNumber) AS 'Jumlah Pelanggan',
ROUND(AVG(p.amount), 2) AS 'Rata-Rata Penghasilan'
FROM offices ofc
JOIN employees e
ON ofc.officeCode = e.officeCode
JOIN customers c
ON c.salesRepEmployeeNumber = e.employeeNumber
JOIN payments p
ON p.customerNumber = c.customerNumber
GROUP BY ofc.officeCode