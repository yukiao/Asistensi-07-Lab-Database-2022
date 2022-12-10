-- ALTER TABLE mahasiswa
-- ADD No_telp VARCHAR(20) NOT NULL,
-- ADD Alamat VARCHAR(100),
-- ADD Email VARCHAR(50) NOT NULL,
-- ADD Keterangan VARCHAR(20);

#NOMOR 3
SELECT * FROM mahasiswa
INSERT INTO mahasiswa (id_mahasiswa, nama, nim, jk, No_telp, Alamat, Email, Keterangan)
VALUES 
(1, 'Aflah Alifu Na Mappatajang Rahman', 'H071211021', 'L', '082345678912', 'Unhas', 'aflah@gmail.com', '3'),
(2, 'Wd. Ananda Lesmono', 'H017211074','P', '082271041877', 'Unhas', 'nandalesmono@gmail.com', '3'),
(3, 'Zabil Sabri Muhammad', 'H071211016', 'L', '083456789123', 'Unhas', 'zabil@gmail.com', '3'),
(4, 'Emilia Damayanti', 'H071211009', 'P', '084567891234', 'Unhas', 'emilia@gmail.com', '3'),
(5, 'Emha Ismaulidin', 'H071211037', 'L', '085678912345', 'Unhas', 'emha@gmail.com', '3'),
(6, 'Bulqis Ramadani', 'H071211011', 'P', '08112233445566', 'Unhas', 'bulqis@gmail.com', '3'),
(7, 'Adhitya Fajar Risqi Djati Pratama', 'H071211067', 'L','088888888888', 'Unhas', 'adit@gmail.com', '3'),
(8, 'Andi Muhammad Ibnu Hibban Bagoes Malolo', 'H071211060', 'L', '088888888888', 'Unhas', 'ibnu@gmail.com', '3'),
(9, 'Hasan Azyumardi', 'H071211076', 'L', '088888888888', 'Unhas', 'hasan@gmail.com', '3'),
(10, 'Muhammad Arya Ramdani', 'H071211052', 'L', '088888888888', 'Unhas', 'arya@gmail.com', '3'),
(11, 'Indah Kurnia Ilahi', 'H071211001', 'P', '088888888888', 'Unhas', 'indah@gmail.com', '3');

#NOMOR 4
SELECT * FROM buku;
DESCRIBE buku;
INSERT INTO buku VALUES
('Manusia Monyet', 2022, 'raditya', 1),
('Marmut Hitam Jeruk', 2003, 'raditya', 2),
('Cinta T-Rex', 2001, 'raditya', 3),
('Beruang Kumal', 2004, 'raditya', 4),
('Kambing Jantan', 2009, 'raditya', 5);

SELECT * FROM pinjam;
DESCRIBE pinjam;
INSERT INTO pinjam VALUES
('2022-09-10 13:04:06', 1, 1, 1, 1),
('2022-09-10 13:04:07', 2, 2, 0, 2),
('2022-09-10 13:04:08', 3, 3, 1, 3),
('2022-09-10 13:04:09', 4, 4, 0, 4),
('2022-09-10 13:04:10', 5, 5, 1, 5);

#NOMOR 5
DESCRIBE mahasiswa;
SELECT * FROM mahasiswa;
INSERT INTO mahasiswa (id_mahasiswa, nama, nim, jk, No_telp, Alamat, Email, Keterangan)
VALUES 
(12, 'Rafiq', 'H071211099', 'L', '082345678912', '', 'aflah@gmail.com', '3');

INSERT INTO mahasiswa (id_mahasiswa, nama, nim, jk, No_telp, Email, Keterangan)
VALUES 
(14, 'Raihan', 'H017211097','P', '082271041877', 'Unhas', '3');

DELETE FROM mahasiswa WHERE id_mahasiswa >11

INSERT INTO mahasiswa 
VALUES ("Sony", "H071120012", "L" , 12, "087342524", "sony@gmail.com", "unhas", "3")

UPDATE mahasiswa
SET Keterangan="7"
WHERE nama="Sony";