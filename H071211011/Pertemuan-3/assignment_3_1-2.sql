USE classicmodels;
-- No 1
-- Tambahkanlah 3 orang employee baru pada tabel employees dalam database Classic Models 
-- dengan salah satu nama employee merupakan nama anda
INSERT INTO employees
VALUE (1129, "Ramadani", "Bulqis", "x200", "bulqis@gmail.com", 3, 1088, "Data Analyst"),
		(1130, "Hikmah", "Nur", "x200", "hikmah@gmail.com", 3, 1088, "Web Developer"),
		(1131, "Istiqamah", "Fadilah", "x200", "fadilah@gmail.com", 3, 1088, "Data Analyst");

-- No 2
-- Dalam database classic models, sebuah kantor baru didirikan untuk para karyawannya 
-- (employee). Pihak pengelola database ingin memindahkan beberapa karyawan ke kantor baru tersebut. 
-- Buatlah sebuah query untuk memindahkan karyawan berjabatan Sales Rep dari kantor 4, ke kantor yang baru!

INSERT INTO offices
VALUE ('8', 'Jakarta', '+6282196035383', 'Jl.Melati', 'Jl.Mawar', 'Jawa Barat', 'IND', '90753', 'BTS');

UPDATE employees
SET officeCode = 8
WHERE officeCode = 4 AND jobTitle ='Sales Rep';

SELECT * FROM offices;
SELECT * FROM employees;

