USE classicmodels;

SELECT c.customerName, (c.creditLimit - SUM(od.quantityOrdered * od.priceEach)) 'total',
case
   when (c.creditLimit - SUM(od.quantityOrdered * od.priceEach)) > 0 then "you are safe"
   when (c.creditLimit - SUM(od.quantityOrdered * od.priceEach)) < 0 then "you are in debt"
   when (c.creditLimit - SUM(od.quantityOrdered * od.priceEach)) = 0 then "you are running out of credits "
ELSE "Lose"
END AS `Are you safe?`
FROM customers c 
JOIN orders o 
USING(customerNumber)
JOIN orderdetails od 
USING(orderNumber) 
GROUP BY c.customerNumber;