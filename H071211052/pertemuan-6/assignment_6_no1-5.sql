USE classicmodels;

nomor 1
SELECT customers.customerName AS 'Nama Pelanggan',SUM(amount) AS  'Total Belanja', customers.creditLimit AS 'Batas Credit',SUM(amount) - customers.creditLimit AS Selisih
FROM customers 
INNER JOIN payments
ON customers.customerNumber = payments.customerNumber
GROUP BY `Nama Pelanggan`
HAVING `Total Belanja` > `Batas Credit`
ORDER BY Selisih DESC;
-- 

Nomor 2
SELECT CONCAT(Customers.customerName, " : ", customers.contactFirstName," ", customers.contactLastName,"@", customers.addressLine1) AS 'Pelanggan',
SUM(quantityOrdered) AS 'Jumlah Orderan' 
FROM customers
JOIN orders
ON  customers.customerNumber = orders.customerNumber
JOIN orderdetails
ON  orders.orderNumber = orderdetails.orderNumber
GROUP BY customers.customerName
ORDER BY SUM(quantityOrdered) DESC LIMIT 1;


Nomor 3
SELECT CONCAT(MONTHNAME(paymentDate),' ',YEAR(paymentDate)) AS 'Hari Pembayaran', 
COUNT(customers.customerNumber) AS 'Jumlah Pelanggan',
GROUP_CONCAT(DISTINCT customers.customerName SEPARATOR ", ") AS 'List Pelanggan', 
SUM(payments.amount) AS 'Jumlah Pembayaran' 
FROM customers
JOIN payments
ON  customers.customerNumber = payments.customerNumber
GROUP BY  `Hari Pembayaran`
HAVING `Hari Pembayaran` LIKE "%February%" ORDER BY `Jumlah Pembayaran` DESC;

nomor 4
SELECT UPPER(Products.productname) AS 'Nama Produk',COUNT(orderdetails.orderNumber) AS "Jumlah di Order", GROUP_CONCAT(orders.orderDate SEPARATOR",") AS "Waktu Orderan", products.buyPrice AS "Harga Beli"
,orderdetails.priceEach AS "Harga Jual", SUM(orderdetails.quantityOrdered) AS "Total Jumlah Orderan",concat((orderdetails.priceEach*SUM(orderdetails.quantityOrdered))," - ",(products.buyPrice*SUM(orderdetails.quantityOrdered))," = ",(orderdetails.priceEach*SUM(orderdetails.quantityOrdered))-(products.buyPrice*SUM(orderdetails.quantityOrdered))) AS "Pendapatan - Modal = Keuntungan"
FROM products
INNER JOIN orderdetails
ON  products.productCode = orderdetails.productCode
INNER JOIN orders
ON orderdetails.orderNumber = orders.orderNumber
GROUP BY orderdetails.priceEach
HAVING `Nama Produk` = "2001 Ferrari Enzo" AND (orderdetails.priceEach*SUM(orderdetails.quantityOrdered))-(products.buyPrice*SUM(orderdetails.quantityOrdered))> 5000 ORDER BY `Jumlah di Order` desc;

 
nomor 5
SELECT offices.addressLine1 AS Alamat, concat(SUBSTRING(offices.phone,1,CHAR_LENGTH(offices.phone) - 6),"* ****") AS "Nomor Telp", COUNT(distinct employees.employeeNumber) AS "Jumlah Karyawan", COUNT(distinct customers.customerName) AS "Jumlah Pelanggan", Round(AVG(payments.amount),2) AS "Rata-rata penghasilan" from offices
LEFT JOIN employees
on  offices.officeCode =  employees.officeCode 
LEFT  JOIN  Customers
on  employees.employeeNumber = customers.salesRepEmployeeNumber
LEFT  JOIN payments
on customers.customerNumber = payments.customerNumber
GROUP BY offices.officeCode; 








