#Nomor 1
SELECT orders.orderDate
FROM products
JOIN orderdetails
ON products.productCode = orderdetails.productCode
JOIN orders 
ON orderdetails.orderNumber = orders.orderNumber
WHERE productName = '1940 Ford Pickup Truck'
ORDER BY orderDate DESC;


#Nomor 2
SELECT distinct products.productName, orderdetails.priceEach, products.MSRP
FROM products
JOIN orderdetails
ON products.productCode = orderdetails.productCode
WHERE priceEach < (MSRP * 0.8);

#Nomor 3
SELECT ss_mahasiswa.nama, ss_dosen.nama
FROM ss_mahasiswa 
JOIN ss_pembimbing 
ON ss_mahasiswa.id_mahasiswa = ss_pembimbing.id_mahasiswa
JOIN ss_dosen
ON ss_pembimbing.id_pembimbing_utama = ss_dosen.id_dosen
WHERE ss_mahasiswa.nama = 'Sulaeman';

#Nomor 4
-- USE classicmodels
-- ALTER TABLE customers
-- ADD STATUS VARCHAR (10) DEFAULT 'Regular';

-- SELECT * FROM customers

UPDATE customers 
JOIN payments
ON customers.customerNumber = payments.customerNumber
JOIN orders
ON orders.customerNumber = customers.customerNumber
JOIN orderdetails
ON orders.orderNumber = orderdetails.orderNumber
SET customers.status = 'VIP'
WHERE payments.amount > 100000 OR orderdetails.quantityOrdered > 50;

#Nomor 5

SELECT customers.customerNumber, orders.status
FROM customers
JOIN orders
ON customers.customerNumber = orders.customerNumber
WHERE orders.status = 'cancelled';


DELETE customers
FROM customers
JOIN orders
ON customers.customerNumber = orders.customerNumber
WHERE orders.status = 'cancelled';

-- SELECT TABLE_NAME, CONSTRAINT_NAME, referenced_column_name, referenced_table_name
-- FROM information_schema.key_column_usage
-- WHERE TABLE_NAME = 'orders';
-- 
-- ALTER TABLE orders
-- DROP CONSTRAINT orders_ibfk_1;
-- 
-- SELECT TABLE_NAME, CONSTRAINT_NAME, referenced_column_name, referenced_table_name
-- FROM information_schema.key_column_usage
-- WHERE TABLE_NAME = 'payments'; 
-- 
-- ALTER TABLE payments
-- DROP CONSTRAINT payments_ibfk_1;

