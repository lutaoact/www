truncate table Province;
truncate table City;
insert into Province (province) values('Shanghai'), ('Shanxi'), ('Liaoning'), ('Shandong');
insert into City (city, province_id) values('Yanan', 2), ('Xian', 2), ('Minhang', 1), ('Huangpu', 1), ('Shenyang', 3), ('Dalian', 3), ('Jinan', 4), ('Qingdao', 4);
