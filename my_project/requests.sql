use cian;

SELECT type_ac, COUNT(1) AS total FROM users GROUP BY type_ac;


-- найти все аккаунты, которые продают квартиры в домах, построенных не ранее 1985г и вывести стоимость, номер телефона.
SELECT * from about_building WHERE year_building > '1985-01-01';

SELECT id, 
person_id, 
agent_id, 
type_ac, 
f.price,
f.tel
FROM 
users u
INNER JOIN flat f on(
id=user_id 
AND f_id in (SELECT flat_id from about_building WHERE year_building > '1985-01-01')
);

-- Вывести айди обьявления, айди аккаунта, адрес, год постройки,площадь, телефон,тип аккаунта, цену и тип сделки для обьекта дом

CREATE OR REPLACE VIEW sort_price_h AS
SELECT house_id, user_id, address, year_bilt, square, tel, u.type_ac, price,type_of_transaction
FROM house 
INNER JOIN users u on(
user_id = id and type_of_transaction = 'rent'
)
ORDER BY price;

SELECT * FROM sort_price_h;


-- Найти обьявления о продаже участков где цена была снижена, есть газ и водоснобжение, для Личное подсобное х-во, установить тип аккаута, который выставил объявление

CREATE OR REPLACE VIEW find_plot AS
SELECT p_id, user_id, gas, water_supply, status_plot, u.type_ac  from plot p
INNER JOIN users u ON(
user_id = id AND 
p_id in (SELECT advertisement_id FROM history_price_p) AND
gas = TRUE AND
water_supply = TRUE AND
status_plot = 'Личное подсобное х-во'
);
SELECT * FROM find_plot;