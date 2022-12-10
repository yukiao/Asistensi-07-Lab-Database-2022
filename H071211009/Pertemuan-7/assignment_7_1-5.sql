use classicmodels;

# No. 1
-- Buatlah query untuk menampilkan data pembayaran (payment) terkecil dan terbesar
-- untuk masing-masing pengguna dengan menggunakan subquery.
select customerName as 'Pengguna', max(amount) as 'Pembayaran Terbesar', min(amount) as 'Pembayaran Terkecil'
from payments
join customers
using (customerNumber)
where customerName in (
	select customerName from customers)
group by customerName;

# No. 2
-- Buatlah query untuk menampilkan seluruh employee yang bekerja di office dengan employee terbanyak
-- (misalnya office A memiliki paling banyak employee, maka buatkan daftar employee pada office A).
select officeCode, employeeNumber, concat(firstName, ' ', lastName) as 'Employee'
from employees
where officeCode = (
	select officeCode from (
		select officeCode, count(officeCode) as 'Employee'
        from employees
		group by officeCode
		order by 'Employee'
		limit 1) as O);
        
# No. 3
-- Buatlah query yang akan menampilkan seluruh product yang di namanya mengandung kata ‘Ford’
-- beserta productScale dari product tersebut. Gunakan subquery untuk menampilkannya. 
select productName, productScale 
from products
where productName in (
	select productName
    from products
    where productName like "%Ford%");

# No. 4
-- Siapa nama pelanggan, dan nama karyawan serta berapa nomor pesanan 
-- dan biaya pesanan untuk pesanan yang paling mahal?
select customerName as `Nama Pelanggan`, CONCAT(firstName, " ", lastName) AS `Nama Karyawan`, 
orderNumber as `Nomor Pesanan`, SUM(priceEach*quantityOrdered) as 'Biaya Pesanan'
from customers
join orders
using (customerNumber)
join orderdetails
using (orderNumber)
join employees
on employeeNumber = salesRepEmployeeNumber
group by orderNumber
having `Biaya Pesanan` = (
    select MAX(`Biaya Pesanan`)
    from (
        select SUM(priceEach*quantityOrdered) as 'Biaya Pesanan'
        from orderdetails
        group by orderNumber
    ) as orderTotals);

# No. 5
-- Tampilkan nama negara dan panjang karater negara, dimana menampilkan dua negara
-- yaitu negara dengan karakter terpanjang dan negara dengan karakter terpendek.
select distinct country as 'Nama Negara', length(country) as 'Panjang Karakter' 
from customers
where length(country) in (
	(select MAX(LENGTH(country)) from customers), (select MIN(LENGTH(country)) from customers))
order by length(country) desc;