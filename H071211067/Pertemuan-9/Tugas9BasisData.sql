USE classicmodels
SHOW VARIABLES LIKE '%autocommit%';
SET autocommit = 0;
                                                                                                                                                                                               
-- No. 1
BEGIN;
INSERT INTO orders 
VALUES (10000, '2004-05-23', '2004-05-23', '2004-05-23', 'Shipped', NULL, 128),
		 (10001, '2004-05-23', '2004-05-23', '2004-05-23', 'Shipped', NULL, 128),
		 (10002, '2004-05-23', '2004-05-23', '2004-05-23', 'Shipped', NULL, 128);

INSERT INTO orderdetails 
VALUES (10000, 'S18_1749', 10, 136.0, 1),
		 (10001, 'S18_1749', 10, 136.0, 1),
		 (10002, 'S18_1749', 10, 136.0, 1);
COMMIT; 
SELECT * FROM orderdetails;
-- SELECT * FROM orders;

-- No. 2
BEGIN;
DELETE FROM orderdetails;
ROLLBACK;