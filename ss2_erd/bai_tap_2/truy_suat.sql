SELECT id_oder, date_customer, total_price_customer FROM oder;

SELECT c.name_customer, p.name_product
FROM customer c
JOIN oder o ON c.id_customer = o.id_customer
JOIN oder_detail od ON o.id_oder = od.id_oder
JOIN product p ON od.id_product = p.id_product;

SELECT c.name_customer AS CustomerName
FROM customer c
LEFT JOIN oder o ON c.id_customer = o.id_customer
LEFT JOIN oder_detail od ON o.id_oder = od.id_oder
WHERE od.id_oder IS NULL;

SELECT o.id_oder AS OrderID, o.date_customer AS OrderDate, SUM(od.oder_qty * p.price_product) AS TotalPrice
FROM oder o
JOIN oder_detail od ON o.id_oder = od.id_oder
JOIN product p ON od.id_product = p.id_product
GROUP BY o.id_oder, o.date_customer;