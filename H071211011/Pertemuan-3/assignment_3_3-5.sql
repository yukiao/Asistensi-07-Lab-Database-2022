USE db_praktikum;
ALTER TABLE mahasiswa
ADD no_telp VARCHAR (20) NOT NULL,
ADD alamat VARCHAR (100),
ADD email VARCHAR (50) NOT NULL,
ADD keterangan VARCHAR (20);
DESC mahasiswa;

-- No 3
-- Tambahkan data pada tabel mahasiswa dengan data nya adalah semua nama praktikan pada gb asistensi anda 
-- (Baris yang pertama merupakan nama anda) dengan menggunakan perintah insert disertai nama kolomnya 

INSERT INTO mahasiswa (nama, nim, jk, no_telp, alamat, email, keterangan)
VALUE ("Bulqis Ramadani", "H071211011", "P", "085399571952", "Workshop", "bulqis@gmail.com", "Semester 3"),
 		("Zabil Zabri Muhammad", "H071211016", "L", "081146137676", "Sudiang", "zabil@gmail.com", "Semester 3"),
		("Emilia Damayanti", "H071211009", "P", "089654706038", "Gowa", "emilia@gmail.com", "Semester 3"),
		("Aflah Alifu Na Mappatajang Rahman", "H071211021", "L", "085155016433", "BTP", "aflah@gmail.com", "Semester 3"),
		("WD. Ananda Lesmono", "H071211074", "P", "082271041877", "Maros", "nanda@gmail.com", "Semester 3"),
		("Adhitya Fajar Risqi Djati Pratama", "H071211067", "L", "082259256328", "Jl.Sahabat", "adit@gmail.com", "Semester 3"),
		("Andi Muh Ibnu Hibban Bagoes Malolo", "H071211060", "L", "081243220103", "Daya", "ibnu@gmail.com", "Semester 3"),
		("Hasan Azyumardi Azra", "H071211076", "L", "085237621073", "Jl.Sahabat", "hasan@gmail.com", "Semester 3"),
		("Muhammad Arya Ramdani", "H071211042", "L", "082395324495", "Antang", "arya@gmail.com", "Semester 3"),
		("Indah Kurnia Ilahi", "H071211001", "P", "082193119187", "Jl.Sahabat", "indah@gmail.com", "Semester 3"),
		("Emha Ismaulidin", "H071201037", "L", "082178549034", "Pangkep", "emha@gmail.com", "Semester 5");
SELECT * FROM mahasiswa;

-- No 4
-- Tambahkan 5 data pada tabel buku dan tabel pinjam dengan perintah insert tanpa disertai nama kolomnya

INSERT INTO buku 
VALUE ("Bumi", 2015,"Tere Liye", 1),
		("Bulan", 2016,"Tere Liye", 2),
		("Catatan Juang", 2017,"Fiersa Besari", 3),
		("Midnight Library", 2020,"Matt Haig", 4),
		("Egosentris ", 2018,"Syahid Muhammad", 5);
SELECT * FROM buku;

INSERT INTO pinjam 
VALUE ('2022-9-10', 25, 1, 1, 15),
		('2022-9-16', 26, 2, 0, 16),
		('2022-9-20', 27, 3, 1, 17),
		('2022-9-25', 28, 4, 1, 18),
		('2022-9-28', 29, 5, 0, 19);
SELECT * FROM pinjam;

-- No 5
-- Tambahkan 2 data baru pada tabel mahasiswa dengan data pertama terdapat blank pada salah satu kolom 
-- dan data kedua terdapat nilai null pada salah satu kolomnya 

INSERT INTO mahasiswa (nama, nim, jk, no_telp, alamat, email, keterangan)
VALUE ("Nur Hikmah", "H071211006", "P", "085546743962", "Workshop", "", "Semester 3");

INSERT INTO mahasiswa (nama, nim, jk, no_telp, email, keterangan)
VALUE ("Fadilah Istiqamah", "H071211023", "P", "082156923056", "fadilah@g,ail.com", "Semester 3");
SELECT * FROM mahasiswa;



 