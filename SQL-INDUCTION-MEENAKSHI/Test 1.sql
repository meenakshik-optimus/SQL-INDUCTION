	--CREATION OF TABLE DEPARTMENT:-

	CREATE TABLE Department(DeptID int PRIMARY KEY,DeptName VARCHAR(50),DeptHeadID int);

	--INSERTION INTO TABLE:-


	INSERT INTO Department VALUES(1,'HR',1);
	INSERT INTO Department VALUES(2,'Admin',2);
	INSERT INTO Department VALUES(3,'Sales',9);
	INSERT INTO Department VALUES(4,'Engineering',5);

	SELECT * FROM Department;

/*
DeptID	DeptName	DeptHeadID
1		HR				1
2		Admin			2
3		Sales			9
4		Engineering		5

*/
	

	--CREATION OF TABLE EMPLOYEE:-


	CREATE TABLE Employee(Id int PRIMARY KEY,Name VARCHAR(50),Gender VARCHAR(50),Basic int,HR int,DA int,TAX int,DeptID int FOREIGN KEY REFERENCES 
	Department(DeptID));


    --INSERTION INTO TABLE:-

	INSERT INTO Employee VALUES(1,'Anil','Male',10000,5000,1000,400,1);
	INSERT INTO Employee VALUES(2,'Sanjana','Female',12000,6000,1000,500,2);
	INSERT INTO Employee VALUES(3,'Johnny','Male',5000,2500,500,200,3);
	INSERT INTO Employee VALUES(4,'Suresh','Male',6000,3000,500,250,1);
	INSERT INTO Employee VALUES(5,'Anglia','Female',11000,5500,1000,500,4);
	INSERT INTO Employee VALUES(6,'Saurabh','Male',12000,6000,1000,600,1);
	INSERT INTO Employee VALUES(7,'Manish','Male',4000,2000,500,150,2);
	INSERT INTO Employee VALUES(8,'Neeraj','Male',5000,2500,500,200,3);
	INSERT INTO Employee VALUES(9,'Suman','Female',5000,2500,500,200,4);
	INSERT INTO Employee VALUES(10,'Tina','Female',6000,3000,500,220,1);
	
	SELECT * FROM Employee;

	/*

	Id	Name	Gender	Basic	HR	DA		TAX	DeptID
1	Anil	Male	10000	5000	1000	400	 1
2	Sanjana	Female	12000	6000	1000	500	 2
3	Johnny	Male	5000	2500	500		200	 3
4	Suresh	Male	6000	3000	500		250	 1
5	Anglia	Female	11000	5500	1000	500	 4
6	Saurabh	Male	12000	6000	1000	600	 1
7	Manish	Male	4000	2000	500		150	 2
8	Neeraj	Male	5000	2500	500		200	 3
9	Suman	Female	5000	2500	500		200	 4
10	Tina	Female	6000	3000	500		220	 1


*/
	--CREATION OF TABLE EMPLOYEEATTENDANCE:-


	CREATE TABLE EmployeeAttendance(EmpID int FOREIGN KEY REFERENCES Employee(Id),_Date DATE,WorkingDays int,PresentDays int);


	--INSERTION INTO TABLE:-

	INSERT INTO EmployeeAttendance VALUES(1,'2010-01-01',22,21);
	INSERT INTO EmployeeAttendance VALUES(1,'2010-02-01',20,20);
	INSERT INTO EmployeeAttendance VALUES(1,'2010-03-01',22,20);
	INSERT INTO EmployeeAttendance VALUES(2,'2010-01-01',22,22);
	INSERT INTO EmployeeAttendance VALUES(2,'2010-02-01',20,20);
	INSERT INTO EmployeeAttendance VALUES(2,'2010-03-01',22,22);
	INSERT INTO EmployeeAttendance VALUES(3,'2010-01-01',22,21);
	INSERT INTO EmployeeAttendance VALUES(3,'2010-02-01',20,20);
	INSERT INTO EmployeeAttendance VALUES(3,'2010-03-01',22,21);
	INSERT INTO EmployeeAttendance VALUES(4,'2010-01-01',22,21);
	INSERT INTO EmployeeAttendance VALUES(4,'2010-02-01',20,19);
	INSERT INTO EmployeeAttendance VALUES(4,'2010-03-01',22,22);
	INSERT INTO EmployeeAttendance VALUES(5,'2010-01-01',22,22);
	INSERT INTO EmployeeAttendance VALUES(5,'2010-02-01',20,20);
	INSERT INTO EmployeeAttendance VALUES(5,'2010-03-01',22,22);
	INSERT INTO EmployeeAttendance VALUES(6,'2010-01-01',22,21);
	INSERT INTO EmployeeAttendance VALUES(6,'2010-02-01',20,20);
	INSERT INTO EmployeeAttendance VALUES(6,'2010-03-01',22,20);
	INSERT INTO EmployeeAttendance VALUES(7,'2010-01-01',22,21);
	INSERT INTO EmployeeAttendance VALUES(7,'2010-02-01',20,20);
	INSERT INTO EmployeeAttendance VALUES(7,'2010-03-01',22,21);
	INSERT INTO EmployeeAttendance VALUES(8,'2010-01-01',22,21);
	INSERT INTO EmployeeAttendance VALUES(8,'2010-02-01',20,20);
	INSERT INTO EmployeeAttendance VALUES(8,'2010-03-01',22,21);
	INSERT INTO EmployeeAttendance VALUES(9,'2010-01-01',22,22);
	INSERT INTO EmployeeAttendance VALUES(9,'2010-02-01',20,20);
	INSERT INTO EmployeeAttendance VALUES(9,'2010-03-01',22,21);
	INSERT INTO EmployeeAttendance VALUES(10,'2010-01-01',22,22);
	INSERT INTO EmployeeAttendance VALUES(10,'2010-02-01',20,20);
	INSERT INTO EmployeeAttendance VALUES(10,'2010-03-01',22,22);


	SELECT * FROM EmployeeAttendance;
	/*
	EmpID	_Date	WorkingDays	PresentDays
	1	2010-01-01	22				21
	1	2010-02-01	20				20
	1	2010-03-01	22				20
	2	2010-01-01	22				22
	2	2010-02-01	20				20
	2	2010-03-01	22				22
	3	2010-01-01	22				21
	3	2010-02-01	20				20
	3	2010-03-01	22				21
	4	2010-01-01	22				21
	4	2010-02-01	20				19
	4	2010-03-01	22				22
	5	2010-01-01	22				22
	5	2010-02-01	20				20
	5	2010-03-01	22				22
	6	2010-01-01	22				21
	6	2010-02-01	20				20
	6	2010-03-01	22				20
	7	2010-01-01	22				21
	7	2010-02-01	20				20
	7	2010-03-01	22				21
	8	2010-01-01	22				21
	8	2010-02-01	20				20
	8	2010-03-01	22				21
	9	2010-01-01	22				22
	9	2010-02-01	20				20
	9	2010-03-01	22				21
	10	2010-01-01	22				22
	10	2010-02-01	20				20
	10	2010-03-01	22				22
	*/

	/*


	------Query 1:-

	Write a query using “Employee” and “Department” table that display gender wise number 
	of employees in each department.

	*/

	 SELECT Dept.DeptName,Emp.Gender,COUNT(*) AS No_Of_Employees
	 FROM Employee Emp INNER JOIN Department Dept 
	 ON Emp.DeptID=Dept.DeptID GROUP BY Dept.DeptName,Emp.Gender;


	 /*OUTPUT 1

	 DeptName	      Gender	No_Of_Employees
		Admin	      Female	         1
		Engineering	  Female	         2
		HR			  Female			 1
		Admin		  Male				 1
		HR			  Male	             3
		Sales		  Male				 2

*/





