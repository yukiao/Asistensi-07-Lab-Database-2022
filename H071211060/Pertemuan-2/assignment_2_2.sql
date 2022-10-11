USE classicmodels;

SELECT * FROM orderDetails WHERE quantityOrdered > 70 ORDER BY orderLineNumber ASC;