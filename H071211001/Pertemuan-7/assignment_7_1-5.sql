USE classicmodels

-- [nomor 1]
SELECT customerName AS 'Pengguna', MAX(p.amount) AS 'Pembayaran Terbesar', MIN(p.amount) AS 'Pembayaran Terkecil'
FROM payments p
INNER JOIN customers c ON c.customerNumber = p.customerNumber
WHERE c.customerName IN (
	SELECT customerName FROM customers)
	GROUP BY customerName;

-- [nomor 2]
SELECT officeCode, employeeNumber, CONCAT(firstName, ' ', lastName) AS 'Employee'  FROM employees
WHERE officeCode = (
	SELECT officeCode FROM (
		SELECT officeCode, COUNT(officeCode) AS 'Employee' FROM employees
		GROUP BY officeCode
		ORDER BY `Employee` DESC
		LIMIT 1) AS O);

-- [nomor 3]
SELECT * FROM products

SELECT productName, productScale 
FROM products
WHERE productName IN (
	SELECT productName FROM products WHERE productName LIKE "%Ford%");
    
-- [nomor 4]
SELECT cName AS `Nama Pelanggan`, CONCAT(fName, ' ', lName) AS `Nama Karyawan`, oNumber AS `Nomor Pesanan`, 
pAmount AS `Biaya Pesanan`
FROM (SELECT customers.customerName AS cName, employees.firstName AS fName, employees.lastName AS lName,
orderdetails.orderNumber AS oNumber, SUM(orderdetails.quantityOrdered * orderdetails.priceEach) AS pAmount
FROM orderdetails
INNER JOIN orders
ON orderdetails.orderNumber = orders.orderNumber
INNER JOIN customers
ON orders.customerNumber = customers.customerNumber
INNER JOIN employees
ON customers.salesRepEmployeeNumber = employees.employeeNumber
GROUP BY orderdetails.orderNumber
ORDER BY SUM(orderdetails.quantityOrdered * orderdetails.priceEach) DESC
LIMIT 1) AS t;

    
-- [nomor 5]
SELECT DISTINCT country, LENGTH(country) AS 'lengthName' 
FROM customers
WHERE LENGTH(country) = (
	SELECT MAX(LENGTH(country)) AS 'Terpanjang' FROM customers)
    OR LENGTH(country) = (SELECT MIN(LENGTH(country)) AS 'Terpendek' FROM customers)
ORDER BY lengthName DESC;
\\\\\\\\\\\











































































































































































































