-- No. 1
INSERT INTO employees
VALUES
('3000', 'Fajar', 'Aditya', 'L001', 'levafr@gmail.com', 3, '3000', 'Sales Rep'),
('3001', 'Yonathan', 'Pauline', 'L002', 'paulineyonathan@gmail.com', 3, '3001', 'Sales Rep'),
('3002', 'Azyumardi', 'Hasan', 'L003', 'hasanazyumardi@gmail.com', 3, '3002', 'Sales Rep');

-- NO. 2
INSERT INTO offices
VALUES (8, 'Makassar', '+6282259256328', 'Tamalanrea', 'Jalan Sahabat', NULL, 'Indonesia', 'LEV1', 'NA');

UPDATE employees
SET officeCode=8
WHERE officeCode=4 AND jobTitle='Sales Rep'

ALTER TABLE mahasiswa
MODIFY no_telp VARCHAR (20) NOT NULL,
MODIFY alamat VARCHAR (100),
MODIFY email VARCHAR (50) NOT NULL ,
MODIFY keterangan VARCHAR (20);

-- No. 3
INSERT INTO mahasiswa (nama, nim, jk, no_telp, email, alamat, keterangan)
VALUES 
('Adit', 'H071211069', 'L', '082259256328', 'levafr369@gmail.com', 'Jalan Sahabat', 'Semester 3');
('Aim', 'H071211038', 'L', '082259256028', 'aim@gmail.com', 'Jalan Sahabat', 'Semester 3'),
('Aqid', 'H071211025', 'L', '082259256128', 'aqid@gmail.com', 'Jalan Sahabat', 'Semester 3'),
('Astrina', 'H071211016', 'P', '082259256228', 'astrina@gmail.com', 'Jalan Sahabat', 'Semester 3'),
('Cindy', 'H071211009', 'P', '082259256428', 'cindy@gmail.com', 'Jalan Sahabat', 'Semester 3'),
('Emilia', 'H071211062', 'P', '082259256528', 'emilia@gmail.com', 'Jalan Sahabat', 'Semester 3'),
('Fira', 'H071211008', 'P', '082259256628', 'fira@gmail.com', 'Jalan Sahabat', 'Semester 3'),
('Hudry', 'H071211077', 'L', '082259256728', 'hudry@gmail.com', 'Jalan Sahabat', 'Semester 3'),
('Isty', 'H071211005', 'P', '082259256828', 'isty@gmail.com', 'Jalan Sahabat', 'Semester 3'),
('Kappi', 'H071211013', 'L', '082259256928', 'kappi@gmail.com', 'Jalan Sahabat', 'Semester 3');

SELECT * FROM mahasiswa

-- No. 4
INSERT INTO buku
VALUES
(1, 'The 5 Levels Of Leadership', 2011, 'John C. Maxwell'),
(2, 'Teknik Hacking Android', 2019, 'Dedik Kurniawan'),
(3, 'Kitab Hacker', 2019, 'Dedik Kurniawan'),
(4, 'Step By Step Membuat Toko Online', 2019, 'Dedik Kurniawan'),
(5, 'Most Wanted Laptop/Notebook', 2008, 'Mochammad Hidayatullah');

SELECT * FROM buku

INSERT INTO pinjam
VALUES
(1, '2022-10-03 15:00:00', 1, 1, 0),
(2, '2022-10-03 15:00:00', 1, 2, 0),
(3, '2022-10-03 15:00:00', 1, 3, 0),
(4, '2022-10-03 15:00:00', 1, 4, 0),
(5, '2022-10-02 15:00:00', 1, 5, 1);

SELECT * FROM pinjam

-- No. 5
INSERT INTO mahasiswa (id_mahasiswa, nama, jk, no_telp, email, alamat, keterangan)
VALUES (11, 'Unknown', 'L' , '082259250000', 'unknown@gmail.com', 'Jalan Damai', 'Semester 5');

INSERT INTO mahasiswa (id_mahasiswa, nama, nim, jk, no_telp, email, alamat, keterangan)
VALUES (12, NULL, 'H071201003', 'L' , '082259250000', 'unknown@gmail.com', 'Jalan Damai', 'Semester 5');

INSERT INTO mahasiswa (nama, nim, jk, no_telp, email, alamat, keterangan)
VALUES
('Kak Sony', 'H071191001', 'L', '082200000000', 'sony@gmail.com', 'Jalan Perintis Kemerdekaan', 'Semester 7');

INSERT INTO mahasiswa (nim, nama, jk, no_telp, email, alamat, keterangan)
VALUES
('H071211000', 'Seseorang', 'L', '082200000001', 'seseorang@gmail.com', 'Jalan Jalan', 'Semester 9');