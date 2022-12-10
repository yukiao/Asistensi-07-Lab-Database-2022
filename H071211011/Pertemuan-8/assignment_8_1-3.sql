#No1
-- (database appseminar) Tampilkan nama, nama program studi, dan nim/nip
-- dari dosen dan mahasiswa Ilmu Komputer!
SELECT ss_mahasiswa.nama , ss_prodi.nama AS `prodi`, ss_mahasiswa.nim AS `nim/nip`, 'mahasiswa' AS `status`
FROM ss_mahasiswa JOIN ss_prodi USING (id_prodi)
WHERE id_prodi = "H07"
UNION 
SELECT ss_dosen.nama,ss_prodi.nama, ss_dosen.nip, 'dosen'
FROM ss_dosen JOIN ss_prodi USING (id_prodi)
WHERE id_prodi = "H07";

#No 2
-- (database appseminar) Tampilkan nama, prodi, dan riwayat status yang
-- pernah dijalani (pembimbing utama, pertama, penguji 1, penguji 2) dari setiap
-- dosen, kemudian urutkan berdasarkan nama DESC
SELECT `Nama Dosen`, `Prodi`,GROUP_CONCAT(distinct stat) AS `Riwayat Status`
FROM (SELECT   ss_dosen.nama AS`Nama Dosen`, ss_prodi.nama AS `Prodi`,
			(SELECT 'penguji 1' WHERE ss_penguji.id_penguji_1 = ss_dosen.id_dosen) AS stat
			 FROM ss_dosen LEFT JOIN ss_prodi USING(id_prodi), ss_penguji
		UNION 
		SELECT  ss_dosen.nama AS`Nama Dosen`, ss_prodi.nama AS `Prodi`,
			(SELECT 'penguji 2' WHERE ss_penguji.id_penguji_2 = ss_dosen.id_dosen) AS stat
			 FROM ss_dosen LEFT JOIN ss_prodi USING(id_prodi), ss_penguji
		UNION 
		SELECT  ss_dosen.nama AS`Nama Dosen`, ss_prodi.nama AS `Prodi`,
			(SELECT 'pembimbing utama' WHERE ss_pembimbing.id_pembimbing_utama = ss_dosen.id_dosen) AS stat
			 FROM ss_dosen LEFT JOIN ss_prodi USING(id_prodi) , ss_pembimbing
		UNION 
		SELECT  ss_dosen.nama AS`Nama Dosen`, ss_prodi.nama AS `Prodi`,
			(SELECT 'pembimbing pertama' WHERE ss_pembimbing.id_pembimbing_pertama = ss_dosen.id_dosen) AS stat
			 FROM ss_dosen LEFT JOIN ss_prodi USING(id_prodi) , ss_pembimbing	
	) riwayat
GROUP BY `Nama Dosen`
HAVING `Riwayat Status` IS NOT NULL 
ORDER BY `Nama Dosen` DESC;

#3
-- (classicmodels) buatlah query untuk menampilkan, kota apa yang paling
-- banyak karyawan atau pelanggan yang namanya diawali huruf L.
-- note (kota karyawan berdasarkan kota tempat dia bekerja)
SELECT city, COUNT(city) AS `jumlah karyawan/pelanggan`
FROM (SELECT CONCAT(e.firstName, " ", e.lastName) AS 'karyawan', o.city
		FROM employees e JOIN offices o USING (officecode)
		WHERE e.firstName LIKE 'L%'
		UNION all
		SELECT customerName, city 
		FROM customers
		WHERE customerName LIKE 'L%') AS `karyawan/pelanggan`
GROUP BY city	
ORDER BY count(city) DESC
LIMIT 1;








