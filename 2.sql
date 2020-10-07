CREATE SEQUENCE seq_messure
start with 1
increment by 1;

insert into t_measure(id_messure, names)
	values (nextval('seq_messure'), 'ШТ');
insert into t_measure(id_messure, names)
	values (nextval('seq_messure'), 'М');
insert into t_measure(id_messure, names)
	values (nextval('seq_messure'), 'Граммы');
insert into t_measure(id_messure, names)
	values (nextval('seq_messure'), 'СМ');
insert into t_measure(id_messure, names)
	values (nextval('seq_messure'), 'Л');


CREATE SEQUENCE seq_material
start with 1
increment by 1;

insert into t_material (id_material, names, id_messure)
	values (nextval('seq_material'), 'Nesquik', '3');
insert into t_material (id_material, names, id_messure)
	values (nextval('seq_material'), 'Конфеты', '3');
insert into t_material (id_material, names, id_messure)
	values (nextval('seq_material'), 'Шоколад', '3');
insert into t_material (id_material, names, id_messure)
	values (nextval('seq_material'), 'Леденцы', '3');
insert into t_material (id_material, names, id_messure)
	values (nextval('seq_material'), 'Гречневая крупа', '3');
insert into t_material (id_material, names, id_messure)
	values (nextval('seq_material'), 'Вода', '5');

CREATE SEQUENCE seq_inprice
start with 1
increment by 1;

insert into t_inprice (id_inprice,price, price_date, id_material)
	values (nextval('seq_inprice'), '150', '01.02.2019', '1');
insert into t_inprice (id_inprice,price, price_date, id_material)
	values (nextval('seq_inprice'), '20', '08.05.2019', '2');
insert into t_inprice (id_inprice,price, price_date, id_material)
	values (nextval('seq_inprice'), '120', '07.09.2019', '3');
insert into t_inprice (id_inprice,price, price_date, id_material)
	values (nextval('seq_inprice'), '15', '04.12.2019', '4');
insert into t_inprice (id_inprice,price, price_date, id_material)
	values (nextval('seq_inprice'), '300', '03.06.2019', '5');
insert into t_inprice (id_inprice,price, price_date, id_material)
	values (nextval('seq_inprice'), '50', '02.08.2019', '6');

CREATE SEQUENCE seq_store
start with 1
increment by 1;

insert into t_store (id_store, names)
	values (nextval('seq_store'), 'Склад №1');
insert into t_store (id_store, names)
	values (nextval('seq_store'), 'Склад №2');
insert into t_store (id_store, names)
	values (nextval('seq_store'), 'Склад №3');
insert into t_store (id_store, names)
	values (nextval('seq_store'), 'Склад №4');
insert into t_store (id_store, names)
	values (nextval('seq_store'), 'Склад №5');

CREATE SEQUENCE seq_caterer
start with 1
increment by 1;

insert into t_caterer (id_caterer,names,phone,fax,legal_address,fact_address, mail)
	values (nextval('seq_caterer'), 'Ореховый Алтай', '2419021', '0', 'Маршрутная, 15', 'Маршрутная, 10/2', 'opex@ya.ru');
insert into t_caterer (id_caterer,names,phone,fax,legal_address,fact_address,mail)
	values (nextval('seq_caterer'), 'Снэк Эксперт', '2419022', '0', 'Куйбышева, 109а', 'Куйбышева, 105', 'snek@ya.ru');
insert into t_caterer (id_caterer,names,phone,fax,legal_address,fact_address,mail)
	values (nextval('seq_caterer'), 'Лаки Фудс', '2419023', '0', 'Клары Цеткин, 21а', 'Клары Цеткин, 25а', 'lucky@ya.ru');
insert into t_caterer (id_caterer,names,phone,fax,legal_address,fact_address,mail)
	values (nextval('seq_caterer'), 'Тара ПЭТ', '2419024', '0', 'Комсомольский проспект, 82', 'Героев Хасана, 10', 'tara@ya.ru');
insert into t_caterer (id_caterer,names,phone,fax,legal_address,fact_address,mail)
	values (nextval('seq_caterer'), 'Фуд Сервис', '2419025', '0', 'Соловьёва, 3', 'Комсомольский проспект, 75', 'foodserv@ya.ru');

CREATE SEQUENCE seq_supply
start with 1
increment by 1;

insert into t_supply(id_supply, supply_date, id_caterer, id_store, id_material, volume)
	values (nextval('seq_supply'), '02.02.2019', '1', '2', '1', '30');
insert into t_supply(id_supply, supply_date, id_caterer, id_store, id_material, volume)
	values (nextval('seq_supply'), '10.05.2019', '2', '2', '2', '40');
insert into t_supply(id_supply, supply_date, id_caterer, id_store, id_material, volume)
	values (nextval('seq_supply'), '10.09.2019', '3', '5', '3', '50');
insert into t_supply(id_supply, supply_date, id_caterer, id_store, id_material, volume)
	values (nextval('seq_supply'), '12.12.2019', '4', '4', '4', '45');
