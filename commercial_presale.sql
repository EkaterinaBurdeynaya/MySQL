/* Дисклеймер: Все данные и цифры курсового проекта являются вымышленными, любые совпадения с реальными кейсами — случайны.
Создание базы данных для отдела Commersial Presale в компании, которая предоставляет IT-решения под ключ.
Компания под названием 'Dataprovider Holding' является материнской компанией.
В холдинг входит группа из 4 компаний, с которыми в зависимости от разных условий контрактуется Заказчик.
4 компании: 'Dataprovider', 'Datacenter', 'Data processing center', 'Rostel'
Структура данных для формирования полноценного запроса для регистрации его в системе, посредством опросника:
- Команда менеджеров для получения запросов от Заказчика;
- Команда инженеров для формирования КП в сторону Заказчика;
- Группы запросов: ИМПОРТОЗАМЕЩЕНИЕ ИТ-РЕШЕНИЙ, РАБОТА С ДАННЫМИ, ВИДЕОНАБЛЮДЕНИЕ, ОБЛАКА, ХРАНЕНИЕ ДАННЫХ, 
  АДМИНИСТРИРОВАНИЕ ИТ-ИНФРАСТРУКТУРЫ И СИСТЕМ, COLOCATION, РЕЗЕРВНОЕ КОПИРОВАНИЕ, СЕТЬ И ТЕЛЕКОМ, УДАЛЁННАЯ РАБОТА ОФИСА,
  ПОСЛЕАВАРИЙНОЕ ВОССТАНОВЛЕНИЕ (DR), ИНФОРМАЦИОННАЯ БЕЗОПАСНОСТЬ, ПОДДЕРЖКА ВЕБ-РЕСУРСОВ, ХОСТИНГ ПРИЛОЖЕНИЙ, DEVOPS, КОНСАЛТИНГ;
- Тип запросов: в составе каждой группы запросов входят определенные услуги (например ОБЛАКА: Облако, соответствующее 152-ФЗ или 
  Виртуальная инфраструктура (IaaS);
- Статус запроса - бюджетная оценка, точная стоимость, тендер;
- Канал привлечения заказчика (маркетинговый тип);
- Тип контрактования: компания из холдинга + заказчик
*/

DROP DATABASE IF EXISTS commercial_presale;
CREATE DATABASE commercial_presale;
USE commercial_presale;

-- Менеджеры
DROP TABLE IF EXISTS managers;
CREATE TABLE managers (
	id bigint UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	firstname varchar(50) NOT NULL,
	lastname varchar(50) NOT NULL,
	email varchar(100) UNIQUE NOT NULL,
	phone bigint UNSIGNED UNIQUE NOT NULL,
	password_hash varchar(256) NOT NULL,
	#пароли для сайта, где будут регистрироваться запросы
	created_at datetime DEFAULT now(),
	updated_at datetime ON UPDATE now(),
	INDEX idx_managers_managername (firstname, lastname)
);

