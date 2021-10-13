create DATABASE cian;
use cian;

TRUNCATE TABLE  users;
TRUNCATE TABLE agent;
TRUNCATE TABLE person;

ALTER TABLE document_agency DROP CONSTRAINT doc_id_from_agent;
ALTER TABLE messages DROP CONSTRAINT messages_from_user_id;
ALTER TABLE house DROP CONSTRAINT user_id_who_posted;
ALTER TABLE flat DROP CONSTRAINT user_id_who_posted_f;
ALTER TABLE plot DROP CONSTRAINT user_id_who_posted_p;


select * from additionally_type;
-- ----------------------------------------------------------------------------------------------------------------
-- Создание пользователя
CREATE TABLE users(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Ун. ин. и id пользователя",
    person_id INT UNSIGNED,
    agent_id int UNSIGNED,
    type_ac ENUM ('Agent','Person'),
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Дата и время создания пользователя"
);

-- ----------------------------------------------------------------------------------------------------------------
-- Обычный пользовательский аккаунт
CREATE TABLE person(
	p_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Ун. ин.",
	first_name VARCHAR(255) NOT NULL COMMENT "Имя",
	last_name VARCHAR(255) NOT NULL COMMENT "Фамилия",
	birthday DATE COMMENT "Дата раждения(не обязательный атрибут)",
	email VARCHAR(255) NOT NULL UNIQUE COMMENT "Почта",
	tel VARCHAR(12) NOT NULL UNIQUE COMMENT "Телефон",
	photo VARCHAR(255) COMMENT "Путь к изображению"
);
ALTER TABLE person ADD CONSTRAINT сheck_tel CHECK (REGEXP_LIKE(tel, '^\\+7[0-9]{10}$'));
/*
delimiter |
CREATE TRIGGER `insert_person` AFTER INSERT ON `person`
FOR EACH ROW BEGIN
   INSERT INTO users Set type_ac = 'Person', person_id = NEW.p_id, agent_id = 0;
END|
*/
-- --------------------------------------------------------------------------------------------------------------------

INSERT INTO person VALUES (NULL,'petya','seledkin','1998-02-03','qwed@mail.ru','+79122334392','sdfssdf'),(NULL,'sema','voloskov','1991-12-23','oijo923@mail.ru','+79122214322','kldfjglsd;'),(NULL,'iliya','vetrov','2000-04-11','11jdjda@mail.ru','+79134367302',',lk,,kasa'),(NULL,'igor','shmelov','1981-07-30','njscnjhs@mail.ru','+79189345323','knnkllsknl'),(NULL,'fedor','percev','1978-10-13','lskls765@mail.ru','+79402594360','lsd;l8sdl'),(NULL,'ana','volodina','1990-06-28','slsliihh@mail.ru','+79620930092','skjkjkjshhdgye'),(NULL,'maria','sebova','1988-09-20','ldldxx@mail.ru','+79110300395','slpopomk08097'),(NULL,'petya','seledkin','1998-02-03','qmlsks6767@mail.ru','+79992365301','lkslksdjccjms'),(NULL,'natalia','lozhkina','1983-05-09','0sksjd@mail.ru','+79832044398','89iugu67td'),(NULL,'petya','seledkin','1979-04-16','innygvnfv@mail.ru','+79926634897','jhnjalkk8787');

-- ----------------------------------------------------------------------------------------------------------------------
-- Агентский пользовательский аккаунт
CREATE TABLE agent(
	a_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Ун. ин.",
    agent_name VARCHAR(255) NOT NULL UNIQUE COMMENT "Название агенства уникально",
    tel VARCHAR(12) NOT NULL UNIQUE COMMENT "Телефон",
    suite VARCHAR(255) COMMENT "Ссылка на сайт агенства",
    logo VARCHAR(255) COMMENT "Путь к файлу",
    about text COMMENT "Информация\описание агенства"
);
/*
delimiter |
CREATE TRIGGER `insert_agent` AFTER INSERT ON `agent`
FOR EACH ROW BEGIN
   INSERT INTO users Set type_ac = 'Agent', agent_id = NEW.a_id, person_id = 0;
END| */

-- ---------------------------------------------------------------------------------------------------------------------

