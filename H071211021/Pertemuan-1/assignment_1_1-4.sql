CREATE TABLE offices (
officeCode VARCHAR (10) NOT NULL,
city VARCHAR (50) NOT NULL,
phone VARCHAR (50) NOT NULL,
adressline1 VARCHAR (50) NOT NULL,
adressline2 VARCHAR (50),
state VARCHAR (50),
country VARCHAR (50),
PRIMARY KEY (officeCode));

DESCRIBE offices;

ALTER TABLE offices
MODIFY phone INT(20);

ALTER TABLE offices
DROP adressline2