INSERT INTO managers (id, firstname, lastname, email, phone, password_hash) VALUES
('1', 'Алексей', 'Смирнов', 'alekseysmirnov@dph.ru', '74957994219', 'Eqr3FCh4mF'),
('2', 'Андрей', 'Иванов', 'andreyivanov@dph.ru', '74955026058', 'q1zkhNO3Xa'),
('3', 'Мария', 'Кузнецова', 'mariyakuznetsova@dph.ru', '74955329567', 'dSjwFhfLjd'),
('4', 'Лев', 'Соколов', 'levsokolov@dph.ru', '74955173684', 'ox6504FXRP'),
('5', 'Дмитрий', 'Попов', 'dmitriypopov@dph.ru', '74955072640', 'sUF4mDOoxS'),
('6', 'Юлия', 'Лебедева', 'yuliyalebedeva@dph.ru', '79150555282', 'oWe3aMmO28'),
('7', 'Даниил', 'Козлов', 'daniilkozlov@dph.ru', '79154800401', 'sZaVG8mkYY'),
('8', 'Николай', 'Новиков', 'nikolaynovikov@dph.ru', '74954111937', 'Px81rRZlWN'),
('9', 'Мирон', 'Морозов', 'mironmorozov@dph.ru', '74957924859', 'wBYbYiKrNN'),
('10', 'Тимофей', 'Петров', 'timofeypetrov@dph.ru', '74955853876', 'DPxzHjrxrV'),
('11', 'Руслан', 'Волков', 'ruslanvolkov@dph.ru', '74957691932', 'zl5hNAYiH7'),
('12', 'Виктор', 'Соловьёв', 'viktorsolovyov@dph.ru', '74957966537', '47TRAvFLaZ'),
('13', 'Елена', 'Васильева', 'elenavasileva@dph.ru', '74952271980', 'lHmeAWeouS'),
('14', 'Максим', 'Зайцев', 'maksimzaytsev@dph.ru', '79175050803', '36mtoQ1OdT'),
('15', 'Вероника', 'Павлова', 'veronikapavlova@dph.ru', '74953644789', 'JYzN4xMnQH'),
('16', 'Петр', 'Семёнов', 'petrsemyonov@dph.ru', '74957694765', 'lw5vQDXyOx'),
('17', 'Дмитрий', 'Голубев', 'dmitriygolubev@dph.ru', '74957924068', 'svLWgQHI3B'),
('18', 'Екатерина', 'Виноградова', 'ekaterinavinogradova@dph.ru', '79169333589', 'U70jYQWiRW'),
('19', 'Ульяна', 'Богданова', 'ulyanabogdanova@dph.ru', '74957985437', 'KRjFQ9EAFn'),
('20', 'Дария', 'Воробьёва', 'dariyavorobyova@dph.ru', '74957926558', '2CVrOpcRl7')
;

-- Инженеры
DROP TABLE IF EXISTS engineers;
CREATE TABLE engineers (
	id bigint UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	firstname varchar(50) NOT NULL,
	lastname varchar(50) NOT NULL,
	email varchar(100) UNIQUE NOT NULL,
	phone bigint UNSIGNED UNIQUE NOT NULL,
	password_hash varchar(256) NOT NULL,
	#пароли для сайта, где будут регистрироваться запросы
	created_at datetime DEFAULT now(),
	updated_at datetime ON UPDATE now(),
	INDEX idx_engineers_engineername (firstname, lastname)
);

INSERT INTO engineers (id, firstname, lastname, email, phone, password_hash) VALUES
('1', 'Андрей', 'Фёдоров', 'andreyfyodorov@dph.ru', '79152293000', 'xMBE1S41kM'),
('2', 'Ксения', 'Михайлова', 'kseniyamikhaylova@dph.ru', '74952318234', 'NvssofZpBm'),
('3', 'Алина', 'Беляева', 'alinabelyaeva@dph.ru', '74956438432', 'Mr5IEZCa0A'),
('4', 'Ольга', 'Тарасова', 'olgatarasova@dph.ru', '74957644654', 'bzaCx8V7Ez'),
('5', 'Виталий', 'Белов', 'vitaliybelov@dph.ru', '79175496000', 'EIGx6TrF8X'),
('6', 'Алёна', 'Комарова', 'alyonakomarova@dph.ru', '74956645771', 'kvNbQRheIk'),
('7', 'Александра', 'Орлова', 'aleksandraorlova@dph.ru', '79162245000', '1Kn1HFrdX7'),
('8', 'Лариса', 'Киселёва', 'larisakiselyova@dph.ru', '74959259432', 'CrbFnswPlO'),
('9', 'Диана', 'Макарова', 'dianamakarova@dph.ru', '74957418022', 'HMIAACTk1A'),
('10', 'Наталия', 'Андреева', 'nataliyaandreeva@dph.ru', '79153644000', 'xg43qqZbun'),
('11', 'Александр', 'Ковалёв', 'aleksandrkovalyov@dph.ru', '79175769333', 'OCEXPNC5qB'),
('12', 'Евгений', 'Ильин', 'evgeniyilin@dph.ru', '74957962456', 'E5aBNitOPz'),
('13', 'Артем', 'Гусев', 'artemgusev@dph.ru', '79175558907', '9J0t8AYKQg'),
('14', 'Дария', 'Титова', 'dariyatitova@dph.ru', '79150076111', 'vbCa4AybO3'),
('15', 'Надежда', 'Кузьмина', 'nadezhdakuzmina@dph.ru', '74957675012', 'ZUYZctrqwL'),
('16', 'Валентина', 'Кудрявцева', 'valentinakudryavtseva@dph.ru', '79167231551', 'KNy00k35qq'),
('17', 'Раиса', 'Баранова', 'raisabaranova@dph.ru', '79858636777', 'k6BC9Hjou2'),
('18', 'Дмитрий', 'Куликов', 'dmitriykulikov@dph.ru', '79255143334', 'HKmD7Nodl1'),
('19', 'Лилия', 'Алексеева', 'liliyaalekseeva@dph.ru', '74957607321', 'hnfWwcwiI9'),
('20', 'Вероника', 'Степанова', 'veronikastepanova@dph.ru', '74956635765', 'tCNimXwUkQ')
;

