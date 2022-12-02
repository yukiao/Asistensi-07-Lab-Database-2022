#Nomor 1
SELECT * FROM employees

USE classicmodels

INSERT INTO employees (employeeNumber, lastName, firstName, extension, email, officeCode, reportsTo, jobTitle)
VALUES(5000, 'Lesmono', 'Ananda', 'x2000', 'nandalesmono@gmail.com', 7, 1002, 'Sales Rep'),
		(6000, 'Rahman', 'Arie', 'x3000', 'arierahman@gmail.com', 8, 1002, 'Sales Rep'),
		(7000, 'Lesmono', 'Nanang', 'x4000', 'nananglesmono@gmail.com', 8, 1002, 'Sales Rep');

	
	
#Nomor 2
SELECT * FROM offices
INSERT INTO offices (officeCode, city, phone, addressLine1, addressLine2, state, country, postalCode, territory)
VALUES  ('8', 'Makassar', '+62 876 8904', 'Perumahan Bukit Baruga', NULL, 'Sulsel', 'Indonesia', '97650', 'APAC');

UPDATE employees
SET officeCode = '8'
WHERE officeCode = '4' AND jobTitle = 'Sales Rep';
SELECT * FROM employees
 


USE db_praktikum;

ALTER table mahasiswa
ADD No_telp varchar(20) NOT NULL;
ADD Alamat varchar (100);
ADD Email varchar (50) NOT NULL;
ADD Keterangan varchar (20);

DESC mahasiswa

#Nomor 3
SELECT * FROM mahasiswa
INSERT INTO mahasiswa (id_mahasiswa, nama, nim, jk, No_telp, Alamat, Email, Keterangan)
VALUES (1, 'Wd. Ananda Lesmono', 'H017211074','P', '082271041877', 'Unhas', 'nandalesmono@gmail.com', '3'),
		 (2, 'Aflah Alifu Na Mappatajang Rahman', 'H071211021', 'L', '082345678912', 'Unhas', 'aflah@gmail.com', '3'),
		 (3, 'Zabil Sabri Muhammad', 'H071211016', 'L', '083456789123', 'Unhas', 'zabil@gmail.com', '3'),
		 (4, 'Emilia Damayanti', 'H071211009', 'P', '084567891234', 'Unhas', 'emilia@gmail.com', '3'),
		 (5, 'Emha Ismaulidin', 'H071211037', 'L', '085678912345', 'Unhas', 'emha@gmail.com', '3'),
		 (6, 'Bulqis Ramadani', 'H071211011', 'P', '08112233445566', 'Unhas', 'bulqis@gmail.com', '3'),
		 (7, 'Adhitya Fajar Risqi Djati Pratama', 'H071211067', 'L','088888888888', 'Unhas', 'adit@gmail.com', '3'),
		 (8, 'Andi Muhammad Ibnu Hibban Bagoes Malolo', 'H071211060', 'L', '088888888888', 'Unhas', 'ibnu@gmail.com', '3'),
		 (9, 'Hasan Azyumardi', 'H071211076', 'L', '088888888888', 'Unhas', 'hasan@gmail.com', '3'),
		 (10, 'Muhammad Arya Ramdani', 'H071211052', 'L', '088888888888', 'Unhas', 'arya@gmail.com', '3'),
		 (11, 'Indah Kurnia Ilahi', 'H071211001', 'P', '088888888888', 'Unhas', 'indah@gmail.com', '3');
		 
#Nomor 4
DESC buku
INSERT INTO buku
VALUES ('Jungkook', 1997, 'Nanda', 1),
		 ('Taehyung', 1995, 'Jennie', 2),
		 ('Jimin', 1995, 'Rose', 3),
		 ('Bangtan Soyeondan', 2013, 'Bang Sihyuk', 4), 
		 ('Hybe', 2010, 'BigHit', 5);
SELECT * FROM buku

DESC pinjam
INSERT INTO pinjam
VALUES ('2022-10-05 13:31:00', 1, 1, 1, 1),
		 ('2022-10-05 15:50:49', 3, 2, '', 2),
		 ('2002-10-05 16:01:34', 4, 3, '', 3),
		 ('2002-10-05 16:31:44', 5, 4, 1, 4),
		 ('2002-10-05 17:00:00', 4, 5, 1, 5);
SELECT * FROM pinjam

#Nomor 5
SELECT * FROM mahasiswa
INSERT INTO mahasiswa (id_mahasiswa, nama, nim, jk, No_telp, Alamat, Email, Keterangan)
VALUES (12, 'Dhyaa Unnisa', 'H071211079', 'P', '088888888888', NULL, 'dhyaa@gmail.com', '3'),
		 (13, 'Michiko Tjang', 'H071211013', 'P', '088888888888', 'Batua', '', '3'),
