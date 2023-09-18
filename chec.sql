create table student(
std_id INT PRIMARY KEY,
name VARCHAR(50) NOT NULL,
age INT,
constraint agebar check(age>18)
);
create index f_name on student(name);
desc student;

drop table student;
insert into student
values (1,'arn', 15);

alter table student
add check (age>=18);

alter table student
drop check agebar;

constraint agebar check (age>18);

alter table student
drop check(age>=18);