-- Группы запросов
DROP TABLE IF EXISTS query_type_groups;
CREATE TABLE query_type_groups(
	id serial,
	name varchar(256) NOT NULL
	#у меня есть список групп услуг, по плану группы не будут обновляться в течении нескольких лет
);

INSERT INTO query_type_groups VALUES
('1', 'ИМПОРТОЗАМЕЩЕНИЕ ИТ-РЕШЕНИЙ'),
('2', 'РАБОТА С ДАННЫМИ'),
('3', 'ВИДЕОНАБЛЮДЕНИЕ'),
('4', 'ОБЛАКА'),
('5', 'ХРАНЕНИЕ ДАННЫХ'),
('6', 'АДМИНИСТРИРОВАНИЕ ИТ-ИНФРАСТРУКТУРЫ И СИСТЕМ'),
('7', 'COLOCATION'),
('8', 'РЕЗЕРВНОЕ КОПИРОВАНИЕ'),
('9', 'СЕТЬ И ТЕЛЕКОМ'),
('10', 'УДАЛЁННАЯ РАБОТА ОФИСА'),
('11', 'ПОСЛЕАВАРИЙНОЕ ВОССТАНОВЛЕНИЕ (DR)'),
('12', 'ПОДДЕРЖКА ВЕБ-РЕСУРСОВ'),
('13', 'ХОСТИНГ ПРИЛОЖЕНИЙ'),
('14', 'ИНФОРМАЦИОННАЯ БЕЗОПАСНОСТЬ'),
('15', 'DEVOPS'),
('16', 'КОНСАЛТИНГ')
;

-- Типы запросов
DROP TABLE IF EXISTS query_types;
CREATE TABLE query_types(
	id serial,
	query_type_group_id bigint UNSIGNED NOT NULL,
	name varchar(256) NOT NULL,
	FOREIGN KEY (query_type_group_id) REFERENCES query_type_groups(id)
	#у меня есть список услуг, по плану услуги не будут обновляться в течении нескольких лет
);

