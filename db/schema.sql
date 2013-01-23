use database test_lutao;

create table runner(
	runner_id int not null auto_increment,
	first_name varchar(100) not null,
	last_name varchar(100) not null,
	gender varchar(1) not null,
	finish_time varchar(10),
	PRIMARY KEY(runner_id)
);