USE vk_1;

-- 8.1 Пусть задан некоторый пользователь. 
-- Из всех пользователей соц. сети найдите человека, 
-- который больше всех общался с выбранным пользователем (написал ему сообщений).

SELECT * FROM messages;

SELECT
    from_user_id,
    COUNT(*) as msg 
FROM messages 
WHERE to_user_id = 1
GROUP BY from_user_id
ORDER BY msg DESC LIMIT 1;

-- JOIN
SELECT from_user_id, count(*) AS msg, firstname, lastname, email, phone FROM messages AS m
JOIN users AS u ON u.id = m.from_user_id WHERE m.to_user_id = 1
GROUP BY m.from_user_id
ORDER BY msg DESC LIMIT 1;

-- 8.2 Подсчитать общее количество лайков, которые получили пользователи младше 10 лет

SELECT user_id FROM profiles WHERE TIMESTAMPDIFF(YEAR, birthday, NOW()) < 10;

SELECT count(*) AS 10_years_likes FROM likes WHERE user_id IN (SELECT user_id FROM profiles WHERE TIMESTAMPDIFF(YEAR, birthday, NOW()) < 10);

-- JOIN
SELECT count(*) AS 10_years_likes FROM likes AS l
JOIN profiles AS p ON p.user_id = l.user_id WHERE TIMESTAMPDIFF(YEAR, birthday, NOW()) < 10;

SELECT l.user_id, firstname, lastname, email, phone FROM likes AS l
JOIN users AS u ON u.id = l.user_id
JOIN profiles AS p ON p.user_id = l.user_id WHERE TIMESTAMPDIFF(YEAR, birthday, NOW()) < 10;

-- 8.3 Определить кто больше поставил лайков (всего): мужчины или женщины.

SELECT count(*) AS likes, (SELECT CASE (gender)
         WHEN 'm' THEN 'male'
         WHEN 'f' THEN 'female'
    END AS gender
    FROM profiles WHERE user_id = 3) AS 'gender' FROM likes WHERE user_id IN (SELECT user_id FROM profiles WHERE gender = 'm')
UNION
SELECT count(*) AS likes, (SELECT CASE (gender)
         WHEN 'm' THEN 'male'
         WHEN 'f' THEN 'female'
    END AS gender
    FROM profiles WHERE user_id = 2) AS 'gender' FROM likes WHERE user_id IN (SELECT user_id FROM profiles WHERE gender = 'f')
ORDER BY likes DESC LIMIT 1;

-- JOIN

SELECT count(*) AS likes, p.gender FROM likes AS l
JOIN profiles AS p ON p.user_id = l.user_id WHERE gender LIKE 'f'
UNION
SELECT count(*) AS likes, p.gender FROM likes AS l
JOIN profiles AS p ON p.user_id = l.user_id WHERE gender LIKE 'm'
ORDER BY likes DESC LIMIT 1;

-- Я наконец-то упростила запрос

SELECT count(l.id) AS likes, p.gender FROM likes AS l
JOIN profiles AS p ON p.user_id = l.id GROUP BY p.gender ORDER BY likes DESC LIMIT 1;