INSERT INTO query_types VALUES 
('1', '1', 'Миграция почты с MS Exchange на российскую платформу Communigate PRO'),
('2', '2', 'Базы данных в облаке (DBaaS)'),
('3', '2', 'Обработка и анализ данных'),
('4', '2', 'Доставка и обработка сообщений'),
('5', '2', 'Платформа управления данными'),
('6', '3', 'Облачное видеонаблюдение для бизнеса'),
('7', '3', 'Видеоаналитика'),
('8', '4', 'Виртуальная инфраструктура (IaaS)'),
('9', '4', 'Облако на базе Hyper-V'),
('10', '4', 'Облако на базе OpenStack'),
('11', '4', 'Облако, соответствующее 152-ФЗ'),
('12', '4', 'Катастрофо­устойчивое облако'),
('13', '4', 'Глобальный балансировщик нагрузки (GSLB)'),
('14', '5', 'Отказоустойчивая СХД'),
('15', '5', 'Объектное хранилище S3'),
('16', '5', 'Сбор и хранение логов'),
('17', '5', 'Облачный диск'),
('18', '6', 'Администрирование сети'),
('19', '6', 'Администрирование операционных систем'),
('20', '6', 'Администрирование баз данных'),
('21', '6', 'Администрирование приложений'),
('22', '6', 'Администрирование ИБ'),
('23', '6', 'Администрирование SAP'),
('24', '7', 'Аренда стойко-места'),
('25', '7', 'Аренда выделенной части машинного зала'),
('26', '7', 'Аренда машинного зала'),
('27', '8', 'Резервное копирование виртуальных машин'),
('28', '8', 'Резервное копирование Office 365'),
('29', '9', 'Доступ в Интернет'),
('30', '9', 'Оптические волокна'),
('31', '9', 'Выделенные каналы связи'),
('32', '9', 'VPN как сервис'),
('33', '9', 'Meet-Me-Room'),
('34', '9', 'Ускорение и защита веб-ресурсов'),
('35', '9', 'Looking glass'),
('36', '10', 'Миграция из Microsoft Office 365'),
('37', '10', 'Виртуальные рабочие столы VDI'),
('38', '10', 'Почта как сервис'),
('39', '10', 'Облачный диск'),
('40', '10', 'Платформа для совместной онлайн-работы'),
('41', '10', 'Active Directory как сервис'),
('42', '11', 'Disaster Recovery как сервис'),
('43', '11', 'Восстановление виртуальных машин в облаке DataLine'),
('44', '11', 'Катастрофо­устойчивое облако'),
('45', '12', 'Защита веб-приложений (Web Application Firewall)'),
('46', '12', 'Защита от DDoS'),
('47', '12', 'Ускорение и защита веб-ресурсов'),
('48', '13', 'Приложения SAP'),
('49', '13', 'MS SQL в облаке'),
('50', '13', 'MySQL в облаке'),
('51', '13', 'PostgreSQL в облаке'),
('52', '14', 'Облако, соответствующее 152-ФЗ'),
('53', '14', 'Соответствие 152-ФЗ'),
('54', '14', 'PCI DSS и защита платежных данных'),
('55', '14', 'Защита сети на базе NGFW'),
('56', '14', 'Защита веб-приложений (Web Application Firewall)'),
('57', '14', 'Защита от DDoS'),
('58', '14', 'Сегмент управления частными облаками, аттестованный для ГИС К1, УЗ-1 и 1Г'),
('59', '14', 'Защита электронной почты'),
('60', '14', 'ГОСТ VPN'),
('61', '14', 'Сбор и хранение логов'),
('62', '14', 'Мониторинг и управление доступом поставщиков ИТ-услуг (СКДПУ)'),
('63', '15', 'Managed Kubernetes'),
('64', '15', 'DevOps как сервис'),
('65', '16', 'Соответствие 152-ФЗ'),
('66', '16', 'PCI DSS и защита платежных данных'),
('67', '16', 'Управление внешним ЦОД')
; 

-- Статус запроса: бюджетная оценка, точная стоимость, тендер
DROP TABLE IF EXISTS query_statuses;
CREATE TABLE query_statuses(
	id serial,
	status enum('Бюджетная оценка', 'Точная стоимость', 'Тендер'),
	created_at datetime DEFAULT now(),
	updated_at datetime ON UPDATE now()
);

INSERT INTO query_statuses (id, status) VALUES 
('1', 'Бюджетная оценка'),
('2', 'Точная стоимость'),
('3', 'Тендер')
;

-- Канал привлечения Заказчика
DROP TABLE IF EXISTS marketing_types;
CREATE TABLE marketing_types(
	id serial,
	name varchar(256) NOT NULL
);


