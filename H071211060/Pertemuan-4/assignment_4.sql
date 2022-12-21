USE classicmodels;

-- NOMOR 1
SELECT * FROM orders;
SELECT * FROM products;
SELECT * FROM orderdetails;

SELECT P.productName, O.orderDate
FROM products AS P
JOIN orderdetails AS OD
ON P.productCode = OD.productCode
JOIN orders AS O
ON OD.orderNumber = O.orderNumber
WHERE P.productName = '1940 Ford Pickup Truck' ORDER BY orderDate DESC 

-- NOMOR 2
SELECT products.productName, products.productcode, orderdetails.priceEach, products.MSRP 
FROM products 
JOIN orderdetails
ON products.productCode = orderdetails.productCode 
WHERE orderdetails.priceEach < 80/100*(Products.MSRP);

-- Nomor 3
USE appseminar;
SELECT * FROM ss_mahasiswa;
SELECT * FROM ss_pembimbing;
SELECT * FROM ss_dosen;

SELECT M.nama, D.nama
FROM ss_mahasiswa AS M
JOIN ss_pembimbing AS P
ON M.id_mahasiswa = P.id_mahasiswa
JOIN ss_dosen AS D
ON P.id_pembimbing_utama = D.id_dosen
WHERE M.nama = 'Sulaeman';

-- Nomor 4
ALTER TABLE customers
ADD STATUS VARCHAR (10) DEFAULT 'Regular';
-- 
SELECT * FROM customers;
SELECT * FROM payments;
SELECT * FROM payments WHERE amount > 100000;
SELECT * FROM customers WHERE STATUS = 'VIP';

UPDATE customers 
INNER JOIN payments
ON customers.customerNumber = payments.customerNumber
INNER JOIN orders
ON orders.customerNumber = customers.customerNumber
INNER JOIN orderdetails
ON orders.orderNumber = orderdetails.orderNumber
SET customers.status = 'VIP'
WHERE payments.amount > 100000 OR orderdetails.quantityOrdered >= 50;

SELECT customers.customerNumber, customers.status, payments.amount, orderdetails.quantityOrdered
FROM customers
JOIN payments
ON customers.customerNumber = payments.customerNumber
JOIN orders
ON orders.customerNumber = customers.customerNumber
JOIN orderdetails
ON orders.orderNumber = orderdetails.orderNumber;


-- NOMOR 5
ALTER TABLE orderdetails
DROP CONSTRAINT orderdetails_ibfk_1;

ALTER TABLE orderdetails
ADD CONSTRAINT orderdetails_ibfk_1 FOREIGN KEY(OrderNumber) REFERENCES orders(orderNumber)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE orders
DROP CONSTRAINT orders_ibfk_1;

ALTER TABLE orders
ADD CONSTRAINT orders_ibfk_1 FOREIGN KEY(customerNumber) REFERENCES customers(customerNumber)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE payments
DROP CONSTRAINT payments_ibfk_1;

ALTER TABLE Payments
ADD CONSTRAINT payments_ibfk_1 FOREIGN KEY(customerNumber) REFERENCES customers(customerNumber)
ON DELETE CASCADE ON UPDATE CASCADE;

DELETE customers,orders,orderdetails
FROM customers
INNER JOIN Orders
ON customers.customerNumber = orders.customerNumber
INNER JOIN Orderdetails
ON orders.orderNumber = orderdetails.orderNumber
INNER JOIN payments
ON customers.customerNumber = payments.customerNumber
WHERE orders.status = 'Cancelled';

SELECT * FROM orders;
