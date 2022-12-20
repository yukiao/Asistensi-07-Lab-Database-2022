-- No. 1
SELECT customerNumber, customerName,
	(SELECT max(amount) FROM payments WHERE customers.customerNumber = payments.customerNumber) AS 'Terbesar',
	(SELECT min(amount) FROM payments WHERE customers.customerNumber = payments.customerNumber) AS 'Terkecil'
FROM customers;

-- No. 2		
SELECT * FROM employees
WHERE officeCode = 
	(SELECT officeCode FROM employees GROUP BY officeCode ORDER BY COUNT(employeeNumber) DESC LIMIT 1)
	
-- No. 3
SELECT productName, productScale FROM products AS b
WHERE EXISTS (
	SELECT * FROM products WHERE b.productName LIKE '%Ford%'
	)
	
-- Nomor 4
SELECT c.customerName AS 'nama pelanggan', 
CONCAT(e.firstName, ' ', e.lastName) AS 'nama karyawan', o.orderNumber, SUM(quantityOrdered * priceEach) AS 'biaya pesanan'
FROM customers AS c
JOIN employees AS e
ON c.salesRepEmployeeNumber = e.employeeNumber
JOIN orders AS o
ON c.customerNumber = o.customerNumber
JOIN orderdetails AS od
ON o.orderNumber = od.orderNumber
WHERE od.orderNumber = 
	(SELECT orderNumber FROM orderdetails GROUP BY orderNumber ORDER BY SUM(quantityOrdered * priceEach) DESC LIMIT 1)
	
-- No. 5
SELECT DISTINCT country, LENGTH(country) AS 'Panjang Karakter Negara'
FROM customers
WHERE LENGTH(country) = 
	(SELECT MAX(LENGTH(country)) FROM customers) || 
LENGTH(country) = 
	(SELECT min(LENGTH(country)) FROM customers)
ORDER BY length(country) DESC 