INSERT INTO marketing_types (id, name) VALUES 
('1', 'Интернет, маркетинг, контекстная реклама'),
('2', 'Социальные сети'),
('3', 'Рекомендация клиента'),
('4', 'Email рассылка'),
('5', 'Блог на Habr и Youtube'),
('6', 'СМИ'),
('7', 'Семинары, вебинары'),
('8', 'Существующий клиент'),
('9', 'Партнеры'),
('10', 'Другое')
;

-- С кем контрактуется Заказчик 
DROP TABLE IF EXISTS conract_holders;
CREATE TABLE conract_holders(
	id serial,
	name enum('DataProvider', 'DataCenter', 'Data Processing Center', 'Rostel'),
	ogrn bigint UNSIGNED UNIQUE,
	inn bigint UNSIGNED UNIQUE,
	authorized_capital bigint UNSIGNED UNIQUE,
	registration_date date,
	legal_address varchar (100) NOT NULL,
	#вопрос: можно ли ссылкой на карту хранить юр. адрес компании? это формат json?
	head_firstname varchar(50) NOT NULL,
	head_lastname varchar(50) NOT NULL,
	email varchar(100) UNIQUE NOT NULL,
	phone bigint UNSIGNED UNIQUE NOT NULL
);

INSERT INTO conract_holders VALUES 
('1', 'DataProvider', '6244654579245', '9873825100', '130350000', '1997-12-03' , 'ул. Земляной Вал, д.50а, стр.3, Москва, 109028', 'Максим', 'Яковлев', 'dataprovider@dp.ru', '74952318256'),
('2', 'DataCenter', '4196353504449', '2939123705', '200300000', '2005-05-30' , 'Никольская ул., 25, Москва, 109012', 'Николай', 'Сорокин', 'datacenter@dc.ru', '74952318285'),
('3', 'Data Processing Center', '2800261373072', '8641070647', '30560000', '2000-01-25' , 'ул. Маросейка, 6, 21, Москва, 101000', 'Радион', 'Сергеев', 'dataprocessingcenter@dpc.ru', '74952334056'),
('4', 'Rostel', '7818734600928', '8208827375', '130670000', '2010-07-10' , 'Большой Каретный пер., Москва, 127051', 'Дмитрий', 'Романов', 'rostel@rostel.ru', '74954090256')
;

-- Заказчики
DROP TABLE IF EXISTS customers;
CREATE TABLE customers(
	id serial,
	name varchar(256) UNIQUE,
	ogrn bigint UNSIGNED UNIQUE,
	inn bigint UNSIGNED UNIQUE,
	authorized_capital bigint UNSIGNED,
	registration_date date,
	legal_address varchar (100) NOT NULL,
	head_firstname varchar(50) NOT NULL,
	lastname varchar(50) NOT NULL,
	email varchar(100) UNIQUE NOT NULL,
	phone bigint UNSIGNED UNIQUE NOT NULL
);

