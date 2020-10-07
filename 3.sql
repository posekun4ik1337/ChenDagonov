SELECT * FROM t_measure

SELECT * FROM t_employer
/*15*/
SELECT id_material, names FROM t_material
/*16*/
SELECT names, surname, father_name, dateofbirth, relationship FROM t_employer
/*17*/
SELECT * FROM t_employer
WHERE gender = 'М'
/*18*/
SELECT * FROM t_caterer
WHERE id_caterer in
(SELECT id_caterer FROM t_supply
WHERE supply_date between '01.04.2019' and '30.06.2019')
/*19*/
SELECT * FROM t_section
WHERE id_section in
(SELECT id_section FROM t_deliver
WHERE deliver_date >= '01.01.2019'
AND deliver_date >= '01.05.2019')
/*20*/
UPDATE t_deliver
SET deliver_date = current_date
WHERE id_store = 2

SELECT names FROM t_section
WHERE id_section in 
(SELECT id_section FROM t_deliver
WHERE deliver_date = current_date)
/*21*/
UPDATE t_supply
SET supply_date = current_date
WHERE id_material = 4 

SELECT names FROM t_material
WHERE id_material in 
(SELECT id_material FROM t_supply
WHERE supply_date = current_date)
/*22*/
UPDATE t_supply
SET volume = 0
WHERE id_material = 1

SELECT names FROM t_material
WHERE id_material in
(SELECT id_material FROM t_supply
WHERE supply_date != current_date
AND volume = 0)
/*23*/
SELECT t_employer.names, t_employer.father_name, t_employer.surname, t_section.names
FROM t_employer, t_section
WHERE t_employer.id_employer = t_section.id_employer
/*24*/
CREATE TABLE t_job
(
	id_job int NOT NULL,
	id_employer int,
	names varchar (100) NOT NULL,
	CONSTRAINT pk_job PRIMARY KEY (id_job),
	CONSTRAINT fk_job_employer FOREIGN KEY (id_employer) REFERENCES t_employer (id_employer)
);

insert into t_job (id_job, names, id_employer)
	values ('1', 'Кладовщик', '1');
insert into t_job (id_job, names, id_employer)
	values ('2', 'Продавец', '2');
insert into t_job (id_job, names, id_employer)
	values ('3', 'Продавец', '3');
insert into t_job (id_job, names, id_employer)
	values ('4', 'Продавец', '4');
insert into t_job (id_job, names, id_employer)
	values ('5', 'Продавец', '5');



SELECT t_employer.names, t_employer.father_name, t_employer.surname, t_section.names, t_job.names
FROM t_employer, t_section, t_job
WHERE t_employer.id_employer = t_section.id_employer
AND t_employer.id_employer = t_job.id_employer
/*25*/
UPDATE t_supply
SET supply_date = '23.02.2019'
WHERE id_caterer = 1

SELECT t_material.names, t_supply.volume, t_inprice.price, t_supply.supply_date,
t_caterer.names, t_caterer.phone ,t_caterer.legal_address, t_caterer.fact_address, t_caterer.mail 
FROM t_supply, t_material, t_inprice, t_caterer
WHERE supply_date between '01.01.2019' and '31.03.2019'
AND t_caterer.id_caterer = t_supply.id_caterer
AND t_supply.id_material = t_material.id_material
AND t_inprice.id_material = t_material.id_material
/*26*/
ALTER TABLE t_caterer
ADD city varchar (100)

UPDATE t_caterer
SET city = 'Пермь'
WHERE id_caterer = '3'

