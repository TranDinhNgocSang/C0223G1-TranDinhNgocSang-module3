INSERT INTO `ss2_bai_tap_quan_ly_ban_hang`.`customer` (`id_customer`, `name_customer`, `age_customer`) 
VALUES ('1', 'Minh Quan', '10'),('2', 'Ngoc Oanh', '20'),('3', 'Hong Ha', '50');

INSERT INTO `ss2_bai_tap_quan_ly_ban_hang`.`oder` (`id_oder`, `id_customer`, `date_customer`,`total_price_customer`) 
VALUES ('1', '1', '2006-03-21',null),('2', '2', '2006-03-23',null),('3', '1', '2006-03-16',null);

INSERT INTO `ss2_bai_tap_quan_ly_ban_hang`.`product` (`id_product`, `name_product`, `price_product`)
VALUES ('1', 'May Giat', '3'),('2', 'Tu Lanh', '5'),('3', 'Dieu Hoa', '7'),('4', 'Quat', '1'),('5', 'Bep Dien', '2');

INSERT INTO `ss2_bai_tap_quan_ly_ban_hang`.`oder_detail` (`id_oder`, `id_product`, `oder_qty`) 
VALUES ('1', '1', '3'),('1', '3', '7'),('1', '4', '2'),('2', '1', '1'),('3', '1', '8'),('2', '5', '4'),('2', '3', '3');
