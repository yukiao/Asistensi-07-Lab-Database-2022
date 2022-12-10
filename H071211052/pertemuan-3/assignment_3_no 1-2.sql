USE classicmodels;

-- Soal 1
-- SELECT * FROM employees;
-- INSERT INTO employees (employeeNumber, lastName, firstName, extension, email, officeCode, reportsTo, jobTitle)
-- VALUE (2708, 'Ramdani', 'Arya', 'x2131', 'jamesfidel123@gmail.com', 2, 1501,'Sales Rep');
-- 
-- INSERT INTO employees
-- VALUE (2709, 'kawe', 'kadita', 'x2132', 'joanfarel@yahoo.com', 1, 1165, 'Sales Rep');
-- 
-- INSERT INTO employees (employeeNumber, firstName, extension, officeCode, reportsTo, jobTitle)
-- VALUE (2710, 'Vanesa', 'x2133', 3, 1166, 'Sales Rep');

-- Soal 2
SELECT * FROM offices
-- INSERT INTO offices (officeCode, city, phone, addressLine1, addressLine2, state, country, postalCode, territory)
-- VALUE (8, 'West Edgardofort', '+(874) 824-4874', '7316 Keefe Ford', NULL, 'Maryland', 'USA', 80166, 'NA');

-- SELECT * FROM employees;
-- UPDATE employees
-- SET officeCode = 8
-- WHERE  jobTitle = 'Sales Rep' AND officeCode = 4;