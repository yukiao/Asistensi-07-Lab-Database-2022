CREATE TABLE offices(
	officecode VARCHAR(10) NOT NULL,
	city VARCHAR(50) NOT NULL,
	phone VARCHAR(50) NOT NULL,
	addressline1 VARCHAR(50) NOT NULL,
	addressline2 VARCHAR(50),
	state VARCHAR(50),
	country VARCHAR(50) NOT NULL,
	PRIMARY KEY(officecode)
) -- nomor 1

DESCRIBE offices -- [nomor 2]

-- nomor 3
ALTER TABLE offices
MODIFY phone INT(20)

-- nomor 4
ALTER TABLE offices
DROP addressline2
