-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.

select employees.id, employee_name, salary.monthly_salary from employees 
join employee_salary on employee_salary.employee_id = employees.id
join salary on salary.id = employee_salary.salary_id ;

-- 2. Вывести всех работников у которых ЗП меньше 2000.

select employees.id, employee_name, salary.monthly_salary from employees 
join employee_salary on employee_salary.employee_id = employees.id
join salary on salary.id = employee_salary.salary_id
where monthly_salary < 2000;

-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select employee_name, salary.monthly_salary from employees 
right join employee_salary on employee_salary.employee_id = employees.id
right join salary on salary.id = employee_salary.salary_id
where employee_name is null;

-- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select employee_name, salary.monthly_salary from employees 
right join employee_salary on employee_salary.employee_id = employees.id
right join salary on salary.id = employee_salary.salary_id
where employee_name is null and monthly_salary < 2000;

-- 5. Найти всех работников кому не начислена ЗП.

select employee_name, salary.monthly_salary from employees 
left join employee_salary on employee_salary.employee_id = employees.id
left join salary on salary.id = employee_salary.salary_id
where monthly_salary is null;

-- 6. Вывести всех работников с названиями их должности.

select employee_name, role_name from employees
join roles_employee on roles_employee.employee_id = employees.id 
join roles on roles.id  = roles_employee.role_id;

-- 7. Вывести имена и должность только Java разработчиков.

select employee_name, role_name from employees
join roles_employee on roles_employee.employee_id = employees.id 
join roles on roles.id  = roles_employee.role_id
where role_name like '%Java %';

-- 8. Вывести имена и должность только Python разработчиков.

select employee_name, role_name from employees
join roles_employee on roles_employee.employee_id = employees.id 
join roles on roles.id  = roles_employee.role_id
where role_name like '%Python%';

-- 9. Вывести имена и должность всех QA инженеров.

select employee_name, role_name from employees
join roles_employee on roles_employee.employee_id = employees.id 
join roles on roles.id  = roles_employee.role_id
where role_name like '%QA%';

-- 10. Вывести имена и должность ручных QA инженеров.

select employee_name, role_name from employees
join roles_employee on roles_employee.employee_id = employees.id 
join roles on roles.id  = roles_employee.role_id
where role_name like '%QA%' and role_name like '%Manual%';

-- 11. Вывести имена и должность автоматизаторов QA

select employee_name, role_name from employees
join roles_employee on roles_employee.employee_id = employees.id 
join roles on roles.id  = roles_employee.role_id
where role_name like '%QA%' and role_name like '%Auto%';

-- 12. Вывести имена и зарплаты Junior специалистов

select employee_name, salary.monthly_salary from employees 
join employee_salary on employee_salary.employee_id = employees.id
join salary on salary.id = employee_salary.salary_id
join roles_employee on roles_employee.employee_id = employees.id
join roles on roles.id = roles_employee.role_id
where role_name like '%Junior%';

-- 13. Вывести имена и зарплаты Middle специалистов

select employee_name, salary.monthly_salary from employees 
join employee_salary on employee_salary.employee_id = employees.id
join salary on salary.id = employee_salary.salary_id
join roles_employee on roles_employee.employee_id = employees.id
join roles on roles.id = roles_employee.role_id
where role_name like '%Middle%';

-- 14. Вывести имена и зарплаты Senior специалистов

select employee_name, salary.monthly_salary from employees 
join employee_salary on employee_salary.employee_id = employees.id
join salary on salary.id = employee_salary.salary_id
join roles_employee on roles_employee.employee_id = employees.id
join roles on roles.id = roles_employee.role_id
where role_name like '%Senior%';

-- 15. Вывести зарплаты Java разработчиков

select salary.monthly_salary from employees 
join employee_salary on employee_salary.employee_id = employees.id
join salary on salary.id = employee_salary.salary_id
join roles_employee on roles_employee.employee_id = employees.id
join roles on roles.id = roles_employee.role_id
where role_name like '%Java %';

-- 16. Вывести зарплаты Python разработчиков

select salary.monthly_salary from employees 
join employee_salary on employee_salary.employee_id = employees.id
join salary on salary.id = employee_salary.salary_id
join roles_employee on roles_employee.employee_id = employees.id
join roles on roles.id = roles_employee.role_id
where role_name like '%Python%';

-- 17. Вывести имена и зарплаты Junior Python разработчиков

select employee_name, salary.monthly_salary from employees 
join employee_salary on employee_salary.employee_id = employees.id
join salary on salary.id = employee_salary.salary_id
join roles_employee on roles_employee.employee_id = employees.id
join roles on roles.id = roles_employee.role_id
where role_name like '%Junior%' and role_name like '%Python%';

-- 18. Вывести имена и зарплаты Middle JS разработчиков

select employee_name, salary.monthly_salary from employees 
join employee_salary on employee_salary.employee_id = employees.id
join salary on salary.id = employee_salary.salary_id
join roles_employee on roles_employee.employee_id = employees.id
join roles on roles.id = roles_employee.role_id
where role_name like '%Middle%' and role_name like '%JavaScript%';

