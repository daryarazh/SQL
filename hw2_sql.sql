create table employees(
id serial primary key,
employee_name varchar(50) not null
);

insert into employees (employee_name)
values ('Louise Sharp'),

create table salary_1(
id serial primary key,
monthly_salary int not null
);

insert into salary_1 (monthly_salary)
values (1000),
(1100),
(1200),
(1300),
(1400),
(1500),
(1600),
(1700),
(1800),
(1900),
(2000),
(2100),
(2200),
(2300),
(2400),
(2500);

create table employee_salary(
id serial primary key,
employee_id int not null unique,
salary_id int not null
);

insert into employee_salary (employee_id, salary_id)
values (3, 1),
(52, 10),
(14, 6),
(8, 4),
(9, 3),
(11, 14),
(36, 1),
(48, 13),
(72, 2),
(1, 9),
(59, 4),
(66, 7),
(81, 10),
(23, 11),
(29, 2),
(17, 5),
(99, 3),
(78, 6),
(30, 13),
(18, 15),
(6, 3),
(41, 7),
(105, 12),
(56, 8),
(39, 12),
(73, 8),
(5, 6),
(19, 5),
(22, 4),
(40, 1),
(90, 8),
(37, 10),
(77, 9),
(7, 14),
(67, 9),
(42, 5),
(51, 11),
(63, 15),
(91, 2),
(4, 7);

create table roles_1(
id serial primary key,
role_name int not null unique
);

alter table roles_1 ALTER COLUMN role_name type varchar(30)

insert into roles_1 (role_name)
values
('Junior Python developer'),
('Middle Python developer'),
('Senior Python developer'),
('Junior Java developer'),
('Middle Java developer'),
('Senior Java developer'),
('Junior JavaScript developer'),
('Middle JavaScript developer'),
('Senior JavaScript developer'),
('Junior Manual QA engineer'),
('Middle Manual QA engineer'),
('Senior Manual QA engineer'),
('Project Manager'),
('Designer'),
('HR'),
('CEO'),
('Sales manager'),
('Junior Automation QA engineer'),
('Middle Automation QA engineer'),
('Senior Automation QA engineer');

CREATE TABLE roles_employee(
id serial primary key,
employee_id int not null unique,
foreign key (employee_id) references employees (id),
role_id int not null,
foreign key (role_id) references roles (id)
);

insert into roles_employee (employee_id, role_id)
values (3, 3),
(52, 12),
(14, 1),
(8, 1),
(9, 10),
(11, 2),
(36, 7),
(48, 3),
(35, 12),
(1, 9),
(59, 4),
(66, 5),
(2, 6),
(23, 7),
(29, 6),
(17, 2),
(25, 13),
(26, 8),
(30, 8),
(18, 11),
(6, 1),
(41, 4),
(38, 13),
(56, 9),
(39, 6),
(55, 10),
(5, 5),
(19, 11),
(22, 8),
(40, 10),
(57, 2),
(37, 4),
(49, 5),
(7, 11),
(67, 14),
(42, 14),
(51, 3),
(63, 9),
(43, 12),
(4, 7);


