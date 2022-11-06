-- USE classicmodels;
-- 
-- SOAL NOMOR 1
-- SELECT * FROM employees;
-- 
-- ORANG PERTAMA
-- INSERT INTO employees (employeeNumber, lastName, firstName, extension, email,
-- officeCode, reportsTo, jobTitle)
-- VALUE (2705, 'Muhammad', 'Andi', 'x3227', 'andimuhammad@gmail.com', 1, 1102, 'Director');
-- 
-- ORANG KEDUA
-- INSERT INTO employees (employeeNumber, lastName, firstName, extension, email,
-- officeCode, reportsTo, jobTitle)
-- VALUE (2706, 'Hibban', 'Ibnu', 'x3228', 'ibnuhibban@gmail.com', 1, 1102, 'Deputy Director');
-- 
-- ORANG KETIGA
-- INSERT INTO employees (employeeNumber, lastName, firstName, extension, email,
-- officeCode, reportsTo, jobTitle)
-- VALUE (2707, 'Malolo', 'Bagoes', 'x3229', 'bagoesmalolo@gmail.com', 1, 1102, 'Secretary');
-- 
-- 
-- SOAL NOMOR 2
-- SELECT * FROM offices;
-- INSERT INTO offices (OfficeCode, city, phone, addressLine1, addressLine2, state, country, postalCode, territory)
-- VALUE ('8', 'Gowa', '+10000', 'Puri', '', 'SulSel', 'Indonesia', '912611', '');
-- 
-- SELECT * FROM employees;
-- UPDATE employees
-- SET officeCode = 8
-- WHERE officeCode = 4 AND jobTitle = 'Sales Rep'; 


-- SOAL NOMOR 3
USE db_praktikum;

-- ALTER TABLE mahasiswa
-- ADD COLUMN No_telp VARCHAR(20) NOT NULL,
-- ADD COLUMN Alamat VARCHAR(100),
-- ADD COLUMN Email VARCHAR(50) NOT NULL,
-- ADD COLUMN Keterangan VARCHAR(20);
-- 
DESC mahasiswa;

-- INSERT INTO mahasiswa (id_mahasiswa, nama, nim, jk, No_telp, Alamat, Email, Keterangan)
-- VALUES (060, 'ANDI MUH. IBNU HIBBAN BAGOES MALOLO', 'H071211060', 'L', '081243220103', 'Perumahan Puri', 'andibagoes1412@gmail.com', 'Semester 3'),
-- (037, 'EMHA ISMAULIDIN', 'H071201037', 'P', '08XXXXXXXXXX', 'IDK', 'emhaismaulidin@gmail.com', 'Semester 3'),
-- (009, 'EMILIA DAMAYANTI', 'H071211009', 'P', '08XYXXXXXXXX', 'IDK', 'emiliadamayanti@gmail.com', 'Semester 3'),
-- (016, 'ZABIL SABRI MUHAMMAD', 'H071211016', 'L', '08XXYXXXXXXX', 'IDK', 'zabilsabri@gmail.com', 'Semester 3'),
-- (021, 'AFLAH ALIFU NA MAPPATAJANG RAHMAN', 'H071211021', 'L', '08XXXYXXXXXX', 'IDK', 'aflahalifu@gmail.com', 'Semester 3'),
-- (074, 'WD. ANANDA LESMONO', 'H071211074', 'P', '08XXXXYXXXXX', 'IDK', 'anandalesmono@gmail.com', 'Semester 3'),
-- (011, 'BULQIS RAMADANI', 'H071211011', 'P', '08XXXXXYYXXX', 'IDK', 'bulqisramadhani@gmail.com', 'Semester 3'),
-- (067, 'ADHITYA FAJAR RISQI DJATI PRATAMA', 'H071211067', 'L', '08XXYYXXXXXX', 'IDK', 'adhityafajar@gmail.com', 'Semester 3'),
-- (076, 'HASAN AZYUMARDI AZRA', 'H071211076', 'L', '08XXXXXXXXYY', 'IDK', 'hasanazyumardi@gmail.com', 'Semester 3'),
-- (052, 'MUHAMMAD ARYA RAMDANI', 'H071211052', 'L', '08XYYYYXXXXX', 'IDK', 'aryaramdani@gmail.com', 'Semester 3'),
-- (001, 'INDAH KURNIA ILAHI', 'H071211001', 'P', '08XYYXXXXYYX', 'IDK', 'indahkurnia@gmail.com', 'Semester 3');

SELECT * FROM mahasiswa;

USE db_praktikum;


-- SOAL NOMOR 4 --
-- INSERT INTO buku (judul, tahun terbit, pengarang, id_buku) VALUES
-- ('Negeri 5 Menara', 2009, 'Ahmad Fuadi', 1),
-- ('Ranah 3 Warna', 2011, 'Ahmad Fuadi', 2),
-- ('Rantau 1 Muara', 2013, 'Ahmad Fuadi', 3),
-- ('Autumn in Paris', 2007, 'Ilana Tan', 4),
-- ('Winter in Tokyo', 2014, 'Ilana Tan', 5);
SELECT * FROM buku;
-- 
-- INSERT INTO pinjam (id_pinjam, tgl_pinjam, id_mahasiswa, id_buku, status_pengembalian) VALUES 
-- (001, '2014-12-16 16:30:40', 060, 1, 1),
-- (002, '2014-12-25 10:50:30', 074, 2, 1),
-- (003, '2013-1-12 12:10:15', 076, 3, 0),
-- (004, '2015-4-14 14:27:20', 052, 4, 1),
-- (005, '2017-6-12 19:20:50', 067, 5, 0);
SELECT * FROM pinjam;


-- SOAL NOMOR 5 --
-- INSERT INTO mahasiswa VALUES 
-- ('', 'Unknown', 'H071211100', 'L', '08XYXXYYYYYX', 'IDK', 'unknown@gmail.com', 'Tidak Diketahui'),
-- (NULL, 'Ndaktau', 'H071211101', 'P', '08XYYYYYXXY', 'IDK', 'ndaktau@gmail.com', 'Tidak Diketahui');
SELECT * FROM mahasiswa;
