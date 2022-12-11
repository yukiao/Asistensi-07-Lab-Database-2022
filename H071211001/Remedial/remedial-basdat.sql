-- [nomor 2]
use sakila;
select * from category;
select * from film_category;

select category.name as Category, count(film.title) as `Jumlah rating PG-13`
from category
join film_category 
using (category_id)
join film
using (film_id)
where film.rating = 'PG-13'
group by category.name
order by count(film.title) desc
limit 3;

-- [nomor 1]
select * from category;
select * from film_category;

select concat(cs.first_name, ' ', cs.last_name) as `Nama Pelanggan`, count(f.title) as `Jumlah Film`
from category as c
join film_category as fc
using (category_id)
join film as f
using(film_id)
join inventory as i
using(film_id)
join rental as r
using(inventory_id)
join customer as cs
using(customer_id)
where c.name = 'Horror' | 'Comedy'
group by `Nama Pelanggan`
order by `Jumlah Film` desc
limit 3;








