--creation of table employee
CREATE TABLE employee(e_id int,firstname varchar(255),lastname varchar(255),designatiopn varchar(255),age int,salary int);

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

--question 11(SQL UPDATE)
UPDATE employee set designatiopn='manageer',salary=50000 where salary>40000 AND age>35;

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
SELECT designatiopn AS post,firstname,lastname AS surname from employee;

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

--question 26(SQL SELECT INTO)
SELECT * INTO employee_backup from employee;

--question 27(SQL CREATE DB)
CREATE database db1;

--question 28(SQL CREATE table)
CREATE table company(name varchar(255),location varchar(255));

--question 29,30,31,32,33,34,35(SQL not null,SQL unique,SQL primary key,SQL foreign key,SQL check,SQL default)
CREATE table employee(e_name varchar(255) unique ,e_id int primary key,address varchar(255) not null default 'noida',department_id int,foreign key(department_id) references department(department_id),check(e_id>0));

--question 36(SQL DROP)
CREATE table designation(d_id int,d_name varchar(255));
DROP table designation;

--question 37(SQL CREATE index)
CREATE unique index nameindex on employee(firstname,lastname);

--question 38(SQL ALTER)
ALTER table employee ALTER column designatiopn int;

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
ALTER TABLE employee_slabs add pf float;
UPDATE employee_slabs set pf=(SELECT ROUND(gross*12.5/100,2));

--question 46(SQL AVG())
SELECT * from employee WHERE salary>(SELECT AVG(salary) from employee);

--question 47(SQL COUNT())
SELECT department.department_id,department.department_name,COUNT(employee.department_id) as number_of_employees from employee LEFT JOIN department on employee.department_id=department.department_id GROUP BY department.department_id,department.department_name;

--question 48(SQL MAX())
SELECT * from employee WHERE salary<(SELECT MAX(salary) from employee);

--question 49(SQL MIN())
SELECT * from employee WHERE salary>(SELECT MIN(salary) from employee);

--question 50(SQL SUM())
SELECT SUM(salary) AS TotalSalary from employee;

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

--question 61(RANKING FUNCTION)
SELECT TOP 5 *,DENSE_RANK() over (ORDER BY salary desc) from employee;

--question 62(COMMON TABLE EXPRESSION)
WITH CTE(id,basic,salary)
AS
(
SELECT employee.e_id,employee_slabs.basic,employee.salary from employee inner join employee_slabs
ON employee_slabs.e_id=employee.e_id
)
SELECT * FROM CTE where salary>25000;

--question 63(WITH ROLLUP() & WITH CUBE())
SELECT department_id,salary from employee GROUP BY department_id,salary with ROLLUP;
SELECT department_id,salary from employee GROUP BY department_id,salary with CUBE;

--question 64(EXCEPT & INTERSECT)
INSERT into XYZ_emp values(1,'mohit','ABC');
INSERT into ABC_emp values(1,'sumit','XYZ');
SELECT * from ABC_emp INTERSECT select * from XYZ_emp;
SELECT * from ABC_emp EXCEPT select * from XYZ_emp;

--question 65(CORELATED QUERIES)
 SELECT TOP 3 * from employee ORDER BY e_id asc;

 --question 66(RUNNING AGGREGATES)
 SELECT SUM(salary) as TotalSalary from employee;
 
--question 67(CLUSTER INDEX)
 CREATE CLUSTERED INDEX clustEmployee ON employee(e_id);

 --question 68(NON CLUSTER INDEX)
 CREATE NONCLUSTERED INDEX clustdepartment ON employee(department_id);

 --question 69(TRIGGERS)
 CREATE TABLE employee_salary
(
emp_id int,
basic_sal int,
hra int,
da int,
gross_sal int
);
SELECT * from employee_salary;

CREATE TRIGGER 
triggergross
ON employee_salary
for insert 
as
BEGIN
 DECLARE @emp_id int
 DECLARE @basic_sal int
 DECLARE @hra int
 DECLARE @da int
 DECLARE @gross_sal int

 SELECT @emp_id=i.emp_id from inserted i
 SELECT @basic_sal=i.basic_sal from inserted i
 SELECT @hra=i.hra from inserted i
 SELECT @da=i.da from inserted i
 SELECT @gross_sal=i.gross_sal from inserted i
 SET @gross_sal=(@basic_sal+@hra+@da)*12

UPDATE employee_salary
set gross_sal=@gross_sal
END

INSERT into employee_salary(emp_id,basic_sal,hra,da)
values(12113,1234,1234,545); 


 --qustion 70(CURSORS)
 DECLARE @emp_id int
 DECLARE @basic_sal int
 DECLARE @hra int
 DECLARE @da int
 DECLARE @gross_sal int
 DECLARE @cursorlist cursor
 SET @cursorlist= cursor
 FOR
 SELECT emp_id, basic_sal,hra,da 
 from employee_salary
 OPEN @cursorlist
 FETCH NEXT FROM @cursorlist
 INTO @emp_id,@basic_sal,@hra,@da
 WHILE @@FETCH_STATUS=0
BEGIN

 SET @gross_sal=(@basic_sal+@hra+@da)*12
 UPDATE employee_salary
 SET gross_sal=@gross_sal
 WHERE emp_id=@emp_id
 FETCH NEXT FROM @cursorlist

END

 CLOSE @cursorlist
 DEALLOCATE @cursorlist

SELECT * from employee_salary


 --question 71(functions)
 CREATE FUNCTION leap(@year int)
 RETURNS varchar(255) 
AS 
BEGIN
  declare @type varchar(255);
  if(@year%4=0)
  set @type='leapyear';
  else
  set @type='nonleapyear';
  return @type;
  END;

 --question 72(stored procedures)
 CREATE PROCEDURE
 employeedetail @e_id int
 AS 
 BEGIN
	SELECT employee.firstname,employee_slabs.basic,department.department_name from employee
    LEFT JOIN employee_slabs
    ON employee.e_id=employee_slabs.e_id
    LEFT JOIN department
    ON employee.department_id=department.department_id
   WHERE employee.e_id=@e_id;
	END
EXEC employeedetail 4 



--question 73(EXCEPTION HANDLING)
CREATE PROCEDURE
 divide 
 AS 
 BEGIN
    BEGIN
    TRY
    SELECT division=salary/[half yearly grade] from employee
    END 
	TRY
    BEGIN 
    CATCH
    SELECT ERROR_NUMBER() as errornumber,ERROR_MESSAGE() as errormessage;
    END 
	CATCH
END
EXEC divide













