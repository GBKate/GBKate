USE example;

UPDATE users 
SET created_at = NOW(), updated_at = NOW();

DROP TABLE IF EXISTS users;

CREATE TABLE users (
id SERIAL PRIMARY KEY,
name VARCHAR(255) COMMENT 'Имя покупателя',
birthday_at DATE COMMENT 'Дата рождения',
created_at VARCHAR(255),
updated_at VARCHAR(255)
);

INSERT INTO users (name, birthday_at, created_at, updated_at)
VALUES
('Ирина','1992-10-23','09.02.2018 12:32','09.02.2018 12:32'),
('Кирилл','1996-06-22','24.04.2015 14:35','24.04.2015 14:35'),
('Александр','1996-11-25','21.07.2015 15:37','21.07.2015 15:37'),
('Антон','1978-12-22','30.11.2013 22:32','30.11.2013 22:32'),
('Светлана','1999-07-30','21.08.2019 14:45','21.08.2019 14:45'),
('Евгений','1996-06-26','26.06.2016 16:36','26.06.2016 16:36');

SELECT STR_TO_DATE(created_at,'%d.%m.%Y %k:%i') FROM users;

UPDATE users 
SET 
created_at = STR_TO_DATE(created_at,'%d.%m.%Y %k:%i'),
updated_at = STR_TO_DATE(updated_at,'%d.%m.%Y %k:%i');

ALTER TABLE users 
CHANGE created_at 
created_at DATETIME DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE users 
CHANGE updated_at
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

DESCRIBE users;

DROP TABLE IF EXISTS storehouses_products; 
CREATE TABLE storehouses_products (
id SERIAL PRIMARY KEY,
storehouses_id INT UNSIGNED,
products_id INT UNSIGNED,
value INT UNSIGNED COMMENT 'Запас товарной позиции на складе',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


INSERT INTO 
storehouses_products (storehouses_id, products_id, value)
VALUES 
(1,333,4),
(1,3455,2433),
(1,456,0),
(1,45789,0),
(1,645,599),
(1,985,1);


SELECT * FROM storehouses_products ORDER BY value;
SELECT id,value, IF(value > 0,0,1) AS sort FROM storehouses_products ORDER BY value;

SELECT * FROM storehouses_products ORDER BY IF(value > 0,0,1), value;

-- Задание по желанию №4
-- 1
SELECT name, date_format(
birthday_at, '%M') FROM users; 

SELECT name FROM users WHERE date_format(birthday_at, '%M') = 'june';

SELECT name FROM users WHERE date_format(birthday_at, '%M') IN ('june', 'july');
-- 2
SELECT * FROM catalogs WHERE id IN (5, 1, 2);

SELECT field(0,5,1,2);

SELECT id, name, field(id, 5,1,2,0) AS pos FROM catalogs WHERE id IN (5,1,2,0); 

SELECT * FROM catalogs WHERE id IN (5,1,2,0) ORDER BY field(id,5,1,2,0); 

