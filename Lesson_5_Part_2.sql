-- Часть 2  «Агрегация данных
 USE example;
-- 1 
SELECT TIMESTAMPDIFF(YEAR, birthday_at, NOW()) AS age FROM users;

SELECT avg(TIMESTAMPDIFF(YEAR, birthday_at, NOW())) AS age FROM users;
-- 2
SELECT name, birthday_at FROM users;

SELECT MONTH (birthday_at), DAY(birthday_at) FROM users;

SELECT YEAR(NOW()), MONTH (birthday_at), DAY(birthday_at) FROM users;

SELECT concat_ws('-', YEAR(NOW()), MONTH (birthday_at), DAY(birthday_at)) FROM users;

SELECT DATE(concat_ws('-', YEAR(NOW()), MONTH (birthday_at), DAY(birthday_at))) FROM users;

SELECT date_format(DATE(concat_ws('-', YEAR(NOW()), MONTH (birthday_at), DAY(birthday_at))), '%W') FROM users;

SELECT date_format(DATE(concat_ws('-', YEAR(NOW()), MONTH (birthday_at), DAY(birthday_at))), '%W') AS day, COUNT(*) AS total FROM users GROUP BY day;

SELECT date_format(DATE(concat_ws('-', YEAR(NOW()), MONTH (birthday_at), DAY(birthday_at))), '%W') AS day, COUNT(*) AS total FROM users GROUP BY day ORDER BY total DESC;

-- 3 Произведение чисел в таблице 

SELECT id FROM catalogs;

SELECT LN(id) FROM catalogs;

SELECT sum(LN(id)) FROM catalogs;

SELECT EXP(sum(LN(id))) FROM catalogs;





