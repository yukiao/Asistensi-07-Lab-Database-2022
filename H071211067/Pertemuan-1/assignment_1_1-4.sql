-- No.1
CREATE DATABASE Tugas1PraktikumSistemBasisData;

USE Tugas1PraktikumSistemBasisData; 

CREATE TABLE offices (
officeCode VARCHAR (10) NOT NULL,
city VARCHAR (50) NOT NULL,
phone VARCHAR (50) NOT NULL,
addresline1 VARCHAR (50) NOT NULL,
addresline2 VARCHAR (50),
state VARCHAR (50),
country VARCHAR (50) NOT NULL,
PRIMARY KEY (officeCode)
);

-- No.2
DESC offices;

-- No.3
ALTER TABLE offices
MODIFY phone INT (20) NOT NULL,

-- No.4
DROP addresline2;

DESC offices;