SELECT t_material.names, t_supply.volume, t_inprice.price, t_supply.supply_date,
t_caterer.names, t_caterer.phone ,t_caterer.legal_address,t_caterer.city , t_caterer.fact_address, t_caterer.mail 
FROM t_supply, t_material, t_inprice, t_caterer
WHERE supply_date between '01.01.2019' and '31.03.2019'
AND t_caterer.city = 'Пермь'
AND t_caterer.id_caterer = t_supply.id_caterer
AND t_supply.id_material = t_material.id_material
AND t_inprice.id_material = t_material.id_material
/*27*/
SELECT t_material.names, t_store.names, t_surplus.volume
FROM t_material, t_store, t_surplus
WHERE t_store.id_store = t_surplus.id_store
AND t_material.id_material = t_surplus.id_material
/*28*/
SELECT t_caterer.names "Имена поставщиков",
t_material.names "Материалы",
t_supply.supply_date "Дата поставки",
t_supply.volume "Кол-во материалов",
t_inprice.price "Цена"
FROM t_supply
INNER JOIN t_caterer on t_caterer.id_caterer = t_supply.id_caterer
INNER JOIN t_material on t_material.id_material = t_supply.id_material
INNER JOIN t_inprice on t_inprice.id_material = t_material.id_material
WHERE t_supply.supply_date between '01.01.2019' and '31.03.2019'
/*29*/
SELECT t_caterer.names "Имена поставщиков",
t_material.names "Материалы",
t_supply.supply_date "Дата поставки",
t_supply.volume "Кол-во материалов",
t_inprice.price "Цена"
FROM t_supply
LEFT JOIN t_caterer on t_caterer.id_caterer = t_supply.id_caterer
LEFT JOIN t_material on t_material.id_material = t_supply.id_material
LEFT JOIN t_inprice on t_inprice.id_material = t_material.id_material
/*30*/
SELECT t_store.names "Название склада",
t_material.names "Материал",
t_supply.volume "Остаток материалов"
FROM t_supply
INNER JOIN t_material on t_material.id_material = t_supply.id_material
INNER JOIN t_store on t_store.id_store = t_supply.id_store
/*31*/
SELECT t_material.names "Материал",
t_measure.names "Единица измерения",
t_inprice.price "Цена"
FROM t_measure
INNER JOIN t_material on t_material.id_messure = t_measure.id_messure
INNER JOIN t_inprice on t_inprice.id_material = t_material.id_material
WHERE t_inprice.price_date between '01.07.2019' and '30.09.2019'
/*32*/
SELECT t_material.names "Материал",
t_measure.names "Единица измерения",
t_inprice.price "Цена"
FROM t_measure
LEFT JOIN t_material on t_material.id_messure = t_measure.id_messure
LEFT JOIN t_inprice on t_inprice.id_material = t_material.id_material
/*33*/
ALTER TABLE t_employer
ADD id_manager int;

UPDATE t_employer
SET id_manager = '1'
WHERE id_employer = '1'

UPDATE t_employer
SET id_manager = '2'
WHERE id_employer = '2'

UPDATE t_employer
SET id_manager = '3'
WHERE id_employer = '3'

UPDATE t_employer
SET id_manager = '4'
WHERE id_employer = '4'

/*34*/
ALTER TABLE t_group
ADD id_priority_materials varchar (100);

UPDATE t_group
SET id_priority_materials = '1'
WHERE id_material = '5'
UPDATE t_group
SET id_priority_materials = '2'
WHERE id_material = '6'
UPDATE t_group
SET id_priority_materials = '3'
WHERE id_material = '3'
UPDATE t_group
SET id_priority_materials = '3'
WHERE id_material = '1'

SELECT t_material.names "Материал",
t_group.n_m "Подгруппа материала"
FROM t_group INNER JOIN t_material
on t_group.id_group = t_material.id_material
/*35*/
CREATE TABLE t_exemp
(
	id_exemp int NOT NULL,
	surname varchar (100) NOT NULL,
	names varchar (100) NOT NULL,
	father_name varchar (100) NOT NULL,
	gender varchar (100) NOT NULL,
	dob varchar (100) NOT NULL,
	id_manager int (100),
	CONSTRAINT pk_exemp PRIMARY KEY (id_exemp)
);

CREATE SEQUENCE seq_exemp
start with 1
increment by 1;

insert into t_exemp (id_exemp, names, father_name, surname, gender, dob, id_manager)
	values (nextval('seq_exemp'), 'Артём', 'Глебович', 'Петухов', 'М','31.12.1990','1');
insert into t_exemp (id_exemp, names, father_name, surname, gender, dob, id_manager)
	values (nextval('seq_exemp'), 'Максим', 'Константинович', 'Кожевников', 'М','20.01.1992','2');
insert into t_exemp (id_exemp, names, father_name, surname, gender, dob, id_manager)
	values (nextval('seq_exemp'), 'Григорий', 'Маркович', 'Волков', 'М','31.03.1985','3');
