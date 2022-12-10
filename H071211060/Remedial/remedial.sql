USE sakila;

-- nomor 1
-- Berikan film yang paling banyak dirental oleh customer dari negara amerika
SELECT CONCAT(customer.first_name," ",customer.last_name) "Nama Lengkap Pelanggan"
FROM rental
JOIN customer
USING (customer_id)
JOIN address
USING (address_id)
JOIN city
USING (city_id)
JOIN country
USING (country_id)
WHERE country.country LIKE "%states%"
GROUP BY customer.customer_id
ORDER BY COUNT(*) DESC;
-- Penjelasan :
-- Pertama kita Select Concat untuk mendapatkan nama lengkapnya, Lalu kita joinkan customer, address,
-- city dan country. Alasan mengapa saya memakai "USING" karena memiliki Foreign key yang sama. 
-- Lalu, kita berikan kondisi dimana hanya customer dari negara amerika yang muncul.


-- nomor 2
-- Tampilkan list nama lengkap pelanggan yang tidak pernah merental film bergenre horror
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
-- penjelasan =
-- Pertama-tama saya select distinct. Distinct agar tidak muncul data yang sama. Lalu saya memakai concat
-- untuk menggabungkan first_name dan last_name agar menghasilkan nama lengkap pelanggan. dan juga saya
-- memberikan alian yaitu "Nama Lengkap Pelanggan" sesuai dengan output yang diminta.
-- Lalu kita joinkan rental, inventory, film, film_category, dan category. Disini juga saya memakai using
-- karena memiliki foreign key yang sama.
-- Terakhir saya berikan kondisi dimana yang dimunculkan hanyalah pelanggan yang tidak pernah merental film
-- bergenre horor. Alasan saya memakai category.category_id != "11", karena genre horor itu memiliki
-- category_id = 11. 