-- 19. Вывести имена и зарплаты Senior Java разработчиков

select employee_name, salary.monthly_salary from employees 
join employee_salary on employee_salary.employee_id = employees.id
join salary on salary.id = employee_salary.salary_id
join roles_employee on roles_employee.employee_id = employees.id
join roles on roles.id = roles_employee.role_id
where role_name like '%Senior%' and role_name like '%Java %';

-- 20. Вывести зарплаты Junior QA инженеров

select employee_name, salary.monthly_salary from employees 
join employee_salary on employee_salary.employee_id = employees.id
join salary on salary.id = employee_salary.salary_id
join roles_employee on roles_employee.employee_id = employees.id
join roles on roles.id = roles_employee.role_id
where role_name like '%Junior%' and role_name like '%QA%';

-- 21. Вывести среднюю зарплату всех Junior специалистов

select avg(salary.monthly_salary) from employees 
join employee_salary on employee_salary.employee_id = employees.id
join salary on salary.id = employee_salary.salary_id
join roles_employee on roles_employee.employee_id = employees.id
join roles on roles.id = roles_employee.role_id
where role_name like '%Junior%';

-- 22. Вывести сумму зарплат JS разработчиков

select sum(salary.monthly_salary) from employees 
join employee_salary on employee_salary.employee_id = employees.id
join salary on salary.id = employee_salary.salary_id
join roles_employee on roles_employee.employee_id = employees.id
join roles on roles.id = roles_employee.role_id
where role_name like '%JavaScript%';

-- 23. Вывести минимальную ЗП QA инженеров

select min(salary.monthly_salary) from employees 
join employee_salary on employee_salary.employee_id = employees.id
join salary on salary.id = employee_salary.salary_id
join roles_employee on roles_employee.employee_id = employees.id
join roles on roles.id = roles_employee.role_id
where role_name like '%QA%';

-- 24. Вывести максимальную ЗП QA инженеров

select max(salary.monthly_salary) from employees 
join employee_salary on employee_salary.employee_id = employees.id
join salary on salary.id = employee_salary.salary_id
join roles_employee on roles_employee.employee_id = employees.id
join roles on roles.id = roles_employee.role_id
where role_name like '%QA%';

-- 25. Вывести количество QA инженеров

select count(roles.role_name) from employees 
join employee_salary on employee_salary.employee_id = employees.id
join salary on salary.id = employee_salary.salary_id
join roles_employee on roles_employee.employee_id = employees.id
join roles on roles.id = roles_employee.role_id
where role_name like '%QA%';

-- 26. Вывести количество Middle специалистов.

select count(roles.role_name) from employees 
join employee_salary on employee_salary.employee_id = employees.id
join salary on salary.id = employee_salary.salary_id
join roles_employee on roles_employee.employee_id = employees.id
join roles on roles.id = roles_employee.role_id
where role_name like '%Middle%';

-- 27. Вывести количество разработчиков

select count(roles.role_name) from employees 
join employee_salary on employee_salary.employee_id = employees.id
join salary on salary.id = employee_salary.salary_id
join roles_employee on roles_employee.employee_id = employees.id
join roles on roles.id = roles_employee.role_id
where role_name like '%developer%';

-- 28. Вывести фонд (сумму) зарплаты разработчиков.

select sum(salary.monthly_salary) from employees 
join employee_salary on employee_salary.employee_id = employees.id
join salary on salary.id = employee_salary.salary_id
join roles_employee on roles_employee.employee_id = employees.id
join roles on roles.id = roles_employee.role_id
where role_name like '%developer%';

-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию

select employee_name, roles.role_name, salary.monthly_salary from employees
join employee_salary on employee_salary.employee_id = employees.id
join salary on salary.id = employee_salary.salary_id
join roles_employee on roles_employee.employee_id = employees.id
join roles on roles.id = roles_employee.role_id
order by salary.monthly_salary;

-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300

select employee_name, roles.role_name, salary.monthly_salary from employees
join employee_salary on employee_salary.employee_id = employees.id
join salary on salary.id = employee_salary.salary_id
join roles_employee on roles_employee.employee_id = employees.id
join roles on roles.id = roles_employee.role_id
where salary.monthly_salary between 1700 and 2300;

-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300

select employee_name, roles.role_name, salary.monthly_salary from employees
join employee_salary on employee_salary.employee_id = employees.id
join salary on salary.id = employee_salary.salary_id
join roles_employee on roles_employee.employee_id = employees.id
join roles on roles.id = roles_employee.role_id
where salary.monthly_salary < 2300;

-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000

select employee_name, roles.role_name, salary.monthly_salary from employees
join employee_salary on employee_salary.employee_id = employees.id
join salary on salary.id = employee_salary.salary_id
join roles_employee on roles_employee.employee_id = employees.id
join roles on roles.id = roles_employee.role_id
where salary.monthly_salary in (1100, 1500, 2000);