insert into t_exemp (id_exemp, names, father_name, surname, gender, dob, id_manager)
	values (nextval('seq_exemp'), 'Мирон', 'Кириллович', 'Иванов ', 'М','29.12.1982','4');
insert into t_exemp (id_exemp, names, father_name, surname, gender, dob, id_manager)
	values (nextval('seq_exemp'), 'Савелий', 'Ярославович', 'Севастьянов', 'М','01.01.1981','4');
/*36*/
ALTER TABLE t_exemp
ADD dismissed varchar (100);

UPDATE t_exemp
SET dismissed = '09.09.2019'
WHERE id_exemp = '1'
/*37*/
CREATE TABLE t_contact
(
	id_contact int NOT NULL,
	names varchar (100) NOT NULL,
	father_name varchar (100) NOT NULL,
	surname varchar (100) NOT NULL,
	phone varchar (100) NOT NULL,
	id_job int,
	CONSTRAINT pk_contact PRIMARY KEY (id_contact)
);

CREATE SEQUENCE seq_contact
start with 1
increment by 1;

insert into t_contact (id_contact,names,father_name,surname,phone,id_job)
	values (nextval('seq_contact'), 'Артём', 'Глебович', 'Петухов','2419122','6');
insert into t_contact (id_contact,names,father_name,surname,phone,id_job)
	values (nextval('seq_contact'), 'Лев ', 'Дмитриевич', 'Денисов','2419125','6');
insert into t_contact (id_contact,names,father_name,surname,phone,id_job)
	values (nextval('seq_contact'), 'Максим', 'Константинович', 'Кожевников','2419124','6');
insert into t_contact (id_contact,names,father_name,surname,phone,id_job)
	values (nextval('seq_contact'), 'Григорий', 'Маркович', 'Волков','2419123','6');
insert into t_contact (id_contact,names,father_name,surname,phone,id_job)
	values (nextval('seq_contact'), 'Савелий', 'Ярославович', 'Севастьянов','2419121','6');

ALTER TABLE t_job
ADD id_contact int,
ADD id_caterer int,
ADD CONSTRAINT fk_id_contact FOREIGN KEY (id_contact) REFERENCES t_contact (id_contact),
ADD CONSTRAINT fk_id_caterer FOREIGN KEY (id_caterer) REFERENCES t_caterer (id_caterer)

insert into t_job (id_job, names, id_contact)
	values ('6', 'Контактное лицо', '1');
insert into t_job (id_job, names, id_contact)
	values ('6', 'Контактное лицо', '2');
insert into t_job (id_job, names, id_caterer)
	values ('7', 'Поставщик', '1');
insert into t_job (id_job, names, id_caterer)
	values ('7', 'Поставщик', '2');
insert into t_job (id_job, names, id_caterer)
	values ('7', 'Поставщик', '3');
insert into t_job (id_job, names, id_caterer)
	values ('7', 'Поставщик', '4');
insert into t_job (id_job, names, id_caterer)
	values ('7', 'Поставщик', '5');

ALTER TABLE t_caterer
ADD id_job int

UPDATE t_caterer
SET id_job = '7'
WHERE id_caterer = '1'
UPDATE t_caterer
SET id_job = '7'
WHERE id_caterer = '2'

UPDATE t_caterer
SET id_job = '7'
WHERE id_caterer = '3'

UPDATE t_caterer
SET id_job = '7'
WHERE id_caterer = '4'

UPDATE t_caterer
SET id_job = '7'
WHERE id_caterer = '5'

SELECT t_caterer.names "Имя",
NULL as "Фамилия",
NULL as "Отчество",
t_caterer.phone "Номер телефона",
t_job.names "Должность в компании"
FROM t_caterer INNER JOIN t_job
on t_caterer.id_job = t_job.id_job
UNION
SELECT t_contact.names "Имя",
t_contact.father_name "Фамилия",
t_contact.surname "Отчество",
t_contact.phone "Номер телефона",
t_job.names "Должность в компании"
from t_contact INNER JOIN t_job
on t_contact.id_job = t_job.id_job

/*38*/
SELECT t_caterer.names FROM t_caterer
ORDER BY names

/*39*/
SELECT t_caterer.names "Наименование",
t_contact.names "Имя",
t_contact.surname "Фамилия",
t_contact.father_name "Отчество"
FROM t_caterer LEFT JOIN t_contact
on t_caterer.id_caterer = t_contact.id_contact
ORDER BY t_caterer.names, t_contact.names, t_contact.surname, t_contact.father_name