INSERT INTO customers VALUES 
('1', 'Газпром', '68238503013', '4541208045', '260699950', '1998-12-03', 'БЦ "На Моховой", ул. Моховая, 7, Москва, 125009', 'Алексей', 'Лазарев', 'gazprom@gazprom.ru', '74952318006'),
('2', 'ЛУКОЙЛ', '41821174073', '7886130612', '400599950', '2006-05-30', 'ул. Пятницкая, 14 строение 1, Москва, 115035', 'Андрей', 'Медведев', 'lukoyl@lukoyl.ru', '74952318035'),
('3', 'Роснефть', '98128605579', '3063183673', '61119950', '2001-01-24', '2-й Брянский пер., 4-6, Москва, 121059', 'Марк', 'Ершов', 'rosneft@rosneft.ru', '74952333806'),
('4', 'Сбербанк России', '58383345432', '6842857666', '261339950', '2011-07-10', 'Комсомольский пр. (дублер), 28, Москва, 119146', 'Лев', 'Никитин', 'sberbank@sberbank.ru', '74954090006'),
('5', 'РЖД', '58881616463', '4089585246', '521399850', '1999-12-03', 'Большая Серпуховская ул., 27, Москва, 115093', 'Дмитрий', 'Соболев', 'rzhd@rzhd.ru', '74952317756'),
('6', 'X5 Retail Group', '54254967624', '4898749376', '801199850', '2007-05-30', 'Павелецкая пл., 2 стр2, Москва, 123022', 'Юрий', 'Рябов', 'x5retail@x5retail.ru', '74952317785'),
('7', 'Государственная корпорация Ростех', '13367587309', '1138409986', '122239850', '2002-01-24', '1-й Кожевнический пер., 6 стр 1, Москва, 115114', 'Даниил', 'Поляков', 'rostekh@rostekh.ru', '74952333556'),
('8', 'Магнит', '51354114494', '6413340670', '522679850', '2012-07-09', 'ул. Золоторожский Вал, д. 38 стр.1, Москва, 105120', 'Николай', 'Цветков', 'magnit@magnit.ru', '74954089756'),
('9', 'Банк ВТБ', '12751099553', '5978993800', '1042799650', '2000-12-02', 'пр. Завода Серп и Молот, 10, Москва, 111250', 'Мирон', 'Данилов', 'bank vtb@bank vtb.ru', '74952317506'),
('10', 'Росатом', '78323217488', '7494469498', '1602399650', '2008-05-29', 'Павелецкая пл., 2 стр2, Москва, 123022', 'Тимофей', 'Жуков', 'rosatom@rosatom.ru', '74952317535'),
('11', 'Норильский никель', '78006085078', '7103051088', '244479650', '2003-01-24', 'Радио ул., 24, корп.1, Москва, 105005', 'Руслан', 'Фролов', 'norilskiynikel@norilskiynikel.ru', '74952333306'),
('12', 'Сургутнефтегаз', '36665815970', '4320971226', '1045359650', '2013-07-09', 'Богословский пер., 16-12, Москва, 123104', 'Виктор', 'Журавлёв', 'surgutneftegaz@surgutneftegaz.ru', '74954089506'),
('13', 'Российские сети', '88752345816', '9256776941', '2085599250', '2001-12-02', '1-й Кожевнический пер., 6 стр 1, Москва, 115114', 'Евгений', 'Николаев', 'rosseti@rosseti.ru', '74952317256'),
('14', 'Интер РАО', '52562924071', '2078178606', '3204799250', '2009-05-29', 'ул. Пречистенка, 6, Москва, 119034', 'Максим', 'Крылов', 'interrao@interrao.ru', '74952317285'),
('15', 'Транснефть', '36524833840', '2910903197', '488959250', '2004-01-24', 'Павелецкая пл., 2 стр2, Москва, 123022', 'Виктор', 'Максимов', 'transneft@transneft.ru', '74952333056'),
('16', 'Мегаполис', '34141604897', '6880056561', '2090719250', '2014-07-09', 'Смоленский б-р, 24, стр. 1, Москва, 119002', 'Петр', 'Сидоров', 'megapolis@megapolis.ru', '74954089256'),
('17', 'Татнефть', '72729293992', '3096604802', '4171198450', '2002-12-02', 'ул. Россолимо, 11А, Москва, 119021', 'Дмитрий', 'Осипов', 'tatneft@tatneft.ru', '74952317006'),
('18', 'НОВАТЭК', '27929552660', '3301005556', '6409598450', '2010-05-29', 'Ленинградский пр-т., 31А, Москва, 125284', 'Егор', 'Белоусов', 'novatek@novatek.ru', '74952317035'),
('19', 'ЕВРАЗ', '32483103511', '6455352480', '977918450', '2005-01-23', 'ул. Нижняя Масловка, 14, Москва, 127220', 'Леонид', 'Федотов', 'evraz@evraz.ru', '74952332806'),
('20', 'АФКСистема', '73926374758', '6588727238', '4181438450', '2015-07-09', 'ул. Сущёвский Вал, 5 строение 1, Москва, 127018', 'Дмитрий', 'Дорофеев', 'afksistema@afksistema.ru', '74954089006')
;

