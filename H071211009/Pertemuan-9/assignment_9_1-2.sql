use classicmodels;

# No. 1
-- Dengan menggunakan database “classicmodels”, tambahkan 3 data ke 
-- dalam tabel orders dan orderdetails setelah itu lakukan perintah commit.
select * from orders;
select * from orderdetails limit 2000;

SET autocommit = 0;
begin;
insert into orders
values	(10428, '2022-07-21', '2023-01-01', '2023-01-01', 'Shipped', '', 141), 
		(10426, '2020-05-21', '2023-01-01', '2023-02-01', 'On Hold', '', 145),
        (10427, '2019-03-21', '2023-01-01', '2023-03-01', 'On Hold', '', 119);
insert into orderdetails
values	(10207, 'S24_1937', '2', '20.20', 4), 
		(10207, 'S18_2795', '40', '13.22', 9),
        (10207, 'S24_2022', '71', '66.11', 7);
commit;


# No. 2
-- Hapus seluruh data dari tabel orders details dan gunakan perintah 
-- ROLLBACK untuk mengembalikan data tersebut.
begin;
delete from orderdetails;

select count(*) from orderdetails;

rollback;