/*

	------Query 2:-

	Write a query using “Employee” and “Department” table that display the results as mentioned below
DeptName
No. of Employee		Highest Gross Salary		Total Salary 
--							--						--



*/

	SELECT Dept.DeptID,COUNT(*) AS No_Of_Employees, MAX(Emp.Basic+Emp.DA+Emp.HR) AS Highest_Gross_Salary, 
    SUM(Emp.Basic+Emp.DA+Emp.HR-Emp.TAX) AS Total_Salary
    FROM Employee Emp INNER JOIN Department Dept ON Emp.DeptID=Dept.DeptID GROUP BY Dept.DeptID;

	/* OUTPUT 2

	DeptID	No_Of_Employees	Highest_Gross_Salary	Total_Salary
		1		4				19000				52530
		2		2				19000				24850
		3		2				8000				15600
		4		2				17500				24800
	*/




/*
	------Query 3:-
	Write a query using “Employee” and “Department” table that display name of the employee with the highest gross salary in each department.
	DeptName	Name of Employee	Highest Gross Salary
		--			--					--
*/


	SELECT DeptName,Name AS Name_Of_Employee,maxtable.maximum AS Highest_Gross_Salary
	FROM Employee emp
	INNER JOIN
	Department dept
	ON emp.DeptId=Dept.DeptID
	INNER JOIN(SELECT DeptID,Max(Basic+HR+DA) AS maximum
	FROM Employee
	GROUP BY DeptID) AS maxtable
	ON emp.DeptID=maxtable.DeptID
	WHERE (emp.Basic+emp.HR+emp.DA)=maxtable.maximum;


	/* OUTPUT 3

	DeptName	Name_Of_Employee	Highest_Gross_Salary
		HR			Saurabh				19000
		Admin		Sanjana				19000
		Sales		Johnny				8000
		Sales		Neeraj				8000
		Engineering	Anglia				17500

		*/




