use classicmodels;

#No. 1
-- tampilkan nama pelanggan yang total belanjanya melebihi kredit limit,
-- serta tampilkan selisih total belanja dengan kredit limit,
-- kemudian urutkan berdasarkan selisih tersebut secara menurun.
select c.customerName as `Nama Pelanggan`, sum(p.amount) as `Total Belanja`,
c.creditLimit as `Batas Kredit`, sum(p.amount) - c.creditLimit as `Selisih`
from customers as c
join payments as p
using (customerNumber)
group by c.customerName
having `Total Belanja` > `Batas Kredit`
order by `Selisih` desc;

#No. 2
-- Siapa customer yang total pembelian barangnya terbanyak (dihitung dari quantity bukan price)
select concat(c.customerName, ' : ', c.contactFirstName, ' ', c.contactLastName, '@', c.addressLine1) as 'Pelanggan',
sum(od.quantityOrdered) as `Jumlah Orderan`
from customers as c
join orders as o
using (customerNumber)
join orderdetails as od
using (orderNumber)
group by c.customerName
order by `Jumlah Orderan` desc
limit 1;

#No. 3
-- Tampilkan jumlah dan list pelanggan, serta jumlah pembayaran untuk pembayaran yang dilakukan pada bulan februari setiap tahunnya.
select concat(monthname(p.paymentDate), ' ', year(p.paymentDate)) as `Hari Pembayaran`,
count(distinct c.customerName) as `Jumlah Pelanggan`,
group_concat(distinct c.customerName separator ', ') as `List Pelanggan`,
sum(p.amount) as `Jumlah Pembayaran`
from payments as p
join customers as c
using (customerNumber)
where monthname(p.paymentDate) Like 'Feb%'
group by `Hari Pembayaran`
-- having `Hari Pembayaran` like 'Feb%'
order by `Jumlah Pembayaran` desc;

#No. 4
-- Tampilkan jumlah orderan & keuntungan penjualan 2001 Ferrari Enzo yang keuntungannya lebih besar dari 5000.
select upper(p.productName) as `Nama Product`, count(od.orderLineNumber) as `Jumlah Diorder`,
group_concat(o.orderDate separator ', ') as `Waktu Orderan`,
p.buyPrice as `Harga Beli`, od.priceEach as `Harga Jual`, sum(od.quantityOrdered) as `Total Jumlah Orderan`,
-- Keuntungan 
concat(sum(od.priceEach * od.quantityOrdered) , ' - ', sum(p.buyPrice * od.quantityOrdered),
' = ', (sum(od.priceEach * od.quantityOrdered) - sum(p.buyPrice * od.quantityOrdered))) as `Pendapatan - Modal = Keuntungan`
from products as p
join orderdetails as od
using (productCode)
join orders as o
using (orderNumber)
where p.productName like '%2001%'
group by `Harga Jual`
having (sum(od.priceEach * od.quantityOrdered) - sum(p.buyPrice * od.quantityOrdered)) > 5000
order by (sum(od.priceEach * od.quantityOrdered) - sum(p.buyPrice * od.quantityOrdered)) desc;

#No. 5
-- Tampilkan alamat pertama dari tiap kantor, no telp yang 5 angka terakhirnya disamarkan,
-- jumlah karyawan, jumlah pelanggan yang pernah dilayani, serta rata-rata penghasilan.
select * from customers;

-- untuk cek relasi table (mengecek parent table dr foreign key)
select `table_name`, `column_name`, `referenced_table_name`, `referenced_column_name`
from `information_schema` . `key_column_usage`
where `table_name` = 'customers';

-- menampilkan 
select o.addressLine1, replace(o.phone, right(o.phone, 6), '* ****'),
count(distinct e.employeeNumber) as `Jumlah Karyawan`,
count(distinct c.customerName) as `Jumlah Pelanggan`,
avg(p.amount) `Rata-rata Penghasilan`
from offices as o
join employees as e
using (officeCode)
join customers as c
on e.employeeNumber = c.salesRepEmployeeNumber -- ini
join payments as p
using (customerNumber)
group by o.officeCode;
