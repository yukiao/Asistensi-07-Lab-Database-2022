#Nomor 1
-- Buatlah query untuk menampilkan data pembayaran (payment) terkecil dan terbesar untuk masing-masing
-- pengguna dengan menggunakan subquery.
SELECT customerNumber, customerName,
	(select max(amount) from payments as p where c.customerNumber = p.customerNumber) as 'Terbesar',
   (select min(amount) from payments as p where c.customerNumber = p.customerNumber) as 'Terkecil'
FROM customers as c
JOIN payments as p
USING (customerNumber)
GROUP BY customerNumber;

#Nomor 2
-- Buatlah query untuk menampilkan seluruh employee yang bekerja di office dengan employee terbanyak 
-- (misalnya office A memiliki paling banyak employee, maka buatkan daftar employee pada office A) 		
SELECT * FROM employees
WHERE officeCode = 
	(SELECT officeCode FROM employees GROUP BY officeCode ORDER BY COUNT(employeeNumber) DESC LIMIT 1);
	
#Nomor 3
-- Buatlah query yang akan menampilkan seluruh product yang di namanya mengandung kata ‘Ford’ 
-- beserta productScale dari product tersebut. Gunakan subquery untuk menampilkannya. 
SELECT productName, productScale FROM products AS b
WHERE EXISTS
	(SELECT * FROM products WHERE b.productName LIKE '%Ford%');
	
#Nomor 4
-- Siapa nama pelanggan, dan nama karyawan serta berapa nomor pesanan dan biaya pesanan 
-- untuk pesanan yang paling mahal?
SELECT customers.customerName AS 'nama pelanggan', 
CONCAT(employees.firstName, ' ', employees.lastName) AS 'nama karyawan', 
orders.orderNumber, SUM(quantityOrdered * priceEach) AS 'biaya pesanan'
FROM customers
JOIN employees
ON customers.salesRepEmployeeNumber = employees.employeeNumber
JOIN orders
ON customers.customerNumber = orders.customerNumber
JOIN orderdetails
ON orders.orderNumber = orderdetails.orderNumber
WHERE orderdetails.orderNumber = 
	(SELECT orderNumber FROM orderdetails GROUP BY orderNumber ORDER BY SUM(quantityOrdered * priceEach) DESC LIMIT 1);
	
#Nomor 5
-- Tampilkan nama negara dan panjang karater negara, dimana menampilkan dua negara yaitu 
-- negara dengan karakter terpanjang dan negara dengan karakter terpendek 
SELECT distinct country, LENGTH(country) AS 'Panjang Karakter Negara'
FROM customers
WHERE LENGTH(country) = 
	(SELECT MAX(LENGTH(country)) FROM customers) OR 
LENGTH(country) = 
	(SELECT min(LENGTH(country)) FROM customers)
ORDER BY length(country) DESC;