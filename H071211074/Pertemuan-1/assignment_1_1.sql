USE praktikum1;

#No.1 
CREATE TABLE offices(
	officeCode VARCHAR (10) NOT NULL,
	city VARCHAR (50) NOT NULL,
	phone VARCHAR (50) NOT NULL,
	addressline1 VARCHAR (50) NOT NULL,
	addressline2 VARCHAR (50),
	state VARCHAR(50),
	country VARCHAR(50) NOT NULL,
	PRIMARY KEY (officeCode)
);

#No.2
DESCRIBE offices;

#No.3
ALTER TABLE offices
MODIFY phone INT (20);

#NO.4
ALTER TABLE offices
DROP addressline2