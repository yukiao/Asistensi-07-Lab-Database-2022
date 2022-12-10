no 1
SELECT products.productName, products.productcode, orders.orderDate From products
INNER JOIN orderdetails
ON products.productCode = orderdetails.productCode 
INNER JOIN orders
on  orderdetails.orderNumber = orders.orderNumber
WHERE products.productName = "1940 Ford Pickup Truck" order by orders.orderDate DESC;

 no 2
SELECT products.productName, orderdetails.priceEach, products.MSRP From products
INNER JOIN orderdetails
ON products.productCode = orderdetails.productCode 
WHERE orderdetails.priceEach < 80/100* Products.MSRP;

-- no 3
SELECT ss_mahasiswa.Nama, ss_mahasiswa.id_mahasiswa , ss_pembimbing.id_pembimbing_utama, ss_dosen.nama From ss_mahasiswa
INNER JOIN ss_pembimbing
ON ss_mahasiswa.id_mahasiswa = ss_pembimbing.id_mahasiswa
INNER JOIN ss_dosen
ON ss_pembimbing.id_pembimbing_utama = ss_dosen.id_dosen
WHERE ss_mahasiswa.Nama = 'Sulaeman';


--NO 4
ALTER TABLE customers
ADD COLUMN `Status` varchar(10);
update customers
INNER JOIN payments
ON customers.customerNumber = payments.customerNumber
INNER JOIN orders
ON customers.customerNumber = orders.customerNumber
INNER JOIN orderdetails
ON orders.orderNumber = orderdetails.orderNumber
Set customers.Status = 'VIP'
WHERE payments.amount >= 100000 or orderdetails.quantityOrdered >= 50;

-- melihat daftar customer VIP
SELECT customers.customerName, payments.amount, orderdetails.quantityOrdered, customers.status FROM customers
INNER JOIN payments
ON customers.customerNumber = payments.customerNumber
INNER JOIN orders
ON customers.customerNumber = orders.customerNumber
INNER JOIN orderdetails
ON orders.orderNumber = orderdetails.orderNumber
WHERE payments.amount > 100000 or orderdetails.quantityOrdered >=50;

-- Mengubah yang selain VIP menjadi Regular
Update customers
SET customers.Status = 'Regular'
WHERE customers.Status is NULL;


--NO 5
ALTER TABLE orders DROP FOREIGN KEY `orders_ibfk_1`;
ALTER TABLE orderdetails DROP FOREIGN KEY `orderdetails_ibfk1`;
ALTER TABLE payments DROP FOREIGN KEY `payments_ibfk_1`;
ALTER TABLE customers DROP FOREIGN KEY `customers_ibfk1`;
alter table orderdetails drop foreign key `orderdetails_ibfk_2`;

		
DELETE  customers 
FROM customers	`
JOIN orders 
ON customers.customerNumber = orders.customerNumber
WHERE orders.`status` = "Cancelled";	

DELETE FROM orders WHERE `status` = "Cancelled";

