#1
-- Menggunakan database classicmodels tampilkan nama pelanggan yang total
-- belanjanya melebihi kredit limit, serta tampilkan selisih total belanja dengan kredit
-- limit, kemudian urutkan berdasarkan selisih tersebut secara menurun.
SELECT c.customerName AS `Nama Pelanggan`, sum(p.amount) AS `Total Belanja`, 
c.creditLimit AS `Batas Kredit`, sum(p.amount)-c.creditLimit AS `Selisih`
FROM customers AS c
INNER JOIN payments AS p
ON c.customerNumber = p.customerNumber
GROUP BY c.customerNumber
HAVING `Total Belanja` > c.creditLimit
ORDER BY Selisih DESC; 
#2
-- Siapa customer yang total pembelian barangnya terbanyak (dihitung dari quantity
-- bukan price
SELECT CONCAT(c.customerName," : ",c.contactFirstName, " ", c.contactLastName, "@", 
c.addressLine1 ) AS `Pelanggan`,
sum(od.quantityOrdered) AS `Jumlah Orderan`
FROM customers AS c
JOIN orders AS o
ON c.customerNumber = o.customerNumber
JOIN orderdetails AS od
ON o.orderNumber = od.orderNumber
GROUP BY c.customerName
ORDER BY `Jumlah Orderan` DESC 
LIMIT 1;

#3
--  Tampilkan jumlah dan list pelanggan, serta jumlah pembayaran untuk pembayaran
-- yang dilakukan pada bulan februari setiap tahunnya.
-- koreksi ada kesalahan output soal no 3, trus ini di order berdasarkan jumlah pembayaran, dan list pelanggan unik
SELECT CONCAT(MONTHNAME(p.paymentDate)," ", YEAR(p.paymentDate)) AS `Hari Pembayaran`,
COUNT(c.customerName) AS `Jumlah Pelanggan`, 
GROUP_CONCAT(c.customerName ORDER BY c.customerName) AS `List Pelanggan`, sum(p.amount) AS `Jumlah Pembayaran`
FROM customers AS c
JOIN payments AS p
ON c.customerNumber = p.customerNumber
WHERE MONTHNAME(p.paymentDate)  LIKE 'Feb%'
GROUP BY `Hari Pembayaran`
ORDER BY `Jumlah Pembayaran` DESC 

#4
-- Tampilkan informasi jumlah orderan serta keuntungan untuk penjualan 2001 Ferrari Enzo yang keuntungannya 
-- lebih besar dari 5000.
-- Berikut ketentuan outputnya:
-- a. Nama Produk dalam huruf kapital
-- b. Jumlah di Order
-- c. Waktu Orderan dipisah dengan Comma
-- d. Harga Beli
-- e. Harga Jual
-- f. Total Kuantitas Orderan
-- g. Serta Keuntungan bersih yang diperoleh
SELECT UPPER(r.productName) AS `Nama Produk`, COUNT(o.orderDate) AS `Jumlah Di Order`, 
GROUP_CONCAT(o.orderDate) AS `Waktu Orderan`, 
r.buyPrice AS `Harga Beli`, d.priceEach AS `Harga Jual`, SUM(d.quantityOrdered) AS `Total Jumlah Orderan`, 
CONCAT(SUM(d.priceEach*d.quantityOrdered), " - ", SUM(r.buyPrice*d.quantityOrdered), " = ", 
(SUM(d.priceEach*d.quantityOrdered))-(SUM(r.buyPrice*d.quantityOrdered))) AS `Pendapatan - Modal = Keuntungan`
FROM products AS r
JOIN orderdetails AS d
ON d.productCode = r.productCode
JOIN orders AS o
ON d.orderNumber = o.orderNumber
WHERE r.productName LIKE "%2001%"
GROUP BY `Harga Jual`
HAVING (SUM(d.priceEach*d.quantityOrdered))-(SUM(r.buyPrice*d.quantityOrdered)) >5000
ORDER BY (SUM(d.priceEach*d.quantityOrdered))-(SUM(r.buyPrice*d.quantityOrdered)) DESC 

#5
-- Tampilkan alamat pertama dari tiap kantor, no telp yang 5 angka terakhirnya
-- disamarkan, jumlah karyawan, jumlah pelanggan yang pernah dilayani, serta
-- rata-rata penghasilan.
SELECT o.addressLine1 AS `Alamat`, REPLACE(o.phone, RIGHT(o.phone, 6), '* ****') AS `Nomor Telepon`, 
COUNT(DISTINCT e.employeeNumber) AS `Jumlah Karyawan`, COUNT(DISTINCT c.customerNumber) AS `Jumlah Pelanggan`, 
ROUND(AVG(p.amount), 2) AS `Rata-rata Penghasilan`
FROM offices AS o
left JOIN employees AS e
ON e.officeCode = o.officeCode
left JOIN customers AS c
ON e.employeeNumber = c.salesRepEmployeeNumber
left JOIN payments AS p
ON c.customerNumber = p.customerNumber
GROUP BY Alamat
ORDER BY `Nomor Telepon`




