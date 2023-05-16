-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
SELECT id_oder, date_oder, total_price_customer FROM oder;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
SELECT c.name_customer, p.name_product
FROM customer c
JOIN oder o ON c.id_customer = o.id_customer
JOIN oder_detail od ON o.id_oder = od.id_oder
JOIN product p ON od.id_product = p.id_product;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
SELECT c.name_customer
FROM customer c
LEFT JOIN oder o ON c.id_customer = o.id_customer
LEFT JOIN oder_detail od ON o.id_oder = od.id_oder
WHERE od.id_oder IS NULL;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của 
-- từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
SELECT o.id_oder AS OrderID, o.date_oder AS OrderDate, SUM(od.oder_qty * p.price_product) AS TotalPrice
FROM oder o
JOIN oder_detail od ON o.id_oder = od.id_oder
JOIN product p ON od.id_product = p.id_product
GROUP BY  o.date_oder;
