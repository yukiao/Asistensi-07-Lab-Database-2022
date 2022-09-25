-- No. 1
USE DATABASE1;

CREATE TABLE if not exists office (
officeCode VARCHAR (10) NOT NULL ,
city VARCHAR (50) NOT NULL ,
phone VARCHAR (50) NOT NULL ,
adressline1 VARCHAR (50) NOT NULL ,
adressline2 VARCHAR (50) ,
state VARCHAR (50) ,
country VARCHAR (50) NOT NULL ,
PRIMARY KEY (officeCode)
);

-- No. 2 
DESCRIBE office;

-- No.3
ALTER TABLE office
MODIFY phone int (20);

-- No. 4
ALTER TABLE office
DROP adressline2 ;