insert into t_supply(id_supply, supply_date, id_caterer, id_store, id_material, volume)
	values (nextval('seq_supply'), '20.07.2019', '5', '3', '5', '20');

CREATE SEQUENCE seq_employer
start with 1
increment by 1;

insert into t_employer (id_employer, names, surname, father_name, gender)
	values (nextval('seq_employer'), 'Даниил', 'Миронович', 'Сафонов', 'М');
insert into t_employer (id_employer, names, father_name, surname, gender)
	values (nextval('seq_employer'), 'Козлов', 'Александрович', 'Козлов', 'М');
insert into t_employer (id_employer, names, father_name, surname, gender)
	values (nextval('seq_employer'), 'Сергей', 'Мирославович', 'Беляев', 'М');
insert into t_employer (id_employer, names, father_name, surname, gender)
	values (nextval('seq_employer'), 'Семён', 'Ильич', 'Петров', 'М');
insert into t_employer (id_employer, names, father_name, surname, gender)
	values (nextval('seq_employer'), 'Тимофей', 'Максимович', 'Краснов', 'М');

CREATE SEQUENCE seq_section
start with 1
increment by 1;		

insert into t_section (id_section, names, id_employer)
	values (nextval('seq_section'), 'Строительный цех', '4');
insert into t_section (id_section, names, id_employer)
	values (nextval('seq_section'), 'Лакокрасочный цех', '2');
insert into t_section (id_section, names, id_employer)
	values (nextval('seq_section'), 'Инструментальный цех', '3');
insert into t_section (id_section, names, id_employer)
	values (nextval('seq_section'), 'Цех по обработке метала', '5');
insert into t_section (id_section, names, id_employer)
	values (nextval('seq_section'), 'Цех обработки дерева', '1');

CREATE SEQUENCE seq_deliver
start with 1
increment by 1;

insert into t_deliver (id_deliver, deliver_date, id_material, id_store, id_section)
	values (nextval('seq_deliver'), '02.02.2019', '1', '1', '1');
insert into t_deliver (id_deliver, deliver_date, id_material, id_store, id_section)
	values (nextval('seq_deliver'),'12.03.2019', '2', '2', '2');
insert into t_deliver (id_deliver, deliver_date, id_material, id_store, id_section)
	values (nextval('seq_deliver'), '30.05.2019', '3', '3', '3');
insert into t_deliver (id_deliver, deliver_date, id_material, id_store, id_section)
	values (nextval('seq_deliver'), '20.07.2019', '4', '4', '4');
insert into t_deliver (id_deliver, deliver_date, id_material, id_store, id_section)
	values (nextval('seq_deliver'), '01.12.2019', '5', '5', '5');

CREATE SEQUENCE seq_surplus
start with 1
increment by 1;

insert into t_surplus (id_surplus,id_store,id_material,volume)
	values (nextval('seq_surplus'),'2','1','5');
insert into t_surplus (id_surplus,id_store,id_material,volume)
	values (nextval('seq_surplus'),'1','2','10');
insert into t_surplus (id_surplus,id_store,id_material,volume)
	values (nextval('seq_surplus'),'3','3','15');
insert into t_surplus (id_surplus,id_store,id_material,volume)
	values (nextval('seq_surplus'),'2','4','20');
insert into t_surplus (id_surplus,id_store,id_material,volume)
	values (nextval('seq_surplus'),'3','5','5');

ALTER TABLE t_group
DROP name_material,
ADD names varchar;

CREATE SEQUENCE seq_group
start with 1
increment by 1;

insert into t_group (id_group, id_material, names)
	values (nextval('seq_group'),'1', 'Кондитерка');
insert into t_group (id_group, id_material, names)
	values ('1','2', 'Кондитерка');
insert into t_group (id_group, id_material, names)
	values ('1','3', 'Кондитерка');
insert into t_group (id_group, id_material, names)
	values ('1','4', 'Кондитерка');
insert into t_group (id_group, id_material,names)
	values (nextval('seq_group'),'5', 'Крупы');
insert into t_group (id_group, id_material,names)
	values (nextval('seq_group'),'6', 'Жидкости');
/*8*/
DELETE FROM t_inprice WHERE price_date < '31.12.2000';

/*9*/
DELETE FROM t_measure WHERE id_messure = 2;
UPDATE t_material
SET id_messure = '1'
WHERE id_material = '6'
DELETE FROM t_measure WHERE id_messure = 5;

/*10*/
UPDATE t_surplus
SET volume = 0
WHERE id_store = '2';

/*11*/
ALTER TABLE t_employer
ADD dob date,
ADD	relations varchar (100);

UPDATE t_employer
SET dob = '20.12.2000'
WHERE id_employer = '1';

UPDATE t_employer
SET relations = 'Женат'
WHERE id_employer = '1';
/*12*/
UPDATE t_caterer
SET phone = '24999'
WHERE id_caterer = '1';
/*13*/	
UPDATE t_inprice
SET price = price-price/100*15;