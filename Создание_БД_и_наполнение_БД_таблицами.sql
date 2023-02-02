-- Создание БД электронного магазина
DROP DATABASE  IF EXISTS MYSHOP;
CREATE DATABASE MYSHOP;

USE myshop;

-- Наполнение БД таблицами

DROP TABLE IF EXISTS clients;
CREATE TABLE clients (
id SERIAL PRIMARY KEY,
	firstname VARCHAR(100) NOT NULL,
    lastname VARCHAR(100) NOT NULL ,
    patronymic VARCHAR (100) null,
    email VARCHAR(100) UNIQUE,
   	birthday DATE NOT NULL,
    gender CHAR(1),
    address VARCHAR(255) NOT NULL,
    phone_number BIGINT  NOT NULL,
    type_of_identity_document enum ('passport', 'driver license', 'international passport') COMMENT 'Вид документа',
    series_of_documents INT UNIQUE NOT NULL COMMENT 'Серия документа',
    document_number INT UNIQUE NOT NULL COMMENT 'Номер документа'
);

DROP TABLE IF EXISTS products;
CREATE TABLE products (
	id SERIAL PRIMARY KEY,
	product_name VARCHAR(100) NOT NULL COMMENT 'Наименование продукта',
	price DECIMAL NOT NULL,
	product_code INT UNIQUE NOT NULL COMMENT 'Идентификационный код продукта',
	type_of_product VARCHAR (20) COMMENT 'Категория продукта',
	manufacturer VARCHAR (255) NOT NULL COMMENT 'Производитель',
	color VARCHAR(20),
	weight VARCHAR (20) NOT NULL
	);

DROP TABLE IF EXISTS oreders;
CREATE TABLE orders (
id SERIAL PRIMARY KEY,
clients VARCHAR(255) NOT NULL,
total_amount INT NOT NULL COMMENT 'Итоговое количество товаров',
total_price DECIMAL NOT NULL COMMENT 'Общая стоимость',
type_of_delivery enum ('pickup', 'home delivery') COMMENT 'Вид доставки (самовывоз/доставка на дом)',
delivery_date DATETIME COMMENT 'Дата доставки'
);

DROP TABLE IF EXISTS addresses;
CREATE TABLE addresses (
	id SERIAL PRIMARY KEY,
	сlient_initials VARCHAR (50) NOT NULL COMMENT 'Инициалы клиента',
	country VARCHAR (50),
	town VARCHAR (50) NOT NULL COMMENT 'Город',
	street VARCHAR (50) NOT NULL COMMENT 'Улица',
	building VARCHAR (50) NOT NULL COMMENT 'Строение',
	type_of_address enum ('pickup', 'personal address')
	);
	

DROP TABLE IF EXISTS warehouses;
CREATE TABLE warehouses (
id SERIAL PRIMARY KEY,
warehouse_name VARCHAR (100) COMMENT 'Название склада',
country VARCHAR (50),
town VARCHAR (50) NOT NULL COMMENT 'Город',
street VARCHAR (50) NOT NULL COMMENT 'Улица',
building VARCHAR (50) NOT NULL COMMENT 'Строение',
room VARCHAR (50) NOT NULL COMMENT 'Помещение',
warehouse_code INT UNIQUE COMMENT 'Идентификационный код склада'
);

DROP TABLE IF EXISTS stoks;
CREATE TABLE stoks (
id SERIAL PRIMARY KEY,
leftovers_in_stock INT NOT NULL COMMENT 'Остатки на складах',
warehouse_code INT UNIQUE
);

DROP TABLE IF EXISTS pickup; /*Самовывоз*/
CREATE TABLE pickup (
id SERIAL PRIMARY KEY,
pickup_name VARCHAR(255) NOT NULL COMMENT 'Название пункта самовывоза',
address VARCHAR (255) NOT NULL,
time_open TIME NOT NULL COMMENT 'Открвыется в',
time_close TIME NOT NULL COMMENT 'Закрывается в'
);


DROP TABLE IF EXISTS promotions;
CREATE TABLE promotions(
id SERIAL PRIMARY KEY,
condition_of_promotion TEXT COMMENT 'Условия акции',
discount INT NOT NULL COMMENT 'Размер скидки',
start_date DATETIME COMMENT 'Дата начала акции',
expiration_date DATETIME COMMENT 'Дата окончания акции'
);

DROP TABLE IF EXISTS suppliers; /*Поставщики*/
CREATE TABLE suppliers (
id SERIAL PRIMARY KEY,
name VARCHAR (255),
contract_number INT UNIQUE NOT NULL COMMENT 'Номер договора',
date_of_conclusion_contract DATE not null COMMENT 'Дата начала договора',
contract_termination_date DATE NOT NULL COMMENT 'Дата прекращения договора'
);

DROP TABLE IF EXISTS product_categories;
CREATE TABLE product_categories(
id SERIAL PRIMARY KEY,
name VARCHAR (100) not null,
suppliers VARCHAR(100) not null
);











