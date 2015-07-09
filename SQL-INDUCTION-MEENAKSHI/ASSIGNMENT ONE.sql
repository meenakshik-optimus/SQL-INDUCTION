--creation of table employee
CREATE table employee(e_id int,firstname varchar(255),lastname varchar(255),designatiopn varchar(255),age int,salary int);

--insertion in the table employee
INSERT into employee values(1,'meenakshi','kumari','SET',22,25000);
INSERT into employee values(2,'meena','kumari','developer',21,30000);
INSERT into employee values(3,'anjali','kumari','developer',20,15000);
INSERT into employee values(4,'smriti','sharma','tester',19,40000);
INSERT into employee values(5,'sweta','singh','tester',37,60000);

--question 5(SQL SELECT)
SELECT firstname,lastname,designatiopn from employee;

--question 6(SQL DISTINCT)
SELECT DISTINCT designatiopn from employee;

--question 7(SQL WHERE)
SELECT * from employee WHERE salary<20000;

--question 8(SQL AND & OR)
(i) SELECT * from employee WHERE salary>50000 AND age<35;
(ii) SELECT * from employee WHERE salary>50000 AND (designatiopn='manager' OR designatiopn='Tech Leads');

--question 9(SQL ORDER BY)
SELECT TOP 5 * from employee ORDER BY salary desc;

--question 10(SQL INSERT)
INSERT into employee values(9,'aradhana','sharma','Tech Leads',42,90000);

--question 11(SQL update)
INSERT into employee values(9,'aradhana','sharma','Tech Leads',42,90000);

--question 12(SQL DELETE)
DELETE from employee WHERE [half yearly grade]=1 AND designatiopn='trainee';

--question 14(SQL TOP)
(i) --TOP 3
 SELECT TOP 3 * from employee ORDER BY salary desc;
(ii) --second highest
 SELECT MAX(salary) as secondHighest from employee WHERE salary<(SELECT MAX(salary) from employee); 
(iii) --third highest
 SELECT MAX(salary) as thirdHighest from employee WHERE salary<(SELECT MAX(salary) from employee WHERE salary<(SELECT MAX(salary) from employee));

--question 15(SQL LIKE)
SELECT salary from employee WHERE name LIKE 'akash';

--question 16(SQL WILDCARDS)
(i) SELECT * from employee WHERE lastname LIKE '%um%';
(ii) SELECT * from employee WHERE lastname LIKE '_umar_';

--question 17(SQL IN)
SELECT salary from employee WHERE firstname IN('smriti','aradhana','sweta');

--question 18(SQL BETWEEN)
SELECT salary from employee WHERE salary BETWEEN 30000 and 50000;

--question 19(SQL ALIAS)
SELECT designatiopn as post,firstname,lastname AS surname from employee;

--creation of table employee_slabs
CREATE table employee_slabs(basic int,allowance int,gross int,e_id int);

--insertion in the table employee_slabs
INSERT into employee_slabs values(20000,10000,30000,2);
INSERT into employee_slabs values(75000,15000,90000,10);
INSERT into employee_slabs values(10000,5000,15000,3);
INSERT into employee_slabs values(32000,8000,40000,4);
INSERT into employee_slabs values(40000,10000,50000,5);


--question 20(SQL INNER JOIN)
SELECT employee.e_id, employee.firstname,employee.lastname,employee.designatiopn,employee.age,employee.salary,employee.name FROM employee
INNER JOIN employee_slabs
ON employee.e_id=employee_slabs.e_id;

--question 21(SQL INNER JOIN)
SELECT employee.e_id, employee.firstname,employee.lastname,employee.designatiopn,employee.age,employee.salary,employee.name FROM employee
INNER JOIN employee_slabs
ON employee.e_id=employee_slabs.e_id;

--creation of table department
CREATE table department(department_id int,department_name varchar(255));

--insertion in the table department
INSERT into department values(1,'java');
INSERT into department values(2,'.net');
INSERT into department values(3,'HR');
INSERT into department values(4,'php');
INSERT into department values(5,'python');

--question 22(SQL LEFT JOIN)
SELECT * from employee LEFT JOIN department on employee.department_id=department.department_id;

--question 23(SQL RIGHT join)
SELECT * from employee right JOIN department on employee.department_id=department.department_id;

