
-- no 1
-- Tampilkan kolom tanggal pemesanan product dalam urutan
-- menurun untuk pesanan Ford Pickup Truck 1940. (database classicmodels)
SELECT products.productName, orders.orderDate
FROM products
inner JOIN orderdetails ON products.productCode= orderdetails.productCode
inner JOIN orders ON orders.orderNumber = orderdetails.orderNumber
WHERE products.productCode = 'S18_1097'
ORDER BY orderdate DESC;

-- no 2
-- tampilkan daftar nama product yang dijual dengan harga kurang dari
-- 80% dari MSRP (Harga Ecrean Yang Disarankan). (database classiscmodels)
SELECT distinct products.productName, orderdetails.priceEach, products.MSRP
FROM products
INNER JOIN orderdetails
ON products.productCode = orderdetails.productCode
WHERE orderdetails.priceEach < (0.8 * MSRP);


-- no 3
-- Tampilkan pembimbing utama dari mahasiswa bernama Sulaeman. (database appseminar)
SELECT ss_mahasiswa.nama AS 'nama mahasiswa', ss_dosen.nama AS 'nama pembimbing utama'
FROM ss_dosen
INNER JOIN ss_pembimbing ON ss_dosen.id_dosen = ss_pembimbing.id_pembimbing_utama
INNER JOIN ss_mahasiswa ON ss_mahasiswa.id_mahasiswa = ss_pembimbing.id_mahasiswa
WHERE ss_mahasiswa.nama = 'sulaeman';

-- no 4
-- poin pertama 
-- Buatlah kolom baru dengan nama status yang bertipe data varchar pada tabel customers
-- poin ketiga
-- sisanya isi dengan nilai 'Regular'
 ALTER TABLE customers
 ADD STATUS VARCHAR (10) DEFAULT 'Regular';

-- poin kedua
-- Kemuadian isi dengan nilai'VIP' untuk pelanggan yang jumlah pembayarannya pernah
-- diatas 100.000 atau pernah mengorder barang dengan kuantitas 50 ke atas

UPDATE customers
INNER JOIN payments 
ON customers.customerNumber = payments.customerNumber
INNER JOIN orders
ON orders.customerNumber = customers.customerNumber
INNER JOIN orderdetails
ON orderdetails.orderNumber = orders.orderNumber
SET customers.`status` = 'VIP'
WHERE payments.amount > 100000 OR orderdetails.quantityOrdered > 50;

SELECT customers.customerNumber, customers.status, payments.amount, orderdetails.quantityOrdered
FROM customers
INNER JOIN payments
ON customers.customerNumber = payments.customerNumber
INNER JOIN orders
ON orders.customerNumber = customers.customerNumber
INNER JOIN orderdetails
ON orderdetails.orderNumber = orders.orderNumber;


-- no 5
-- hapuslah semua data pelanggan yang pernah membatalkan pesanannya
SELECT TABLE_NAME, CONSTRAINT_NAME, referenced_column_name, referenced_table_name
FROM information_schema.key_column_usage
WHERE TABLE_NAME ='orders';

SELECT TABLE_NAME, CONSTRAINT_NAME, referenced_column_name, referenced_table_name
FROM information_schema.key_column_usage
WHERE TABLE_NAME ='payments';

ALTER TABLE orders
DROP CONSTRAINT orders_ibfk_1;

ALTER TABLE payments
DROP CONSTRAINT payments_ibfk_1;

DELETE customers
FROM customers
INNER JOIN orders
ON customers.customerNumber = orders.customerNumber
WHERE orders.`status` = 'cancelled';

SELECT customers.customerNumber, orders.`status`
FROM customers
INNER JOIN orders
ON customers.customerNumber = orders.customerNumber
WHERE orders.`status` = 'cancelled';






-- ALTER TABLE orders
-- ADD constraint orders_ibfk_1
-- FOREIGN KEY (customerNumber)
-- REFERENCES customers (customerNumber)
-- ON DELETE CASCADE ON UPDATE NO ACTION ;