-- Отношение Заказчик - Контрактуемое юр.лицо
DROP TABLE IF EXISTS contract_types;
CREATE TABLE contract_types(
	id serial,
	conract_holder_id bigint UNSIGNED NOT NULL,
	customer_id bigint UNSIGNED NOT NULL,
	created_at datetime DEFAULT now(),
	updated_at datetime ON UPDATE now(),
	FOREIGN KEY (conract_holder_id) REFERENCES conract_holders(id),
	FOREIGN KEY (customer_id) REFERENCES customers(id)
);

INSERT INTO contract_types (id, conract_holder_id, customer_id) VALUES
('1', '4', '10'),
('2', '2', '15'),
('3', '2', '5'),
('4', '3', '12'),
('5', '2', '6'),
('6', '2', '2'),
('7', '1', '7'),
('8', '4', '18'),
('9', '1', '14'),
('10', '2', '17'),
('11', '4', '19'),
('12', '3', '20'),
('13', '1', '9'),
('14', '4', '9'),
('15', '4', '3'),
('16', '1', '20'),
('17', '3', '8'),
('18', '2', '13'),
('19', '1', '11'),
('20', '2', '7')
;
	
-- Главная таблица запроса (в режиме опросника)
DROP TABLE IF EXISTS queries;
CREATE TABLE queries (
	id bigint UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	description varchar(256) NOT NULL,
	manager_id bigint UNSIGNED NOT NULL,
	engineer_id bigint UNSIGNED NOT NULL,
	query_type_id bigint UNSIGNED NOT NULL,
	query_status_id bigint UNSIGNED NOT NULL,
	customer_id bigint UNSIGNED NOT NULL,
	marketing_type_id bigint UNSIGNED NOT NULL,
	contract_type_id bigint UNSIGNED NOT NULL,
	created_at datetime DEFAULT now(),
	updated_at datetime ON UPDATE now(),
	INDEX idx_query_customer (id, customer_id),
	FOREIGN KEY (manager_id) REFERENCES managers(id),
	FOREIGN KEY (engineer_id) REFERENCES engineers(id),
	FOREIGN KEY (query_type_id) REFERENCES query_types(id),
	FOREIGN KEY (query_status_id) REFERENCES query_statuses(id),
	FOREIGN KEY (customer_id) REFERENCES customers(id),
	FOREIGN KEY (marketing_type_id) REFERENCES marketing_types(id),
	FOREIGN KEY (contract_type_id) REFERENCES contract_types(id)
);

INSERT INTO queries (id, description, manager_id, engineer_id, query_type_id, query_status_id, customer_id, marketing_type_id, contract_type_id) VALUES
(' 1', 'Запрос консалтинга', '8', '14', '66', '1', '3', '1', '11'),
(' 2', 'Облачный диск для нужд Заказчика', '12', '2', '39', '1', '8', '1', '20'),
(' 3', 'GSLB по запросу', '18', '17', '13', '2', '15', '4', '17'),
(' 4', 'Запрос SAP', '12', '11', '48', '2', '5', '1', '5'),
(' 5', 'PCI DSS для Заказчика АФКСистема', '15', '5', '54', '3', '8', '6', '16'),
(' 6', 'Запрос СКДПУ', '16', '14', '62', '3', '17', '4', '20'),
(' 7', 'Администрирование БД', '9', '18', '20', '2', '12', '1', '16'),
(' 8', 'Запрос Почты как сервиса', '2', '12', '38', '3', '9', '2', '2'),
(' 9', 'DevOps как сервис', '11', '1', '64', '3', '14', '4', '7'),
(' 10', 'VPN для нужд заказчика', '14', '2', '32', '2', '6', '9', '6'),
(' 11', 'Защита эл. почты', '20', '16', '59', '2', '11', '4', '3'),
(' 12', 'Anti-DDoS лдя заказчика Ростех', '12', '5', '46', '3', '10', '4', '7'),
(' 13', 'Катастрофо­устойчивое облако для нужд заказчика', '8', '7', '12', '2', '5', '9', '11'),
(' 14', 'IaaS', '10', '13', '8', '2', '10', '10', '19'),
(' 15', 'S3 для Заказичка АФКСистема', '15', '6', '48', '3', '13', '6', '12'),
(' 16', 'Администрирование приложения', '20', '17', '21', '3', '9', '10', '15'),
(' 17', 'СКДПУ для Татнефть', '1', '2', '62', '1', '15', '10', '10'),
(' 18', 'Почта', '12', '15', '38', '2', '7', '8', '3'),
(' 19', 'Looking glass', '15', '19', '35', '1', '3', '2', '3'),
(' 20', 'РК Office', '4', '17', '28', '1', '8', '10', '13')
;

