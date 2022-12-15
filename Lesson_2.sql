/*Практическое задание к Уроку №1:
Задание 1 (Установите СУБД MySQL. Создайте в домашней директории файл .my.cnf, 
задав в нем логин и пароль, который указывался при установке.)

*СУБД MySQL установлено и настроено для дальшнейшей работы*/

/*Задание 2 (Создайте базу данных example, разместите в ней таблицу users,
состоящую из двух столбцов, числового id и строкового name.)*/

-- Создание базы данных: 
CREATE DATABASE example ;
USE example;

-- Создание таблицы:
DROP TABLE IF EXISTS users;
CREATE TABLE users (
id INT PRIMARY KEY,
name VARCHAR(255)
);

/*Задание 3 (Создайте дамп базы данных example из предыдущего задания,
 разверните содержимое дампа в новую базу данных sample.*/


-- Создание дампа БД через Командную строку 
musqldump -uroot -p example > dump.sql 
Enter Password: *****

-- Развернуть содержимое дампа в новую БД sample через Командную строку:
/*CREATE database sample;
 musqldump -uroot -p sample < dump.sql 
Enter Password: *****
Dump completed on date*/







