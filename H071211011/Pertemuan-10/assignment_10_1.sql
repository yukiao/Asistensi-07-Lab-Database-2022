#No 1
-- kolom total adalah selisih customers.creditLimit dan banyak nya produk yang 
-- dibeli oleh customer (jumlah barang * harga per satuan barang)
-- kolom “Are you safe ?” didapat dari mengecek nilai kolom total
-- - jika kolom total > 0 maka tampilkan “you are safe”
-- - jika kolom total < 0 maka tampilkan “you are in debt”
-- - jika kolom total = 0 maka tampilkan “you are running out of credits"
SELECT c.customerName,
case
	when c.creditLimit - sum(od.quantityOrdered * od.priceEach) > 0 then 'you are safe'
	when c.creditLimit - sum(od.quantityOrdered * od.priceEach) < 0 then 'you are in debt'
	ELSE 'you are running out of credits'
END AS `Are You safe?`, c.creditLimit - sum(od.quantityOrdered * od.priceEach) as total
FROM customers c
JOIN orders o
USING (customerNumber)
JOIN orderdetails od
USING (orderNumber)
GROUP BY customerName;