-- Получение списка мнеджеров и инженеров по алфавиту
SELECT * FROM engineers ORDER BY id;
SELECT firstname, lastname FROM engineers ORDER BY firstname ASC;
SELECT firstname, lastname FROM managers GROUP BY firstname ORDER BY firstname ASC;

-- Добавление новой колонки статус для активации и деактивации профиля (отпуск/увольнение)
ALTER TABLE engineers ADD is_active BIT DEFAULT TRUE NULL;
ALTER TABLE managers ADD is_active BIT DEFAULT TRUE NULL;
UPDATE engineers SET is_active = FALSE WHERE email LIKE 'evgeniyilin@dph.ru' OR email LIKE 'artemgusev@dph.ru';

-- Добавить текущую дату в колонку
UPDATE engineers SET updated_at = now();
UPDATE managers SET updated_at = now();

-- Отсортировать записи таким образом, чтобы они выводились в порядке увеличения 
-- значения value. Однако, нулевые значения должны выводиться в конце, после всех записей.
UPDATE customers SET authorized_capital = 0 WHERE name LIKE 'Банк ВТБ' OR name LIKE 'АФКСистема';
SELECT * FROM customers ORDER BY CASE WHEN authorized_capital = 0 THEN 10000000000 ELSE authorized_capital END;

-- Вывести 4 и 6 группу запросов
SELECT name, query_type_group_id FROM query_types WHERE query_type_group_id = 4 OR query_type_group_id = 6;

-- Отсортировать записи в порядке, заданном в скобках
SELECT * FROM queries WHERE id IN (10, 1, 15) ORDER BY field (id, 10, 1, 15);

-- Подсчитать общее количество запросов от Заказчиков, чей уставной капитал < 300 млн
SELECT count(*) AS query_from_big FROM queries WHERE customer_id IN (SELECT id FROM customers WHERE authorized_capital > 3000000000);

-- Представление: создать таблицу запросов от Заказчиков, чей уставной капитал < 300 млн
DROP VIEW IF EXISTS tbl;
CREATE VIEW tbl (id, description, customer_name, manager_firstname, manager_lastname, query_type_name) AS 
SELECT q.id, description, c.name, m.firstname, m.lastname, qt.name FROM queries AS q
JOIN managers AS m ON manager_id = m.id
JOIN query_types AS qt ON query_type_id = qt.id
JOIN customers AS c ON q.customer_id = c.id WHERE authorized_capital > 3000000000;

-- Представление: создать таблицу по менеджеру (id = 12)
DROP VIEW IF EXISTS mng_tbl;
CREATE VIEW mng_tbl (id, description, customer_name, manager_firstname, manager_lastname, query_type_name) AS
SELECT q.id, description, c.name, m.firstname, m.lastname, qt.name FROM queries AS q
JOIN query_types AS qt ON query_type_id = qt.id
JOIN customers AS c ON q.customer_id = c.id
JOIN managers AS m ON manager_id = m.id WHERE manager_id = 12;

-- Процедура предложения Заказчику услуг компании, которые он еще не покупал
DROP PROCEDURE IF EXISTS query_type_offer;
delimiter //
CREATE PROCEDURE query_type_offer (IN customer_id int)
BEGIN 
SELECT qtg.name, qt.name FROM query_type_groups AS qtg
JOIN query_types AS qt ON qtg.id = query_type_group_id
JOIN queries AS q ON query_type_id = qt.id WHERE q.customer_id != customer_id
ORDER BY rand()
LIMIT 5;
END//
delimiter ;