INSERT INTO agent VALUES (NULL,'shlepai_guboi','+79992356444','WERdsf.ru','loKK-hSDSDgo','32SDS32kl'),(NULL,'shlepai_nogoi','+79992356333','WEjhh.ru','nhmkjkjkSDgo','32SDS32klskcj bvhcbjkmlfjvhgcf'),(NULL,'shlepai_golovoi','+79992778444','Wdfsdf.ru','loKKjhjhsdhjs77ks','nnuhncfiunns78uiwm893rm8buyb346bb6c3miwmsm'),(NULL,'shlepai_rukoi','+79392333454','mlunxgjb.ru','mlakscnvdf','3,lisuyjdrueiowka,sm'),(NULL,'shlepai_borodoi','+79992378424','inyun.ru','lkjhghbnjksd','inybcf4n7f84sofhuxgmrmvbao'),(NULL,'shlepai_knigoi','+79999953344','WER23423.ru','lxnhjcbhsmc','kmxwsetbvcnygf43wtcfhmx4igfwnlvtcfbgbnxvmc'),(NULL,'hlupai_guboi','+79998475614','WEkjhjcghcgncybf.ru','237ui2iughunnhnhxd','lkaxnwbaghbdynumwescyn8w7m8O9QUCFH4YUBVC'),(NULL,'pupai_guboi','+79912516334','Wces8mughcgmixm4owg.ru','jfenscbytf849tmucw,fc','3ybby7ny7wingyfcnyocnhyc'),(NULL,'mupai_guboi','+79900351444','Wv565f7g87i.ru','l.,iknujbvhy','cmlgensghrc9wm'),(NULL,'rupai_guboi','+79910355489','Wngy7ny8inhnhulf.ru','loKK-gncsrjcfko','mnvhdxbgvsehybsueyvt987ruabr3aw8');

-- ---------------------------------------------------------------------------------------------------------------------
-- Документы

CREATE TABLE document_agency(
d_id INT UNSIGNED NOT NULL AUTO_INCREMENT  PRIMARY KEY COMMENT "Ун. ин.",
from_ag_id INT UNSIGNED NOT NULL COMMENT "Ссылка на аккаунт для которого были предоставлены документы",
name_doc VARCHAR(255) NOT NULL COMMENT "Название документа",
path_doc VARCHAR(255) NOT NULL COMMENT "Путь к файлу",
created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Дата и время пердоставления документа",
approved BOOLEAN COMMENT "Одобрен\не одобрен"
); 
ALTER TABLE document_agency ADD CONSTRAINT doc_id_from_agent FOREIGN KEY (from_ag_id) REFERENCES agent(a_id); 
-- ---------------------------------------------------------------------------------------------------------------------
INSERT INTO document_agency VALUES (NULL, FLOOR(RAND()*(10))+1, 'KJSHDFBHS', 'HGHHBDSHB', NOW(), ROUND(RAND())),(NULL, FLOOR(RAND()*(10))+1, 'YWEUIORUJWW', 'KMFDHCKMZC', NOW(), ROUND(RAND())),(NULL, FLOOR(RAND()*(10))+1, '2KL3JH4GJ2', '9MS8F', NOW(), ROUND(RAND())),(NULL, FLOOR(RAND()*(10))+1, '78W6E7OMWHN7', 'L,AKMUHDA7', NOW(), ROUND(RAND())),(NULL, FLOOR(RAND()*(10))+1, 'M8WNFYXBE86C7TR', 'LKSNCFIBF', NOW(), ROUND(RAND())),(NULL, FLOOR(RAND()*(10))+1, 'MIOCNYRB74', 'SLKCNHFBGUYS', NOW(), ROUND(RAND())),(NULL, FLOOR(RAND()*(10))+1, 'M09W8E9NY7', 'XMOSNEHFC', NOW(), ROUND(RAND())),(NULL, FLOOR(RAND()*(10))+1, 'DNHWQEWN7WNW8', ',09EF,9,9', NOW(), ROUND(RAND())),(NULL, FLOOR(RAND()*(10))+1, 'NDCB88SX', 'BXHJNGDUY', NOW(), ROUND(RAND())),(NULL, FLOOR(RAND()*(10))+1, 'BWX67FB7S', 'COSNEF7B7', NOW(), ROUND(RAND()));
-- ---------------------------------------------------------------------------------------------------------------------
-- Сообщения
CREATE TABLE messages (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
  from_user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на отправителя сообщения",
  to_user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на получателя сообщения",
  body TEXT NOT NULL COMMENT "Текст сообщения",
  is_delivered BOOLEAN COMMENT "Признак доставки",
  created_at DATETIME DEFAULT NOW() COMMENT "Время создания строки",
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
);

