DROP DATABASE IF EXISTS vk;
CREATE DATABASE vk;
USE vk;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id bigint UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	#id serial, #bigint UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
	firstname varchar(50),
	lastname varchar(50),
	email varchar(100) UNIQUE,
	phone bigint UNSIGNED UNIQUE,
	password_hash varchar(256),
	
	#создание индекса внутри таблицы
	INDEX idx_users_username (firstname, lastname)
);

DROP TABLE IF EXISTS profiles;
CREATE TABLE profiles (
	user_id bigint UNSIGNED NOT NULL PRIMARY KEY,
	gender char(1),
	hometown varchar(100),
	created_at datetime DEFAULT now()
);

#изменение таблицы и добавление связей между таблицами
ALTER TABLE profiles ADD CONSTRAINT fk_profiles_user_id
FOREIGN KEY (user_id) REFERENCES users (id);

DROP TABLE IF EXISTS messages;
CREATE TABLE messages (
	id serial,
	from_user_id bigint UNSIGNED NOT NULL,
	to_user_id bigint UNSIGNED NOT NULL,
	body text,
	created_at datetime DEFAULT now(),
	
	#создать внешний ключ внутри таблицы:
	FOREIGN KEY (from_user_id) REFERENCES users(id),
	FOREIGN KEY (to_user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS friend_requests;
CREATE TABLE friend_requests (
	initiator_user_id bigint UNSIGNED NOT NULL,
	target_user_id bigint UNSIGNED NOT NULL,
	requested_at datetime DEFAULT now(),
	updated_at datetime ON UPDATE now(),
	status enum('requested', 'approved', 'declined', 'unfriended'),
	PRIMARY KEY (initiator_user_id, target_user_id),
	#создать внешний ключ внутри таблицы:
	FOREIGN KEY (initiator_user_id) REFERENCES users(id),
	FOREIGN KEY (target_user_id) REFERENCES users(id),
	CHECK (initiator_user_id != target_user_id)
);

#добавить проверку после формирования таблицы
#ALTER TABLE friend_requests
#ADD CHECK (initiator_user_id <> target_user_id);

DROP TABLE IF EXISTS communities;
CREATE TABLE communities (
	id serial,
	name varchar(255),
	admin_user_id bigint UNSIGNED NOT NULL,
	
	INDEX (name),
	FOREIGN KEY (admin_user_id) REFERENCES users(id)
);

#создание связи многие ко многим
DROP TABLE IF EXISTS users_communities;
CREATE TABLE users_communities(
	user_id bigint UNSIGNED NOT NULL,
	community_id bigint UNSIGNED NOT NULL,
	
	PRIMARY KEY (user_id, community_id),
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (community_id) REFERENCES communities(id)
);

DROP TABLE IF EXISTS media_types;
CREATE TABLE media_types(
	id serial,
	name varchar(255)
);

DROP TABLE IF EXISTS media;
CREATE TABLE media(
	id serial,
	user_id bigint UNSIGNED NOT NULL,
	media_type_id bigint UNSIGNED NOT NULL,
	body varchar(255),
	metadata json,
	created_at datetime DEFAULT now(),
	updated_at datetime ON UPDATE now(),
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (media_type_id) REFERENCES media_types(id)
);

DROP TABLE IF EXISTS likes;
CREATE TABLE likes(
	id serial,
	user_id bigint UNSIGNED NOT NULL,
	media_id bigint UNSIGNED NOT NULL,
	created_at datetime DEFAULT now(),
	PRIMARY KEY (user_id, media_id),
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (media_id) REFERENCES media(id)
);

#ДЗ_3

DROP TABLE IF EXISTS profile_photos;
CREATE TABLE profile_photos(
	id serial,
	user_id bigint UNSIGNED NOT NULL,
	body varchar(255), #добавление в профиль с описанием
	metadata json, #профильные фотки хранятся на отдельном сервере?
	updated_at datetime ON UPDATE now(),
	FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS profile_photo_likes;
CREATE TABLE profile_photo_likes(
	id serial,
	profile_photo_id bigint UNSIGNED NOT NULL,
	initiator_user_id bigint UNSIGNED NOT NULL,
	target_user_id bigint UNSIGNED NOT NULL,
	updated_at datetime ON UPDATE now(),
	PRIMARY KEY (profile_photo_id, target_user_id),
	FOREIGN KEY (profile_photo_id) REFERENCES profile_photos(id),
	FOREIGN KEY (initiator_user_id) REFERENCES users(id),
	FOREIGN KEY (target_user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS media_comments;
CREATE TABLE media_comments(
	id serial,
	body varchar(256),
	media_id bigint UNSIGNED NOT NULL,
	initiator_user_id bigint UNSIGNED NOT NULL,
	target_user_id bigint UNSIGNED NOT NULL,
	created_at datetime DEFAULT now(),
	PRIMARY KEY (media_id, target_user_id),
	FOREIGN KEY (media_id) REFERENCES media(id),
	FOREIGN KEY (initiator_user_id) REFERENCES users(id),
	FOREIGN KEY (target_user_id) REFERENCES users(id)
);
