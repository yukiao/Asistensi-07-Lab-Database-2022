DESCRIBE offices;
SELECT * FROM offices;
SELECT * FROM employees WHERE officeCode="8";
DESCRIBE employees

#Nomor 1
INSERT INTO employees(employeeNumber, lastName, firstName, extension, email, officeCode, reportsTo, jobTitle)
VALUES 
(1, "Alifu", "Aflah", "x103", "ralif@gmail.com", "3", 1102, ""), 
(2, "Tidur", "Putri", "x104", "putri@gmail.com", "4", 1102, ""), 
(3, "Toto", "Liga", "x105", "toto@gmail.com", "6", 1102, "");


#Nomor 2
INSERT INTO offices(officeCode, city, phone, addressLine1, addressLine2, state, country, postalCode, territory)
VALUES 
("8", "Jakarta", "+62 888 888 8888", "23 Perintis Street", "Floor #77", "DKI", "Indonesia", "14110", "APAC");

UPDATE employees
SET officeCode = "8"
WHERE officeCode = "4" AND jobTitle = "Sales Rep";