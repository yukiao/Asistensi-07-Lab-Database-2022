use classicmodels;

-- No. 1
INSERT INTO employees
VALUES
(1727 , 'Damayanti' , 'Emilia' , 'x127' , 'emilia@gmail.com' , '7' , 1102 , 'Programmer') ,
(1825 , 'Ramadhani' , 'Bulqis' , 'x131' , 'bulqis@gmail.com' , '7' , 1102 , 'CEO') ,
(1991 , 'Tachibana' , 'Makoto' , 'x127' , 'makoto@gmail.com' , '7' , 1102 , 'Hokage') ;

-- No. 2
INSERT INTO offices
VALUES (8, 'Surabaya', '+62 85231777329', 'Jl. Ahmad Yani', 'Number 27', 'East Java', 'Indonesia', 60111, 'NA');

UPDATE employees SET officeCode = 8 WHERE officeCode = 4 AND jobTitle = 'Sales Rep';


