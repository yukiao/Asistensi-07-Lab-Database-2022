CREATE TABLE buku (
judul VARCHAR(255),
`tahun terbit` INT,
pengarang VARCHAR(255),
id_buku INT NOT NULL auto Increment,
PRIMARY KEY (id_buku));

CREATE TABLE mahasiswa (
nama VARCHAR (255),
nim VARCHAR(10) NOT NULL,
jk CHAR (1),
id_mahasiswa BIGINT UNSIGNED NOT NULL auto increment,
PRIMARY KEY (id_mahasiswa),
UNIQUE (nim));

CREATE TABLE pinjam (
tgl_pinjam DATETIME,
id_mahasiswa BIGINT UNSIGNED NOT NULL auto increment,
id_buku INT NOT NULL auto increment,
status_pengembalian TINYINT(1) DEFAULT 0,
id_pinjam INT UNSIGNED,
PRIMARY KEY (id_pinjam),
FOREIGN KEY (id_mahasiswa) REFERENCES mahasiswa (id_mahasiswa),
FOREIGN KEY (id_buku) REFERENCES buku (id_buku)
)

