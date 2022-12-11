USE sakila;

-- NO 1
SELECT CONCAT(c.first_name, c.last_name) AS "Nama Lengkap", f.title AS "Judul Film", r.rental_date AS tgl_rental, f.rental_duration AS deadline, r.return_date AS tgl_kembali
FROM customer c
JOIN rental r USING(customer_id) 
JOIN inventory i USING(inventory_id) 
JOIN film f USING(film_id)
WHERE DATEDIFF(r.return_date, r.rental_date) > f.rental_duration;

-- NO 2
SELECT c.name AS Category, COUNT(f.film_id) AS "Jumlah film"
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
GROUP BY c.category_id;

