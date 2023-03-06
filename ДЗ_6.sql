USE vk_1;

-- 6.1 Пусть задан некоторый пользователь. 
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

-- 6.2 Подсчитать общее количество лайков, которые получили пользователи младше 10 лет

SELECT count(*) AS 10_years_likes FROM likes WHERE user_id IN (SELECT user_id FROM profiles WHERE TIMESTAMPDIFF(YEAR, birthday, NOW()) < 10);

-- 6.3 Определить кто больше поставил лайков (всего): мужчины или женщины.

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
