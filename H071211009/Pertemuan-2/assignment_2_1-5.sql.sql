use classicmodels;

-- No. 1
select * from offices where city = "San Francisco"

-- No. 2
select * from orderdetails where quantityOrdered > "70" order by orderLineNumber asc

-- No. 3
select distinct productLine from products

-- No. 4
select customerNumber as nomorPelanggan, customerName as namaPelanggan from customers where customerNumber between 100 and 150 

-- No. 5
select * from customers where country not in ("USA") and creditlimit = 0 order by customerName desc limit 10, 10

  