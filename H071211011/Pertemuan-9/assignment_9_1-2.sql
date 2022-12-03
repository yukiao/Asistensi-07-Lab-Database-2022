-- 1. Dengan menggunakan database “classicmodels”, tambahkan 3 data ke 
-- dalam tabel orders dan orderdetails setelah itu lakukan perintah commit:

START TRANSACTION;

SELECT @orderNumber:=max(orderNumber)+1 FROM orders;
INSERT INTO orders(orderNumber, orderDate, requiredDate, shippedDate, STATUS, customerNumber)
VALUES (@orderNumber, '2022-11-20', '2022-11-30', '2022-11-25', 'In Process', 166);
INSERT INTO orderdetails(orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
VALUES (@orderNumber, 'S10_1678', '20', '110.46', '2');

SELECT @orderNumber:=max(orderNumber)+1 FROM orders;
INSERT INTO orders(orderNumber, orderDate, requiredDate, shippedDate, STATUS, customerNumber)
VALUES (@orderNumber, '2022-10-19', '2022-11-27', '2022-11-23', 'In Process', 124);
INSERT INTO orderdetails(orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
VALUES (@orderNumber, 'S32_1374', '25', '150.55', '6');

SELECT @orderNumber:=max(orderNumber)+1 FROM orders;
INSERT INTO orders(orderNumber, orderDate, requiredDate, shippedDate, STATUS, customerNumber)
VALUES (@orderNumber, '2022-11-10', '2022-11-19', '2022-11-14', 'In Process', 128);
INSERT INTO orderdetails(orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
VALUES (@orderNumber, 'S50_4713', '22', '100.76', '8');

COMMIT;


-- 2. Hapus seluruh data dari tabel orders details dan gunakan perintah 
-- ROLLBACK untuk mengembalikan data tersebut

START TRANSACTION;
DELETE FROM orderdetails;
ROLLBACK;


