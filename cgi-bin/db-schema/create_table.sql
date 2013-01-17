drop table Student, Province, City;
create table Student
(
 id int unsigned not null,
 name varchar(20) not null,
 gender varchar(10) not null,
 school varchar(20) not null,
 major varchar(20) not null,
 birth date not null,
 province varchar(30) not null,
 city varchar(30) not null,
 info text not null,
 primary key(id, school)
);

create table Province
(
 province_id int unsigned not null auto_increment primary key,
 province varchar(30) not null
);

create table City
(
 city_id int unsigned not null auto_increment primary key,
 city varchar(30) not null,
 province_id int unsigned not null
);
