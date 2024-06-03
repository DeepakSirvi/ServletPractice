create database contact_book;
create table contact_book.user(uid int primary key auto_increment,name varchar(255),email varchar(255) unique,password varchar(15),address varchar(255),image varchar(255));
create table contact_book.contact(id int,name varchar(255),email varchar(255),phone varchar(15),uId int FOREIGN KEY REFERENCES user(uid));
alter table contact_book.user rename column uid to id;