-- 11.1.1 Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, 
-- catalogs и products в таблицу logs помещается время и дата создания записи, название таблицы, 
-- идентификатор первичного ключа и содержимое поля name.

DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
	name VARCHAR(255) COMMENT 'Название таблицы',
	id_from_table INT UNSIGNED,
	name_from_table VARCHAR(255) COMMENT 'Содержимое поля name',
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP
	) COMMENT = 'логи' ENGINE = ARCHIVE;

DELIMITER //

DROP TRIGGER IF EXISTS users_logs_insert//
CREATE TRIGGER logs_insert AFTER INSERT ON users
FOR EACH ROW
BEGIN
INSERT INTO logs (name, id_from_table, name_from_table) SELECT 'users' AS name, id, name FROM users ORDER BY id DESC LIMIT 1;
END//

DROP TRIGGER IF EXISTS catalogs_logs_insert//
CREATE TRIGGER logs_insert AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN
INSERT INTO logs (name, id_from_table, name_from_table) SELECT 'catalogs' AS name, id, name FROM catalogs ORDER BY id DESC LIMIT 1;
END//

DROP TRIGGER IF EXISTS products_logs_insert//
CREATE TRIGGER logs_insert AFTER INSERT ON products
FOR EACH ROW
BEGIN
INSERT INTO logs (name, id_from_table, name_from_table) SELECT 'products' AS name, id, name FROM products ORDER BY id DESC LIMIT 1;
END//

-- 11.1.2 (по желанию) Создайте SQL-запрос, который помещает в таблицу users миллион записей.

SET @max_id = (SELECT max(users.id) FROM users);
SELECT @max_id;
DROP PROCEDURE IF EXISTS million_inserts//
CREATE PROCEDURE million_inserts(IN num int)
BEGIN
	DECLARE i int;
    SET i = (@max_id + 1);
	WHILE i <= (num + @max_id) DO 
		INSERT INTO users (id, name, birthday_at) VALUES (i, NULL, NULL);
		SET i = i + 1;
	END WHILE;
END//