ALTER TABLE messages ADD CONSTRAINT messages_from_user_id FOREIGN KEY (from_user_id) REFERENCES users(id); 
ALTER TABLE messages ADD CONSTRAINT messages_to_user_id FOREIGN KEY (to_user_id) REFERENCES users(id); 

INSERT INTO messages VALUES (NULL, FLOOR(RAND()*(20))+1, FLOOR(RAND()*(20))+1, substr(MD5(RAND()) FROM 1 FOR 10), ROUND(RAND()),NOW(),NOW()),(NULL, FLOOR(RAND()*(20))+1, FLOOR(RAND()*(20))+1, substr(MD5(RAND()) FROM 1 FOR 10), ROUND(RAND()),NOW(),NOW()),(NULL, FLOOR(RAND()*(20))+1, FLOOR(RAND()*(20))+1, substr(MD5(RAND()) FROM 1 FOR 10), ROUND(RAND()),NOW(),NOW()),(NULL, FLOOR(RAND()*(20))+1, FLOOR(RAND()*(20))+1, substr(MD5(RAND()) FROM 1 FOR 10), ROUND(RAND()),NOW(),NOW()),(NULL, FLOOR(RAND()*(20))+1, FLOOR(RAND()*(20))+1, substr(MD5(RAND()) FROM 1 FOR 10), ROUND(RAND()),NOW(),NOW()),(NULL, FLOOR(RAND()*(20))+1, FLOOR(RAND()*(20))+1, substr(MD5(RAND()) FROM 1 FOR 10), ROUND(RAND()),NOW(),NOW()),(NULL, FLOOR(RAND()*(20))+1, FLOOR(RAND()*(20))+1, substr(MD5(RAND()) FROM 1 FOR 10), ROUND(RAND()),NOW(),NOW()),(NULL, FLOOR(RAND()*(20))+1, FLOOR(RAND()*(20))+1, substr(MD5(RAND()) FROM 1 FOR 10), ROUND(RAND()),NOW(),NOW()),(NULL, FLOOR(RAND()*(20))+1, FLOOR(RAND()*(20))+1, substr(MD5(RAND()) FROM 1 FOR 10), ROUND(RAND()),NOW(),NOW()),(NULL, FLOOR(RAND()*(20))+1, FLOOR(RAND()*(20))+1, substr(MD5(RAND()) FROM 1 FOR 10), ROUND(RAND()),NOW(),NOW()),(NULL, FLOOR(RAND()*(20))+1, FLOOR(RAND()*(20))+1, substr(MD5(RAND()) FROM 1 FOR 10), ROUND(RAND()),NOW(),NOW());
-- -----------------------------------------------------------------------------------------------------------------------------
-- Обьект Дом

CREATE TABLE type_adv(
type_adv_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Ун. ин.",
name_type_adv VARCHAR(255) NOT NULL COMMENT "Название типа обьявления"
);
INSERT INTO type_adv VALUES (NULL,'FREE'),(NULL,'PREMIUM+COLOR'),(NULL,'TOP'),(NULL,'PREMIUM'),(NULL,'PAID'),(NULL,'COLOR');

