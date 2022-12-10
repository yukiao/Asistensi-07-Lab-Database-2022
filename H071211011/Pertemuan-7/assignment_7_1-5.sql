#No 1
-- Perhatikan database classic models. Buatlah query untuk menampilkan 
-- data pembayaran (payment) terkecil dan terbesar untuk masing-masing 
-- pengguna dengan menggunakan subquery. 
SELECT customers.customerNumber AS 'Pengguna', MAX(payments.amount) AS 'Pembayaran terbesar',
MIN(payments.amount) AS 'Pembayaran terkecil'
FROM customers
INNER JOIN payments
ON customers.customerNumber = payments.customerNumber
WHERE payments.amount IN  
(SELECT amount FROM payments)
GROUP BY customers.customerNumber;

#No 2
-- Buatlah query untuk menampilkan seluruh employee yang bekerja di 
-- office dengan employee terbanyak (misalnya office A memiliki paling 
-- banyak employee, maka buatkan daftar employee pada office A) 
SELECT * FROM employees
WHERE officeCode =
	(SELECT officeCode AS `officeCode Terbanyak`
	FROM employees
	GROUP BY officeCode
	HAVING COUNT(officeCode) =
		(SELECT MAX(countEmployee.`Jumlah Employee`) AS `Employee Terbanyak`
		FROM 
			(SELECT officeCode, COUNT(officeCode) AS `Jumlah Employee`
			FROM employees
			GROUP BY officeCode
			) AS countEmployee
		)	
	);

#No 3
-- Buatlah query yang akan menampilkan seluruh product yang di namanya 
-- mengandung kata ‘Ford’ beserta productScale dari product tersebut. 
-- Gunakan subquery untuk menampilkannya. 
SELECT productName, productScale
FROM products
WHERE productName IN  
	(SELECT productName FROM products
	WHERE productName LIKE '%Ford%');
	
#4
-- Siapa nama pelanggan, dan nama karyawan serta berapa nomor pesanan 
-- dan biaya pesanan untuk pesanan yang paling mahal?
SELECT customerName, CONCAT(firstName, " ", lastName) AS `Nama Karyawan`, 
orderdetails.orderNumber, SUM(priceEach*quantityOrdered) AS `Biaya Pesanan Termahal`
FROM employees
JOIN customers
ON customers.salesRepEmployeeNumber=employees.employeeNumber
JOIN  orders
ON customers.customerNumber = orders.customerNumber
JOIN orderdetails
ON orders.orderNumber = orderdetails.orderNumber
GROUP BY orderNumber
HAVING sum(priceEach*quantityOrdered) =
(SELECT MAX(Total.totalBiaya)
 FROM 
 (SELECT sum(priceEach*quantityOrdered) AS totalBiaya
 FROM OrderDetails
 GROUP BY orderNumber
 ) AS Total
);

#5
-- Tampilkan nama negara dan panjang karater negara, dimana 
-- menampilkan dua negara yaitu negara dengan karakter terpanjang dan 
-- negara dengan karakter terpendek
SELECT DISTINCT country, LENGTH(country) AS 'lengthName' 
FROM customers
WHERE LENGTH(country) = (
	SELECT MAX(LENGTH(country)) AS 'Terpanjang' FROM customers)
    OR LENGTH(country) = (SELECT MIN(LENGTH(country)) AS 'Terpendek' FROM customers)
ORDER BY lengthName desc; 


      
