USE example;

-- INSERT INTO products (id, name, desription, price)  
-- VALUES ('1', 'intel', 'процессор', '902948');

-- ЗАДАНИЕ 1
SELECT * FROM users;
SELECT * FROM orders;
-- заказ1
INSERT INTO orders (user_id)
SELECT id FROM users WHERE name = 'Ирина';

INSERT into orders_products (order_id, product_id, total)
SELECT last_insert_id(), id, 2 FROM products 
WHERE name = 'Intel';
-- заказ 2
INSERT INTO orders (user_id)
SELECT id FROM users WHERE name = 'Кирилл';

INSERT into orders_products (order_id, product_id, total)
SELECT last_insert_id(), id, 2 FROM products 
WHERE name IN ('Intel 2.0', 'GIGABYTE');
-- заказ 3
INSERT INTO orders (user_id)
SELECT id FROM users WHERE name = 'Александр';

INSERT INTO orders_products (order_id, product_id, total)
SELECT last_insert_id(), id, 1 FROM products 
WHERE name IN ('AMD FX-0988', 'ASUS ROG');

SELECT DISTINCT user_id FROM orders;

SELECT id, name, birthday_at FROM users u WHERE id IN (SELECT DISTINCT user_id FROM orders);

-- или 

SELECT u.id, u.name, u.birthday_at
from users AS u
JOIN orders AS o 
ON u.id = o.user_id;

-- задание 2
-- так как у меня пустая таблица  продуктов, то перед выполнением задания я заполнила таблицу;
/*INSERT INTO products (id, name, desription, price, catalog_id)  
VALUES ('1', 'intel', 'процессор', '902948', '1');
INSERT INTO products (id, name, desription, price, catalog_id)  
VALUES ('3', 'AMD FX-0988', 'процессор', '45000', '3');
INSERT INTO products (id, name, desription, price, catalog_id)  
VALUES ('2', 'ASUS ROG', 'пк', '78000', '3');
INSERT INTO products (id, name, desription, price, catalog_id)  
VALUES ('4', 'Intel 2.0', 'процессор', '4999', '1');
INSERT INTO products (id, name, desription, price, catalog_id)  
VALUES ('5', 'GIGABYTE', 'другое', '4999', '4');*/


SELECT * From products;
SELECT * FROM catalogs;

SELECT id, name, price,
(SELECT name FROM catalogs WHERE id = products.catalog_id) AS catalog 
FROM products;
