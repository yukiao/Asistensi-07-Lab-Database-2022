-- No 1
SELECT * FROM offices WHERE city = 'San Francisco';

-- No 2
SELECT * FROM orderdetails 
WHERE quantityOrdered > 70
ORDER BY orderLineNumber  ;

-- No 3
SELECT DISTINCT productLine FROM products;

-- No 4
SELECT customerNumber AS 'Nomor Pelanggan', customerName AS 'Nama Pelanggan' FROM customers
WHERE customerNumber BETWEEN '100' AND '150';

-- No 5
SELECT * FROM customers WHERE country <> 'USA' AND creditLimit = '0.0'
ORDER BY customerName
LIMIT 10,10;

-- link Database
-- https://www.mysqltutorial.org/wp-content/uploads/2018/03/mysqlsampledatabase.zip.


