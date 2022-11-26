use classicmodels;

-- NO 1
SELECT customers.customerName as 'Nama Pelanggan', 
SUM(amount) as 'Total Belanja', customers.creditLimit as 'Batas Kredit', (SUM(amount)-creditLimit) as 'Selisih'
FROM customers
JOIN payments
on customers.customerNumber = payments.customerNumber
group by customerName
HAVING sum(amount) > customers.creditLimit order by (SUM(amount)-creditLimit)  desc limit 5;

-- No 2
select concat(c.customerName, ' : ', c.contactFirstName, ' ', c.contactLastName, '@', c.addressLine1) as Pelanggan, 
sum(od.quantityOrdered) as 'Jumlah Orderan'
from customers as c
inner join orders as o
on c.customerNumber = o.customerNumber
inner join orderdetails as od
on o.orderNumber = od.orderNumber
group by c.customerName
having sum(od.quantityOrdered) order by sum(od.quantityOrdered) desc limit 1;

-- No 3
SELECT CONCAT((MONTHNAME(paymentDate)), " ",YEAR(paymentDate)) as 'hari pembayaran',
COUNT(customers.customerName) as 'jumlah pelanggan', 
GROUP_CONCAT(customerName ORDER BY customerName ASC) as 'list pelanggan', SUM(payments.amount) as 'jumlah pembayaran'
FROM customers
INNER JOIN payments 
ON customers.customerNumber = payments.customerNumber
WHERE MONTH(paymentdate) = 2
GROUP BY YEAR(paymentDate) ORDER BY SUM(payments.amount)DESC;

-- No 4
select upper(p.productName) as 'nama produk' , count(o.customerNumber) as 'jumlah diorder', 
group_concat(orderDate) as 'waktu orderan', p.buyPrice as 'harga beli', od.priceEach as 'harga jual', 
concat((sum(od.quantityOrdered *od.priceEach)), "-", sum(od.quantityOrdered * p.buyprice), "=", (sum(od.quantityOrdered * od.priceEach)) - sum(od.quantityOrdered * p.buyprice))
AS "pendapatan - modal = keuntungan"
from products as p
inner join orderdetails as od
on p.productCode = od.productCode
inner join orders as o
on od.orderNumber = o.orderNumber
where p.productName =  '2001 Ferrari Enzo'
group by priceEach
having (sum(od.quantityOrdered * od.priceEach)) - sum(od.quantityOrdered * p.buyprice) > 5000 
order by (sum(od.quantityOrdered * od.priceEach)) - sum(od.quantityOrdered * p.buyprice)desc;

-- No 5
	SELECT o.addressLine1 AS 'Alamat', concat(LEFT(o.phone, LENGTH(o.phone)-6), '* **') as 'Nomor Telp'.
	COUNT(DISTINCT e.employeeNumber) AS 'jumlah karyawan' , COUNT(DISTINCT c.customerName), round(AVG(amount), 2)
	from offices AS o
	INNER JOIN employees AS e
	ON e.officeCode = o.officeCode
	INNER JOIN customers AS c
	ON c.salesRepEmployeeNumber = e.employeeNumber
	INNER JOIN payments AS p
	ON c.customerNumber = p.customerNumber
	GROUP BY o.officeCode
	ORDER BY o.phone ASC;

SELECT o.addressLine1 AS 'Alamat', concat(LEFT(o.phone, LENGTH(o.phone)-6), '* **') AS 'Nomor Telp',
COUNT(DISTINCT e.employeeNumber) AS 'jumlah karyawan' , COUNT(DISTINCT c.customerName), round(AVG(amount), 2)
from offices AS o
INNER JOIN employees AS e
ON e.officeCode = o.officeCode
INNER JOIN customers AS c
ON c.salesRepEmployeeNumber = e.employeeNumber
INNER JOIN payments AS p
ON c.customerNumber = p.customerNumber
GROUP BY o.officeCode
ORDER BY o.phone ASC;
