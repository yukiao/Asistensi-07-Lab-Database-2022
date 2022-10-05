-- USE classicmodels
-- nomor [1]
INSERT INTO employees(`employeeNumber`, `lastName`, `firstName`, `extension`, `email`, `officeCode`, `reportsTo`, `jobTitle`)
VALUE
	(1024, "Kurnia", "Indah", "x123", "indahkurnia399@gmail.com", "7", 1056, "Sales Rep"),
	(1512, "Syah", "Alam", "x124", "alamsyah1234@gmail.com", "4", 1102, "Sales Rep"),
	(1207, "Billar", "Rizky", "x125", "billarkdrt106@gmail.com", "7", 1621, "Sales Rep");

SELECT * FROM employees;

-- nomor [2]
SELECT * FROM offices
INSERT INTO offices
VALUE (8, "Makassar", "82134567", "Sahabat 3", "Garuda 29", "SA", "INA", "123-567", "MGSCDR");

UPDATE employees 
SET officeCode = "8" 
WHERE officeCode = "4" AND jobTitle = "Sales Rep";

SELECT * FROM employees WHERE officeCode = 4 AND jobTitle = "Sales Rep"

#USE book
-- DESC mahasiswa

-- ALTER TABLE mahasiswa
-- MODIFY email VARCHAR(50) NOT NULL;

-- ALTER TABLE mahasiswa
-- MODIFY alamat VARCHAR(100);

-- ALTER TABLE mahasiswa
-- MODIFY keterangan varchar (20);

#Nomor [3]
INSERT INTO mahasiswa(`nama`, `nim`, `jk`, `id_mahasiswa`, `no_telp`, `email`, `alamat`, `keterangan`)
VALUE 
	("Indah", "H071211001", "P", 11, "082193119187", "indahkurnia399@gmail.com", "Sahabat 3", "Semester 3"),
	("Emilia Damayanti", "H071211009", "P", 12, "089654706038", "emiliadamayanti@gmail.com", "Gowa", "Semester 3"),
	("Bulqis Ramadhani", "H071211011", "P", 13, "085399571952", "bulqisramadhani@gmail.com", "Workshop", "Semester 3"),
	("Aflah Alifu", "H071211021", "L", 14, "085155016433", "aflahalifu@gmail.com", "Veteran", "Semester 3"),
	("Zabil Sabri Muhammad", "H071211016", "L", 15, "08114613767", "zabilsabrimuhammad@gmail.com", "Pettarani", "Semester 3"),
	("Aditya Fajar", "H071211067", "L", 16, "082259256328", "adityafajar@gmail.com", "Pelangi", "Semester 3"),
	("Arya Ramdhani", "H071211052", "L", 17, "082395324495", "aryaramdhani@gmail.com", "Veteran Utara", "Semester 3"),
	("WD. Ananda Lesmono", "H071211074", "P", 18, "082271041877", "anandalesmono@gmail.com", "Sahabat 2", "Semester 3"),
	("Andi Bagoes Malolo", "H071211060", "L", 19, "081243220103", "andibagoesmalolo@gmail.com", "Sahabat 5", "Semester 3"),
	("Hasan Azyumardi Azra", "H071211076", "L", 20, "085237621073", "rezahasan@gmail.com", "Sahabat 6", "Semester 3");
-- 	
SELECT * FROM mahasiswa;
DELETE FROM mahasiswa WHERE nama = "Indah Kurnia Ilahi";
SELECT * FROM pinjaman;

#Nomor [4]
DESC buku

INSERT INTO buku
VALUE 
	("Diri tahu, tahu diri", 2016, "Drs. A.M. Najib Senri Guttu", 110),
	("Halooo", 2017, "Haha hahaha", 111),
	("Holaaaaa", 2018, "Hehehe hehe", 112),
	("Haaaaiiiii", 2019, "Hohohoho hoho", 113),
	("Who Am I?", 2020, "Jessica", 114);
	
SELECT * FROM buku;
DELETE FROM pinjaman;

DESC pinjaman
-- 
INSERT INTO pinjaman
VALUE 
		("2022-10-04 09:39:00", 5, 110, 1, 1002),
		("2022-10-05 09:45:00", 6, 111, 0, 1003),
		("2022-10-06 09:40:00", 11, 112, 1, 1004),
		("2022-10-07 09:50:00", 12, 113, 1, 1005),
		("2022-10-08 09:30:00", 13, 114, 1, 1006);
-- 		
-- SELECT * FROM mahasiswa;
SELECT * FROM pinjaman;

#Nomor [5]
DESC mahasiswa
SELECT * FROM mahasiswa
DESC mahasiswa
INSERT INTO mahasiswa(nama, jk, id_mahasiswa, no_telp, email, alamat, keterangan)
VALUE 
		("Rizky Billar", "L", 5, "08123456", "rizkykdrt234@gmail.com", "jakarta", "Semester 10");

INSERT INTO mahasiswa(nama, nim, id_mahasiswa, no_telp, email, alamat, keterangan)
VALUE 
		("Rizky Billar", "800052", 6, "08123456", "rizkykdrt234@gmail.com", "jakarta", "Semester 10");


DELETE FROM mahasiswa WHERE id_mahasiswa = 5 OR id_mahasiswa = 6