CREATE TABLE house(
house_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Уню ин.",
user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на пользователя, который разместил обьявление",
address VARCHAR(255) NOT NULL COMMENT "Адрес объекта",
name_cottage_village VARCHAR(255) COMMENT "Название коттеджного поселка",
year_bilt DATE COMMENT "Год постройки",
material_h ENUM('кирпич','монолит','дерево','щит','каркас','газобетон','газосиликат','пенобетон') COMMENT "Материал дома",
square DECIMAL(4,2) UNSIGNED NOT NULL COMMENT "Площадь дома",
floors_h TINYINT UNSIGNED COMMENT "Количество этажей",
number_bedroom TINYINT UNSIGNED COMMENT "Количество спален",
bathroom ENUM('на улице','в доме') COMMENT "Санузел",
heating ENUM('центральное газовое','центральное угольное','печь','камин','электрическое','автономное газовое','дизельное','твердотопливный кател','без отопления') COMMENT "Тип отопления",
square_plot INT UNSIGNED NOT NULL COMMENT "Площадь участка",
status_plot ENUM('Фермерское хоз-во','Личное подсобное х-во','Садоводство','ИЖС','Земля промназначения','ДНП'),
photo_h VARCHAR(255) COMMENT "Ссылка на фото обьекта",
video_h VARCHAR(255) COMMENT "Ссылка на видео обьекта",
about_h TEXT COMMENT "Описание обьекта",
tel VARCHAR(12) NOT NULL COMMENT "Телефон",
tel_2 VARCHAR(12) COMMENT "Телефон_2",
type_id INT UNSIGNED NOT NULL COMMENT "Тип объявления",
type_of_transaction ENUM ('sale','rent') COMMENT "Тип сделки",
price DOUBLE UNSIGNED NOT NULL COMMENT "Стоимость обьекта",
created_ad_price DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Дата и время внесения цены"
);
ALTER TABLE house ADD CONSTRAINT type_advers_id_name FOREIGN KEY (type_id) REFERENCES type_adv(type_adv_id);
ALTER TABLE house ADD CONSTRAINT user_id_who_posted FOREIGN KEY (user_id) REFERENCES users(id);

INSERT INTO house VALUES (NULL, FLOOR(RAND()*(20))+1, substr(MD5(RAND()) FROM 1 FOR 20), substr(MD5(RAND()) FROM 1 FOR 10), FROM_UNIXTIME(ROUND((RAND() * (UNIX_TIMESTAMP('1940-01-01')-UNIX_TIMESTAMP('2021-10-01')))+UNIX_TIMESTAMP('2021-10-01')),'%Y-%m-%d'),'кирпич', ROUND(RAND()*(250),2)+10, FLOOR(RAND()*(4))+1, FLOOR(RAND()*(5))+1, 'в доме', 'камин', ROUND(RAND()*(10),2)+2, 'ИЖС', substr(MD5(RAND()) FROM 1 FOR 10), substr(MD5(RAND()) FROM 1 FOR 15), substr(MD5(RAND()) FROM 1 FOR 20), '+79944634783', NULL, FLOOR(RAND()*(7))+1, 'sale', ROUND(RAND()*(3000000),2)+100000, NOW());

UPDATE house SET price=ROUND(RAND()*(3000000),2)+100000 WHERE house_id=10;
DROP TRIGGER update_price;
SELECT * FRom house;
SELECT * FROM history_price_h;
TRUNCATE history_price_h;
/*
delimiter |
CREATE TRIGGER `update_price` AFTER UPDATE ON `house`
FOR EACH ROW BEGIN
   INSERT INTO history_price_h Set advertisement_id=NEW.house_id, date_at = OLD.created_ad_price, old_price = OLD.price, mod_price =  NEW.price - old_price;
END|
*/

CREATE TABLE history_price_h (
h_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Ун. ин.",
advertisement_id INT UNSIGNED NOT NULL COMMENT "Ссылка на объявление",
date_at DATETIME COMMENT "Дата и время указания предыдущей стоимости",
old_price DOUBLE UNSIGNED NOT NULL COMMENT "Предыдущая стоимость обьекта",
mod_price DOUBLE NOT NULL COMMENT "Изменение стоимости обьекта"
);
ALTER TABLE history_price_h ADD CONSTRAINT avd_id_from_h_price FOREIGN KEY (advertisement_id) REFERENCES house(house_id);
-- ---------------------------------------------------------------------------------------------------------------------------
-- Участок

CREATE TABLE plot (
p_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Ун. ин.",
user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на пользователя, который разместил обьявление",
square_p INT UNSIGNED NOT NULL COMMENT "Площадь участка",
name_cottage_village VARCHAR(255) COMMENT "Название коттеджного поселка",
status_plot ENUM('Фермерское хоз-во','Личное подсобное х-во','Садоводство','ИЖС','Земля промназначения','ДНП'),
elect BOOLEAN NOT NULL COMMENT "Эликтричество",
gas BOOLEAN NOT NULL COMMENT "Газ",
sewerage BOOLEAN NOT NULL COMMENT "Канализация",
water_supply BOOLEAN NOT NULL COMMENT "Водоснабжение",
photo_h VARCHAR(255) COMMENT "Ссылка на фото обьекта",
video_h VARCHAR(255) COMMENT "Ссылка на видео обьекта",
about_h TEXT COMMENT "Описание обьекта",
tel VARCHAR(12) NOT NULL COMMENT "Телефон",
tel_2 VARCHAR(12) COMMENT "Телефон_2",
type_id INT UNSIGNED NOT NULL COMMENT "Тип объявления",
type_of_transaction ENUM ('sale','rent') COMMENT "Тип сделки",
price DOUBLE UNSIGNED NOT NULL COMMENT "Стоимость обьекта",
created_ad_price DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Дата и время внесения цены"
);

