-- UPDATE productLines
-- SET textDescription = 'tes'
-- WHERE productLine = 'Classic Cars' 
-- AND productLine = 'Classic Cars';
-- SELECT * FROM productlines;
-- 
-- INSERT INTO productLines(productLine, textDescription)
-- VALUES ('Racing Cars', 'a new generation cars');

-- SELECT productline, textDescription FROM productlines;

-- INSERT INTO products (productCode, productName, productLine, productScale, productVendor, productDescription, quantityInStock, buyPrice, MSRP)
-- VALUES ('S18_6669', 'Mustang GT XS', 'Racing Cars', '1 : 10', 'MustangProduct', 'the new generation', 10, 100.0, 69);

-- SELECT * FROM products WHERE productName = 'Mustang Gt XS';
-- DELETE FROM payments WHERE YEAR(paymentDate) = '2003' AND amount < 10000;
SELECT * FROM payments WHERE YEAR(paymentDate) = '2003' AND amount < 10000;
-- SET SQL_SAFE_UPDATES = 0;
-- DELETE FROM payments WHERE paymentDate BETWEEN '2003-01-01' AND '2003-12-31' AND amount < 10000;
