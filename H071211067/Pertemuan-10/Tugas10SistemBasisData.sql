SELECT customers.customerName, (customers.creditLimit - sum(orderdetails.quantityOrdered * orderdetails.priceEach)) AS 'Total',
case 
	when (customers.creditLimit - sum(orderdetails.quantityOrdered * orderdetails.priceEach)) > 0 then "You are safe"
	when (customers.creditLimit - sum(orderdetails.quantityOrdered * orderdetails.priceEach)) < 0 then "You are in debt"
	ELSE "You are running out of credits"
END AS 'Are You Safe?'
FROM customers
INNER JOIN orders
USING (customerNumber)
INNER JOIN orderdetails
USING (orderNumber)
GROUP BY customers.customerNumber;