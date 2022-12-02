USE classicmodels;

SELECT * FROM customers WHERE country!='USA' AND creditLimit='0' ORDER BY customerName ASC LIMIT 5 OFFSET 6;