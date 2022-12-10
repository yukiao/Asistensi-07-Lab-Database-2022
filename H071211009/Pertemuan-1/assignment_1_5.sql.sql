create database db_praktikum;
use db_praktikum;

create table if not exists buku (
judul VARCHAR (225) ,
`tahun terbit` int ,
pengarang VARCHAR (225) ,
id_buku int auto_increment,
PRIMARY KEY (id_buku)
);

create table if not exists mahasiswa (
nama varchar (225) ,
nim varchar (10) unique,
jk char (1) ,
id_mahasiswa bigint unsigned auto_increment,
PRIMARY KEY (id_mahasiswa)
);

create table if not exists pinjam (
tgl_pinjam datetime ,
id_mahasiswa bigint unsigned,
id_buku int ,
status_pengembalian tinyint (1) default 0,
id_pinjam int unsigned auto_increment ,
PRIMARY KEY (id_pinjam) ,
FOREIGN KEY (id_mahasiswa) references mahasiswa(id_mahasiswa) ,
FOREIGN KEY (id_buku) references buku(id_buku)
);

-- desc buku ;
-- desc mahasiswa ;
desc pinjam ;