--question 24(SQL FULL join)
SELECT * from employee FULL JOIN department on employee.department_id=department.department_id;

--question 25(SQL UNION)
CREATE table ABC_emp(emp_id int,emp_name varchar(255),emp_company varchar(255));
CREATE table XYZ_emp(emp_id int,emp_name varchar(255),emp_company varchar(255));
CREATE table LMN_emp(emp_id int,emp_name varchar(255),emp_company varchar(255));
INSERT into ABC_emp values(1,'mohit','ABC');
INSERT into ABC_emp values(2,'sahil','ABC');
INSERT into XYZ_emp values(1,'sumit','XYZ');
INSERT into XYZ_emp values(2,'nitish','XYZ');
INSERT into LMN_emp values(1,'abhay','LMN');
INSERT into LMN_emp values(2,'parveen','LMN');

SELECT * from ABC_emp UNION SELECT * from XYZ_emp union SELECT * from LMN_emp;

--question 26(SQL SELECT into)
SELECT * into employee_backup from employee;

--question 27(SQL CREATE DB)
CREATE database db1;

--question 28(SQL CREATE table)
CREATE table company(name varchar(255),location varchar(255));

--question 29,30,31,32,33,34,35(SQL not null,SQL unique,SQL primary key,SQL foreign key,SQL check,SQL default)
CREATE table employee(e_name varchar(255) unique ,e_id int primary key,address varchar(255) not null default 'noida',department_id int,foreign key(department_id) references department(department_id),check(e_id>0));

--question 36(SQL drop)
CREATE table designation(d_id int,d_name varchar(255));
DROP table designation;

--question 37(SQL CREATE index)
 CREATE unique index nameindex on employee(firstname,lastname);

--question 38(SQL ALTER)
alter table employee ALTER column designatiopn int;

--question 39(SQL INCREMENT)
UPDATE employee set salary=salary+5000;

--question 40(SQL VIEWS)
CREATE VIEW sr_manager as SELECT * from employee WHERE designatiopn='manageer' and salary>60000;

--question 41(SQL DATES)
select *,GETDATE() as currentDate from employee;


--question 42(SQL NULLS)
SELECT COUNT(salary) from employee;

--question 43(ISNULL())
SELECT * from employee WHERE lastname ISNULL;

--question 44(SQL DATA TYPES)

--question 46(SQL AVG())
SELECT * from employee WHERE salary>(SELECT AVG(salary) from employee);

--question 47(SQL COUNT())
SELECT department.department_id,department.department_name,COUNT(employee.department_id) as number_of_employees from employee LEFT JOIN department on employee.department_id=department.department_id GROUP BY department.department_id,department.department_name;

--question 48(SQL MAX())
SELECT * from employee WHERE salary<(SELECT MAX(salary) from employee);

--question 49(SQL MIN())
SELECT * from employee WHERE salary>(SELECT MIN(salary) from employee);

--question 50(SQL SUM())
SELECT SUM(salary) as TotalSalary from employee;

--question 51(SQL GROUP BY)
SELECT department.department_id,department.department_name,COUNT(employee.department_id) as number_of_employees from employee LEFT JOIN department on employee.department_id=department.department_id GROUP BY department.department_id,department.department_name;

--question 52(SQL HAVING)
SELECT department.department_id,department.department_name,COUNT(employee.department_id) as number_of_employees from employee LEFT JOIN department on employee.department_id=department.department_id GROUP BY department.department_id,department.department_name having COUNT(employee.department_id)>3;

--question 53(SQL UPPER())
SELECT UPPER(lastname),firstname from employee;

--question 54(SQL LOWER())
SELECT LOWER(lastname),firstname from employee;

--question 55(SQL LEN())
SELECT firstname,LEN(firstname) as length from employee;

--question 56(SQL ROUND())
SELECT firstname, lastname,ROUND(salary,0) as roundedsalary from employee;

--question 57(SQL GETDATE())
SELECT *,GETDATE() as currentDate from employee;

--question 58(SQL CONVERT())
SELECT firstname,salary,CONVERT(VARCHAR(19),GETDATE(),3) as today from employee;

--question 59(CAST())
SELECT CAST(e_id AS varchar(10)) from employee;

--question 60(CASE EXPRESSION)
SELECT *,status=(CASE when salary>50000 AND age<35 THEN 'yes' ELSE 'no' END) from employee;