/*
	------Query 4:-

	Write a query using “Employee” table that display the employee id and name whose gross salary is more than 15,000.


*/


	SELECT Id,Name FROM Employee WHERE (Basic+DA+HR)>15000;

	/*
	OUTPUT 4

	Id	Name
	1	Anil
	2	Sanjana
	5	Anglia
	6	Saurabh

	*/


	/*




	------Query 5:-

	Write a query using “Employee” table that display the employee id and name who got second highest “Basic” among all employees.

	*/

	 SELECT Id,Name FROM employee WHERE basic=(SELECT MAX(basic) from employee WHERE  basic<(SELECT MAX(basic) FROM Employee));


	 /* OUTPUT 5

	 Id		Name
	 5		Anglia

*/




/*

	------Query 6:-
	Write a query using “Employee” and “Department” table that list those departments who has number of employees more than 3.

	DeptName  No. of Employees
		--		--

*/


	SELECT X.DeptName,C.cou as No_Of_Employees FROM 
	(SELECT Dept.DeptName DeptName,Dept.DeptID DID FROM Employee Emp INNER JOIN Department Dept ON Emp.DeptID=Dept.DeptID) X
     INNER JOIN (
     SELECT DeptID,COUNT(DeptID) cou FROM Employee group by DeptID 
     ) C
    ON X.DID=C.DeptId
    where C.cou>3
    GROUP BY X.DeptName,X.DID,C.cou;

	/*
	OUTPUT 6
	DeptName	No_Of_Employees
		HR			4

*/




/*
	------Query 7:-

	Write a query using “Employee” and “Department” table that list all the departments and their head name.
	DeptName	Dept Head Name
	  --				--
*/


	SELECT D.DeptName,E.Name FROM Employee E LEFT JOIN Department D ON D.DeptID=E.DeptID
	WHERE D.DeptHeadID=E.Id;

	/*

	OUTPUT 7
	DeptName	Name
	HR			Anil
	Admin		Sanjana
	Engineering	Anglia

*/





/*
	------Query 8:-
	Write a query that displays the entire employees name having 100% attendance records.

	*/

	SELECT emp.Name AS Employee_having_full_attendance FROM Employee AS emp LEFT JOIN

	(SELECT EmpID,sum(workingDays)-sum(PresentDays) AS diff FROM EmployeeAttendance GROUP BY EmpID) AS att ON emp.Id=att.EmpID WHERE diff=0;

	/*
	OUTPUT 8

	Employee_having_full_attendance
			Sanjana
			Anglia
			Tina

*/





/*
	------Query 9:-

	Write a query that displays the entire employees name having lowest attendance.
*/


	SELECT  DISTINCT Name FROM Employee emp INNER JOIN
	EmployeeAttendance eat ON emp.Id=eat.EmpID
	INNER JOIN(SELECT EmpID,SUM(PresentDays) AS pr
	FROM EmployeeAttendance GROUP BY EmpID) AS prd
	ON emp.Id=prd.EmpID Where  prd.pr=(SELECT MIN(e.z)
	From Employee inner join(SELECT SUM(PresentDays) AS z,EmpID
	FROM EmployeeAttendance GROUP BY EmpID) AS e
	ON Employee.Id=e.EmpID);


	/*
	OUTPUT 9

	Name
	Anil
	Saurabh
*/




	/*
	------Query 10:-

	Write a query that displays the entire employee name that has more than 3 leaves.   
	*/

	SELECT emp.Name AS employee_3_leave,emp.id,att.diff FROM Employee AS emp LEFT JOIN

	(SELECT EmpID,sum(workingDays)-sum(PresentDays) AS diff FROM EmployeeAttendance GROUP BY EmpID) AS att ON emp.Id=att.EmpID WHERE diff>3;

/* OUTPUT 10

NO Output as leave is not greater than 3 for any employee

*/  