ALTER TABLE plot ADD CONSTRAINT type_advers_id_name_p FOREIGN KEY (type_id) REFERENCES type_adv(type_adv_id);
ALTER TABLE plot ADD CONSTRAINT user_id_who_posted_p FOREIGN KEY (user_id) REFERENCES users(id);

INSERT INTO plot VALUES (NULL, FLOOR(RAND()*(20))+1, ROUND(RAND()*(20),2)+2, substr(MD5(RAND()) FROM 1 FOR 10),'Земля промназначения', ROUND(RAND()),ROUND(RAND()), ROUND(RAND()), ROUND(RAND()), substr(MD5(RAND()) FROM 1 FOR 10), substr(MD5(RAND()) FROM 1 FOR 10), substr(MD5(RAND()) FROM 1 FOR 20), '+79880117919', NULL, FLOOR(RAND()*(5))+1, 'sale', ROUND(RAND()*(3000000),2)+100000, NOW());

UPDATE plot SET price=ROUND(RAND()*(3000000),2)+100000 WHERE p_id=4;
drop TRIGGER update_price_p;
SELECT * from history_price_p;

/*
delimiter |
CREATE TRIGGER `update_price_p` AFTER UPDATE ON `plot`
FOR EACH ROW BEGIN
   INSERT INTO history_price_p Set advertisement_id = NEW.p_id, date_at = OLD.created_ad_price, old_price = OLD.price, mod_price = NEW.price - old_price;
END|
*/

CREATE TABLE history_price_p (
h_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Ун. ин.",
advertisement_id INT UNSIGNED NOT NULL COMMENT "Ссылка на объявление",
date_at DATETIME COMMENT "Дата и время указания предыдущей стоимости",
old_price DOUBLE UNSIGNED NOT NULL COMMENT "Предыдущая стоимость обьекта",
mod_price DOUBLE UNSIGNED NOT NULL COMMENT "Изменение стоимости обьекта"
);
ALTER TABLE history_price_p ADD CONSTRAINT avd_id_from_h_price_p FOREIGN KEY (advertisement_id) REFERENCES plot(p_id);

-- ----------------------------------------------------------------------------------------------------------------------------
-- Квартира
CREATE TABLE additionally_type(
type_a_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Ун. ин.",
name_type VARCHAR(50)
);
INSERT INTO additionally_type VALUES (NULL,'Окно во двор'),(NULL,'Окна на улицу'),(NULL,'Балкон'),(NULL,'Лоджия'),(NULL,'Раздельный санузел'),(NULL,'Совмещенный санузел');
SELECT * FROM additionally_type;

CREATE TABLE flat(
f_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Ун. ин.",
user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на пользователя, который разместил обьявление",
type_f BOOLEAN NOT NULL COMMENT "Тип: квартира\апартаменты",
number_of_rooms ENUM('1','2','3','4','5','6','6 и более','свободная планировка','студия') COMMENT "Количество квартир",
square INT UNSIGNED NOT NULL COMMENT "Общая площадь",
layout VARCHAR(255) COMMENT "Путь к файлу(планировка)",
floor_ INT NOT NULL COMMENT "Этаж",
floors_in_the_house  INT UNSIGNED NOT NULL COMMENT "Этажей в доме",
area_living INT UNSIGNED COMMENT "Жилая площадь",
kitchen_square INT UNSIGNED COMMENT "Кухня площадь",
repair_f ENUM('Косметический','Евро','Дизайнерский','Без ремонта') COMMENT "Ремонт",
additionally INT UNSIGNED COMMENT "Дополнительно",
photo_h VARCHAR(255) COMMENT "Ссылка на фото обьекта",
video_h VARCHAR(255) COMMENT "Ссылка на видео обьекта",
about_h TEXT COMMENT "Описание обьекта",
tel VARCHAR(12) NOT NULL COMMENT "Телефон",
tel_2 VARCHAR(12) COMMENT "Телефон_2",
type_id INT UNSIGNED NOT NULL COMMENT "Тип объявления",
type_of_transaction ENUM ('sale','rent') COMMENT "Тип сделки",
price DOUBLE UNSIGNED NOT NULL COMMENT "Стоимость обьекта",
created_ad_price DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Дата и время внесения цены"
);
ALTER TABLE flat ADD CONSTRAINT type_advers_id_name_f FOREIGN KEY (type_id) REFERENCES type_adv(type_adv_id);
ALTER TABLE flat ADD CONSTRAINT additionally_type_id FOREIGN KEY (additionally) REFERENCES additionally_type(type_a_id);
ALTER TABLE flat ADD CONSTRAINT user_id_who_posted_f FOREIGN KEY (user_id) REFERENCES users(id);

