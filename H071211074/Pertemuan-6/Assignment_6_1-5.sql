#Nomor 1
SELECT customers.customerName AS 'Nama Pelanggan', SUM(payments.amount) AS 'Total Belanja', 
customers.creditLimit AS 'Batas Kredit', SUM(payments.amount) - creditLimit AS Selisih
FROM customers
JOIN payments
ON customers.customerNumber = payments.customerNumber
GROUP BY customerName
HAVING SUM(payments.amount) > creditLimit
ORDER BY Selisih DESC;

#Nomor 2
SELECT CONCAT (c.customerName, ' : ', c.contactFirstName, ' ', c.contactLastName, '@', c.addressLine1) AS Pelanggan, SUM(o.quantityOrdered) AS 'Jumlah Orderan'
FROM customers AS c
JOIN orders p
ON c.customerNumber = p.customerNumber
JOIN orderdetails AS o
ON p.orderNumber = o.orderNumber
GROUP BY c.customerName
ORDER BY SUM(o.quantityOrdered) DESC  LIMIT 1;

#Nomor 3
SELECT DATE_FORMAT(paymentDate, '%M %Y') AS `Hari Pembayaran`, 
COUNT(customers.customerName) AS 'Jumlah Pelanggan',
GROUP_CONCAT(distinct customerName SEPARATOR ', ') AS 'List Pelanggan', SUM(amount) AS 'Jumlah Pembayaran'
FROM payments
JOIN customers
ON payments.customerNumber = customers.customerNumber
where MONTHNAME(paymentDate) = 'February'
GROUP BY `Hari Pembayaran`
ORDER BY `Jumlah Pembayaran` DESC;

#Nomor 4
SELECT UPPER(p.productName) AS 'Nama Produk',
COUNT(p.buyPrice) AS 'Jumlah di Order',
GROUP_CONCAT(o.orderDate SEPARATOR ',') AS 'Waktu Orderan',
p.buyPrice AS 'Harga Beli',
od.priceEach AS 'Harga Jual',
SUM(od.quantityOrdered) AS 'Total Jumlah Orderan',
CONCAT((od.priceEach * SUM(od.quantityOrdered)), ' - ', 
(p.buyPrice * SUM(od.quantityOrdered)), ' = ', ((od.priceEach * SUM(od.quantityOrdered))-(p.buyPrice * SUM(od.quantityOrdered)))) AS 'Pendapatan - Modal = Keuntungan'
FROM orders AS o 
JOIN orderdetails AS od
ON o.orderNumber = od.orderNumber
JOIN products AS p
ON p.productCode = od.productCode
WHERE p.productName = '2001 Ferrari Enzo'
GROUP BY od.priceEach
HAVING ((od.priceEach * SUM(od.quantityOrdered))-(p.buyPrice * SUM(od.quantityOrdered))) > 5000
ORDER BY ((od.priceEach * SUM(od.quantityOrdered))-(p.buyPrice * SUM(od.quantityOrdered))) DESC;

#Nomor 5
SELECT o.addressLine1 AS Alamat,
CONCAT(LEFT(o.phone, 9), '* ****') AS Phone,
COUNT(DISTINCT e.employeeNumber) AS 'Jumlah Karyawan',
COUNT(DISTINCT c.customerName) AS 'Jumlah Pelanggan',
ROUND(AVG(p.amount), 2) AS 'Rata-rata Penghasilan'
FROM offices AS o
JOIN employees AS e
ON o.officeCode = e.officeCode
left JOIN customers  AS c
ON e.employeeNumber = c.salesRepEmployeeNumber
left JOIN payments AS p
ON c.customerNumber = p.customerNumber
GROUP BY o.officeCode
ORDER BY Phone