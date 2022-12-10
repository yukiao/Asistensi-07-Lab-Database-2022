USE appseminar;

-- [nomor 1]
SELECT * FROM ss_mahasiswa;
SELECT * FROM ss_prodi;
SELECT * FROM ss_dosen;

SELECT m.nama, p.nama prodi, m.nim 'NIM/NIP'
FROM ss_mahasiswa m
JOIN ss_prodi p
ON m.id_prodi = p.id_prodi
WHERE p.nama = 'Ilmu Komputer'
UNION
SELECT d.nama, p.nama, d.nip
FROM ss_dosen d
JOIN ss_prodi p 
ON d.id_prodi = p.id_prodi
WHERE p.nama = 'Ilmu Komputer'

-- [nomor 2]
SELECT nama, prodi, GROUP_CONCAT(STATUS, ' ') riwayatStatus 
FROM 
	(SELECT DISTINCT d.nama, p.nama prodi, 'pembimbing utama' STATUS
FROM ss_dosen d
JOIN ss_prodi p 
ON d.id_prodi = p.id_prodi
JOIN ss_pembimbing pb
ON pb.id_pembimbing_utama = d.id_dosen
UNION 
SELECT DISTINCT d.nama, p.nama, 'pembimbing pertama' STATUS
FROM ss_dosen d
JOIN ss_prodi p 
ON d.id_prodi = p.id_prodi
JOIN ss_pembimbing pb
ON pb.id_pembimbing_pertama = d.id_dosen
UNION
SELECT DISTINCT d.nama, p.nama, 'penguji pertama' STATUS
FROM ss_dosen d
JOIN ss_prodi p 
ON d.id_prodi = p.id_prodi
JOIN ss_penguji pj
ON pj.id_penguji_1 = d.id_dosen
UNION
SELECT DISTINCT d.nama, p.nama, 'penguji kedua' STATUS
FROM ss_dosen d
JOIN ss_prodi p 
ON d.id_prodi = p.id_prodi
JOIN ss_penguji pj
ON pj.id_penguji_2 = d.id_dosen) a
GROUP BY nama, prodi
ORDER BY nama DESC;

-- [nomor 3]
USE classicmodels;

SELECT city FROM
	(SELECT o.city, e.firstName name
	FROM offices o
	NATURAL JOIN employees e
	WHERE e.firstName LIKE 'L%'
	UNION 
	SELECT city, customerName FROM customers
	WHERE customerName LIKE 'L%') s
GROUP BY city
ORDER BY count(NAME) DESC LIMIT 1;

-- SELECT city, COUNT(NAME) AS 'Jumlah Karyawan dan Pelanggan' FROM
-- 	(SELECT o.city, e.firstName name
-- 	FROM offices o
-- 	NATURAL JOIN employees e
-- 	WHERE e.firstName LIKE 'L%'
-- 	UNION 
-- 	SELECT city, customerName FROM customers
-- 	WHERE customerName LIKE 'L%') s
-- GROUP BY city
-- ORDER BY count(NAME) DESC LIMIT 1;


