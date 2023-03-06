/*mysql> show databases
    -> ;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| world              |
+--------------------+
6 rows in set (0.01 sec)

mysql> create database example
    -> ;
Query OK, 1 row affected (0.01 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| example            |
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| world              |
+--------------------+
7 rows in set (0.00 sec)

mysql> use example*/

USE example;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
id int UNSIGNED NOT NULL,
name varchar(255)
);

INSERT INTO users VALUES (1, 'Kate');
SELECT * FROM users;