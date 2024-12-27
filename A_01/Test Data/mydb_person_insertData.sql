INSERT INTO mydb.person values(101,"John","Canady");
INSERT INTO mydb.person values(102,"David","Miler");
INSERT INTO mydb.person values(103,"Smith","Hock");
INSERT INTO mydb.person values(104,"Marry","Canady");
INSERT INTO mydb.person values(105,"Tye","Canady");

--create database mydb;
--use mydb;
--show tables;
--desc person;
--select * from mydb.person;
--delete from person;

--insert mutiple values insert one time
INSERT INTO mydb.person (id,first_name,last_name)
values
(101,"John","Canady"),
(102,"David","Miler"),
(103,"Smith","Hock"),
(104,"Marry","Canady"),
(105,"Tye","Canady");