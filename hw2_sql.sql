-- 1. Создать таблицу employees
-- - id. serial,  primary key,
-- - employee_name. Varchar(50), not null

create table employees(
id serial primary key,
employee_name varchar(50) not null
);

-- 2. Наполнить таблицу employee 70 строками

insert into employees (employee_name)
values ('Louise Sharp'),
('Harold McCoy'),
('Mae Rodriguez'),
('Fred Clark'),
('Debbie Rhodes'),
('Juan Gill'),
('Deborah Cox'),
('Jacqueline Johnson'),
('Ashley Sutton'),
('Jim Howard'),
('Charles Bryant'),
('Robert Morris'),
('Angela Hamilton'),
('Sherry Wise'),
('William Lewis'),
('Richard Jones'),
('Samantha Thomas'),
('Kathy Stewart'),
('Clayton Mills'),
('Richard Reed'),
('Douglas Powell'),
('Peggy Lewis'),
('Roger Glover'),
('Ella Page'),
('Terry Jenkins'),
('Salvador Mason'),
('Eleanor Webb'),
('Christopher Brown'),
('Eric Ford'),
('Sonia Hayes'),
('Jason Long'),
('Rebecca Schultz'),
('David Kelly'),
('Marilyn Young'),
('Tina Newman'),
('Wanda Hayes'),
('Monica Adams'),
('Daniel Robinson'),
('Christopher Wright'),
('Dennis Jones'),
('Chester Johnson'),
('Joshua Watson'),
('Louis Gutierrez'),
('Robert Evans'),
('Donna Warren'),
('Alice Scott'),
('Kristina Williams'),
('Rachel Hill'),
('Gregory Patterson'),
('James Watkins'),
('Gary Jones'),
('Sheila Copeland'),
('Danny McKinney'),
('Beth Gardner'),
('Alan Walters'),
('Tara Wilson'),
('Joyce Armstrong'),
('Louis Young'),
('David McGee'),
('Mary Simpson'),
('Cody Bishop'),
('Andrew Reed'),
('Amanda Kelly'),
('Laura Pena'),
('Nathan Lewis'),
('Arthur Taylor'),
('Theresa Mason'),
('Michael Taylor'),
('Brian Ellis'),
('Eileen Williams');

-- 3. Создать таблицу salary
-- - id. Serial  primary key,
-- - monthly_salary. Int, not null

create table salary(
id serial primary key,
monthly_salary int not null
);

-- 4. Наполнить таблицу salary 15 строками

insert into salary (monthly_salary)
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

-- 5. Создать таблицу employee_salary
-- - id. Serial  primary key,
-- - employee_id. Int, not null, unique
-- - salary_id. Int, not null

create table employee_salary(
id serial primary key,
employee_id int not null unique,
salary_id int not null
);

-- 6. Наполнить таблицу employee_salary 40 строками:
-- - в 10 строк из 40 вставить несуществующие employee_id

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

-- 7. Создать таблицу roles
-- - id. Serial  primary key,
-- - role_name. int, not null, unique

create table roles(
id serial primary key,
role_name int not null unique
);

-- 8. Поменять тип столба role_name с int на varchar(30)

alter table roles ALTER COLUMN role_name type varchar(30);

-- 9. Наполнить таблицу roles 20 строками

insert into roles (role_name)
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

-- 10. Создать таблицу roles_employee
-- - id. Serial  primary key,
-- - employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
-- - role_id. Int, not null (внешний ключ для таблицы roles, поле id)

CREATE TABLE roles_employee(
id serial primary key,
employee_id int not null unique,
foreign key (employee_id) references employees (id),
role_id int not null,
foreign key (role_id) references roles (id)
);

-- 11. Наполнить таблицу roles_employee 40 строками

insert into roles_employee (employee_id, role_id)
values (3, 14),
(52, 12),
(14, 1),
(8, 20),
(9, 10),
(11, 2),
(36, 7),
(48, 3),
(35, 12),
(1, 9),
(59, 4),
(66, 5),
(2, 6),
(23, 19),
(29, 6),
(17, 2),
(25, 13),
(26, 15),
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
(7, 16),
(67, 14),
(42, 17),
(51, 3),
(63, 9),
(43, 18),
(4, 7);



