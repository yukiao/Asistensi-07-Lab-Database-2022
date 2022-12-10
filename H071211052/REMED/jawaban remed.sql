-- NAMA : MUHAMMAD ARYA RAMDANI
-- NIM : H071211052	

USE sakila;



-- NO1 --
SELECT CONCAT(c.first_name, " ", c.last_name) AS 'Nama Lengkap', ci.city AS Kota, co.country AS Negara 
FROM customer AS c
JOIN address AS a
USING (address_id)
JOIN city AS Ci
USING (city_id)
JOIN country AS co
USING (country_id)
WHERE country LIKE 'ind_%' OR country LIKE '%_na';

-- penjelasan
-- pertama,  saya gunakan select CONCAT untuk menggabungkan nilai, kemudian mengambil nilai dari tabel customer
-- , lalu JOIN dengan tabel addres kemudian USING address_id karena terdapat FOREIGN KEY disana.
-- trus JOIN lagi dengan city USING city_id karena FOREIGN KEY dan terakhir JOIN dengan tabel country.
-- kemudian saya ksih kondisi WHERE dimana nama negara yang berawalan "ind" atau berakhir "na"


-- n0 2
SELECT DISTINCT CONCAT(customer.first_name," ",customer.last_name) AS "Nama Lengkap Pelanggan"
FROM customer 
JOIN rental
USING (customer_id)
JOIN inventory
USING (Inventory_id)
JOIN film
USING (film_id)
JOIN film_category
USING (film_id)
JOIN category
USING (category_Id)
WHERE category.category_id != "11";

-- penjelasan
-- pertama saya gunakan SELECT SELECT DISTINCT CONCAT untuk menampilkan nama pelanggan yang tidak merental film genre horor
-- , saya gunakan DISTINCT supaya tdak terjadi duplikat atau ada DATA yg sama, setelah SELECT dri tabel customer
-- kemudian JOIN dengan rental USING customer_id karena FOREIGN KEY, lalu JOIN tabel inventory, JOIN film, JOIN film_category, 
-- dan terakhir JOIN dengan tabel category
-- kemudian saya beri kondisi dimana pada category_id nomor 11 bergenre horror, lalu saya beri tidak saya dengan
-- !="11" untuk mencari pelanggan yg tidak merental film horor