INSERT INTO flat VALUES (NULL, FLOOR(RAND()*(20))+1, ROUND(RAND()), 'студия', FLOOR(RAND()*(80))+1, substr(MD5(RAND()) FROM 1 FOR 10), FLOOR(RAND()*(20))+1, FLOOR(RAND()*(20))+1, FLOOR(RAND()*(80))+1, FLOOR(RAND()*(80))+1, 'Косметический', FLOOR(RAND()*(6))+1, substr(MD5(RAND()) FROM 1 FOR 10), substr(MD5(RAND()) FROM 1 FOR 10), substr(MD5(RAND()) FROM 1 FOR 20), '+79017243898', '+79041503898', FLOOR(RAND()*(5))+1, 'rent', ROUND(RAND()*(30000),2)+10000, NOW());

SELECT * FROM flat;
DROP TRIGGER update_price_f;
UPDATE flat SET price=ROUND(RAND()*(3000000),2)+100000 WHERE f_id=6;
SELECT * FROM history_price_f;

/*
delimiter |
CREATE TRIGGER `update_price_f` AFTER UPDATE ON `flat`
FOR EACH ROW BEGIN
   INSERT INTO history_price_f Set advertisement_id = NEW.f_id, date_at = OLD.created_ad_price, old_price = OLD.price, mod_price = NEW.price - old_price;
END|
*/

CREATE TABLE history_price_f (
h_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Ун. ин.",
advertisement_id INT UNSIGNED NOT NULL COMMENT "Ссылка на объявление",
date_at DATETIME COMMENT "Дата и время указания предыдущей стоимости",
old_price DOUBLE UNSIGNED NOT NULL COMMENT "Предыдущая стоимость обьекта",
mod_price DOUBLE UNSIGNED NOT NULL COMMENT "Изменение стоимости обьекта"
);
ALTER TABLE history_price_f ADD CONSTRAINT avd_id_from_h_price_f FOREIGN KEY (advertisement_id) REFERENCES flat(f_id);

CREATE TABLE about_building(
flat_id INT UNSIGNED NOT NULL PRIMARY KEY COMMENT "Ссылка на квартиру",
material_h ENUM('кирпич','монолит','дерево','щит','каркас','газобетон','газосиликат','пенобетон') COMMENT "Материал дома",
passenger_elevators ENUM('Нет','1','2','3','4') NOT NULL COMMENT "Пассажирских лифтов",
freight_elevators ENUM('Нет','1','2','3','4') NOT NULL COMMENT "Грузовых лифтов",
name_building VARCHAR(255) COMMENT "Название ЖК",
year_building DATE COMMENT "Год постройки",
сeiling_height INT UNSIGNED COMMENT "Высота потолков",
ramp BOOLEAN COMMENT "Пандус",
parking ENUM('Наземная','Многоуровневая','Подземная','На крыше')
);
ALTER TABLE about_building ADD CONSTRAINT about_flat_id FOREIGN KEY (flat_id) REFERENCES flat(f_id);

INSERT INTO about_building VALUES (10, 'монолит', '1', '1', substr(MD5(RAND()) FROM 1 FOR 10), FROM_UNIXTIME(ROUND((RAND() * (UNIX_TIMESTAMP('1940-01-01')-UNIX_TIMESTAMP('2021-10-01')))+UNIX_TIMESTAMP('2021-10-01')),'%Y-%m-%d'), FLOOR(RAND()*4)+2, ROUND(RAND()), 'Многоуровневая');
-- ---------------------------------------------------------------------------------------------------------------------------
--

