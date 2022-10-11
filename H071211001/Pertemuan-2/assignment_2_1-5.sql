DESCRIBE offices
-- [nomor 1]
SELECT * FROM offices WHERE city="San Francisco"

-- [nomor 2]
DESCRIBE orderdetails
SELECT * FROM orderdetails WHERE quantityOrdered > 70
ORDER BY orderLineNumber ASC 

-- [nomor 3]
DESCRIBE products
SELECT DISTINCT productLine FROM products

-- [nomor 4]
DESCRIBE customers
SELECT customerNumber AS 'Nomor Pelanggan', customerName AS 'Nama Pelanggan' FROM customers
WHERE customerNumber BETWEEN '100' AND '150'

-- [nomor 5]
DESCRIBE customers
SELECT * FROM customers WHERE country!="USA" AND creditLimit=0
ORDER BY customerName ASC LIMIT 1, 10

