use db_praktikum;

ALTER TABLE mahasiswa
modify column No_telp varchar (20) not null ,
modify column Alamat varchar (100) ,
modify column Email varchar (50) not null ,
modify column Keterangan varchar (20) ;

-- No. 3
INSERT INTO mahasiswa (nama, nim, jk, no_telp, email, alamat, keterangan)
VALUES
('Emilia Damayanti' , 'H071211009' , 'P' , '089654706038' , 'emilia@gmail.com' , 'BTN Anugrah' , 'Semester 3') ,
('Zabil Sabri' , 'H071211016' , 'L' , '081234567890' , 'zabil@gmail.com' , 'Batua' , 'Semester 3') ,
('Aflah Alifu' , 'H071211021' , 'L' , '085732990225' , 'aflah@gmail.com' , 'Rappocini' , 'Semester 3') ,
('WD. Ananda' , 'H071211074' , 'P' , '083452789001' , 'ananda@gmail.com' , 'Jl. Serigala' , 'Semester 3') ,
('Bulqis Ramadhani' , 'H071211011' , 'P' , '088511233455' , 'bulqis@gmail.com' , 'Citra Garden' , 'Semester 3') ,
('Adhitya Fajar' , 'H071211067' , 'L' , '081355421900' , 'adhit@gmail.com' , 'Kost Pelangi' , 'Semester 3') ,
('Andi Muh. Ibnu' , 'H071211060' , 'L' , '089673266099' , 'ibnu@gmail.com' , 'Citra Land' , 'Semester 3') ,
('Hasan Azyumardi' , 'H071211076' , 'L' , '087655233456' , 'hasan@gmail.com' , 'Bumi Batara Mawang' , 'Semester 3') ,
('Muh. Arya' , 'H071211052' , 'L' , '081211311455' , 'arya@gmail.com' , 'Jl. Alauddin' , 'Semester 3') ,
('Indah Kurnia' , 'H071211001' , 'P' , '087899052674' , 'indah@gmail.com' , 'Tamalanrea' , 'Semester 3');

-- No. 4
INSERT INTO buku
VALUES
("Another" , 2009 , "Yukito Ayatsuji", 1) ,
('Death Note' , 2003 , 'Tsugumi Ohba', 2) ,
('Tentang Kamu' , 2016 , 'Tere Liye', 3) ,
('Penulis Tua' , 2018 , 'Haryo Pamungkas', 4) ,
('Sunshine Becomes You' , 2012 , 'Ilana Tan', 5) ;

INSERT INTO pinjam
VALUES
("2021-02-13 09:00:00" , 29, 1, 0, 1) ,
("2021-04-20 18:00:22" , 37, 3, 0, 2) ,
("2022-05-19 16:00:13" , 31, 2, 0, 3) ,
("2020-08-17 11:00:03" , 33, 5, 0, 4) ,
("2019-01-23 06:00:23" , 29, 4, 0, 5) ;

-- No. 5
INSERT INTO mahasiswa
VALUES
('Tobiyolo Swageyama' , 'Z071211002' , 'L' ,100, '087899052874' , 'Kageyama@gmail.com' , ' ' , 'semester 1') ,
('Oikawa Tooru' , 'Z031211002' , 'L' ,101, '087899052874' , 'oikawa@gmail.com' , null , 'semester 1');
