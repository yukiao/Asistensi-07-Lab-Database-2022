use classicmodels; -- No. 1, 2, 4, 5
use appseminar; -- No. 3

# No. 1
-- Tampilkan kolom tanggal pemesanan product (urutan desc) untuk pesanan 1940 Ford Pickup Truck
SELECT o.orderDate , p.productName
FROM orderdetails AS od
INNER JOIN orders AS o
ON od.orderNumber = o.orderNumber
INNER JOIN products AS p
ON p.productCode = od.productCode
WHERE productName = '1940 Ford Pickup Truck' 
ORDER BY o.orderDate desc;

# No. 2
-- Tampilkan daftar nama produk yang dijual dengan harga kurang dari 80% dari MSRP
SELECT p.productName, od.priceEach
FROM products AS p
INNER JOIN orderdetails AS od
ON p.productCode = od.productCode
where priceEach < (0.8 * MSRP);

# No. 3
-- Tampilkan pembimbing utama dari mahasiswa bersama Sulaeman
SELECT m.nama "nama_mahasiswa", d.nama "nama_dosen"
FROM ss_mahasiswa AS m 
INNER JOIN ss_pembimbing AS p 
ON p.id_mahasiswa = m.id_mahasiswa 
INNER JOIN ss_dosen AS d
ON p.id_pembimbing_utama = d.id_dosen 
WHERE m.nama ="Sulaeman";

# No. 4
-- Buat kolom baru dengan nama status bertipe varchar pada tabel customers
ALTER TABLE customers ADD `status` varchar (100);

-- Isi dengan nilai VIP untuk yang pembayaran > 100.000 dan quantity > 50
-- (hubungkan payments dan orderdetails)
UPDATE customers AS c
INNER JOIN orders AS o
ON c.customerNumber = o.customerNumber
INNER JOIN payments AS p
ON p.customerNumber = c.customerNumber
INNER JOIN orderdetails AS od
ON o.orderNumber = od.orderNumber
SET c.`status` = "VIP" 			-- Mengubah kolom status di tabel customers menjadi nilai VIP dmn kondisinya :
WHERE p.amount > 100000 OR od.quantityOrdered > 50;

--  Sisanya isi dengan nilai regular
UPDATE customers AS c
INNER JOIN orders AS o
ON c.customerNumber = o.customerNumber
INNER JOIN payments AS p
ON p.customerNumber = c.customerNumber
INNER JOIN orderdetails AS od
ON o.orderNumber = od.orderNumber
SET c.`status` = "Regular" 
WHERE p.amount < 100000 OR od.quantityOrdered < 50;

# No. 5
-- Hapus semua data pelanggan yang pernah membatalkan pesanan (customers dan orders)
ALTER TABLE orders drop CONSTRAINT orders_ibfk_1;
ALTER TABLE payments drop CONSTRAINT payments_ibfk_1;

DELETE c 
FROM customers AS c
INNER JOIN orders AS o
ON c.customerNumber = o.customerNumber
WHERE o.`status` = "Cancelled";