/*40*/
SELECT t_store.names "Название склада",
t_material.names "Наименование материала",
t_supply.volume "Остаток"
FROM t_store
INNER JOIN t_material on t_material.id_material = t_supply.id_material
INNER JOIN t_supply on t_supply.id_store = t_store.id_store
ORDER BY t_store.names, t_supply.volume DESC

/*41*/
UPDATE t_supply
SET supply_date = current_date
WHERE id_caterer = '1'

UPDATE t_supply
SET supply_date = current_date
WHERE id_caterer = '2'

UPDATE t_supply
SET supply_date = current_date
WHERE id_caterer = '3'

SELECT t_material.names "Материал",
t_caterer.names "Поставщик",
t_supply.volume "Поставка"
FROM t_material
INNER JOIN t_supply on t_supply.id_material = t_material.id_material
INNER JOIN t_caterer on t_supply.id_caterer = t_caterer.id_caterer
WHERE t_supply.supply_date between '01.01.2020' and current_date
GROUP BY t_caterer.names, t_supply.volume, t_material.names
ORDER BY t_caterer.names, t_material.names

/*42*/
SELECT t_material.names "Материал",
t_caterer.names "Поставщик",
t_supply.volume "Поставка",
t_inprice.price "Цена поставки",
AVG (t_inprice.price) :: NUMERIC(10,2) "Средняя цена поставки"
FROM t_material
INNER JOIN t_supply on t_supply.id_material = t_material.id_material
INNER JOIN t_caterer on t_supply.id_caterer = t_caterer.id_caterer
INNER JOIN t_inprice on t_inprice.id_material = t_material.id_material
WHERE t_supply.supply_date between '01.01.2020' and current_date
GROUP BY t_caterer.names, t_supply.volume, t_material.names, t_inprice.price
ORDER BY t_caterer.names, t_material.names

/*43*/
SELECT t_material.names "Материал",
t_caterer.names "Поставщик",
t_supply.volume "Поставка",
t_inprice.price "Цена поставки",
SUM (t_supply.volume) :: NUMERIC(10,2) "Общее количество поставок"
FROM t_material
INNER JOIN t_supply on t_supply.id_material = t_material.id_material
INNER JOIN t_caterer on t_supply.id_caterer = t_caterer.id_caterer
INNER JOIN t_inprice on t_inprice.id_material = t_material.id_material
WHERE t_supply.supply_date between '01.01.2020' and current_date
GROUP BY t_caterer.names, t_supply.volume, t_material.names, t_inprice.price
ORDER BY t_caterer.names, t_material.names

/*44*/
SELECT t_inprice.price "Цена поставки",
t_surplus.volume "Остаток",
AVG (t_inprice.price) :: NUMERIC(10,2) as Price,
SUM (t_surplus.volume) "Остаток каждого материала",
SUM (Price * t_surplus.volume) "Цена остатка"
FROM t_inprice INNER JOIN t_surplus
on t_surplus.id_material = t_inprice.id_material
GROUP BY t_inprice.price, t_surplus.volume

/*45*/
SELECT t_material.names "Материал",
t_inprice.price "Цена"
FROM t_material
INNER JOIN t_inprice on t_inprice.id_material = t_material.id_material
WHERE t_inprice.price_date between '01.01.2020' and '22.09.2020'

/*46*/
UPDATE t_surplus
SET volume = '0'
WHERE id_store = '1'

SELECT names as "Материал",
volume as "Остаток"
FROM t_store INNER JOIN t_surplus
on t_surplus.id_store = t_store.id_store
GROUP BY names, volume HAVING sum(volume) = 0

/*47*/
SELECT t_caterer.names "Поставщик",
t_supply.volume "Посавка",
t_inprice.price "Цена поставки"
FROM t_caterer 
INNER JOIN t_supply on t_supply.id_caterer = t_caterer.id_caterer
INNER JOIN t_inprice on t_inprice.id_material = t_supply.id_material
WHERE t_supply.supply_date between '01.01.2020' and current_date
GROUP BY t_caterer.names, t_supply.volume, t_inprice.price HAVING sum(volume * price) < 1000