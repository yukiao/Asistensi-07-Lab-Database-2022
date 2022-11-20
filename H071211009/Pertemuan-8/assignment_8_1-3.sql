use appseminar; -- No. 1-2
use classicmodels; -- No. 3

# No. 1
-- Tampilkan nama, nama program studi, dan nim/nip dari dosen dan mahasiswa Ilmu Komputer.
select mhs.nama 'Nama Dosen/Mahasiswa', pr.nama 'Nama Prodi', mhs.nim 'NIM/NIP', 'Mahasiswa' `Status`
from ss_mahasiswa as mhs
join ss_prodi as pr
using (id_prodi)
where pr.nama = "Ilmu Komputer"
union
select d.nama, pr.nama, d.nip, 'Dosen'
from ss_dosen as d
join  ss_prodi as pr
using (id_prodi)
where pr.nama = "Ilmu Komputer";

# No. 2
-- Tampilkan nama, prodi, dan riwayat status yang pernah dijalani
-- (pembimbing utama, pertama, penguji 1, penguji 2) dari setiap dosen,
-- kemudian urutkan berdasarkan nama DESC.
select `Nama`, `Prodi`,GROUP_CONCAT(stat) `Riwayat Status`
from (
	select d.nama `Nama`, pr.nama `Prodi`,
    (select 'penguji 1' where pe.id_penguji_1 = d.id_dosen) as stat
	from ss_dosen as d
    left join ss_prodi as pr
    using (id_prodi), ss_penguji as pe
	union
	select d.nama `Nama`, pr.nama `Prodi`,
	(select 'penguji 2' where pe.id_penguji_2 = d.id_dosen) as stat
	from ss_dosen as d
    left join ss_prodi as pr
    using (id_prodi), ss_penguji as pe
	union
	select d.nama `Nama`, pr.nama `Prodi`,
	(select 'pembimbing utama' where pe.id_pembimbing_utama = d.id_dosen) as stat
	from ss_dosen as d
    left join ss_prodi as pr
    using(id_prodi) , ss_pembimbing as pe
	union
	select d.nama `Nama`, pr.nama `Prodi`,
	(select 'pembimbing pertama' where pe.id_pembimbing_pertama = d.id_dosen) as stat
	FROM ss_dosen as d
    left join ss_prodi as pr
    using(id_prodi) , ss_pembimbing as pe) as riwayat
group by `Nama`
having `Riwayat Status` is not null
order by `Nama` desc;

# No. 3
-- Tampilkan kota apa yang paling banyak karyawan atau pelanggan yang namanya diawali huruf L.
-- note (kota karyawan berdasarkan kota tempat dia bekerja).
select city, COUNT(city) as `Jumlah Karyawan/Pelanggan`
from (select CONCAT(e.firstName, " ", e.lastName) as 'karyawan', o.city
	from employees e
    join offices o
    using (officecode)
	where e.firstName like 'L%'
	union
	select customerName, city
	from customers
	where customerName like 'L%')  as sq
group by city
order by count(city) desc
limit 1;