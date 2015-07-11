	--CREATION OF TABLE DEPARTMENT:-

	CREATE TABLE Department(DeptID int PRIMARY KEY,DeptName VARCHAR(50),DeptHeadID int);

	--INSERTION INTO TABLE:-


	INSERT INTO Department VALUES(1,'HR',1);
	INSERT INTO Department VALUES(2,'Admin',2);
	INSERT INTO Department VALUES(3,'Sales',9);
	INSERT INTO Department VALUES(4,'Engineering',5);

	SELECT * FROM Department;

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


	--Query 1:-
	 SELECT Dept.DeptName,Emp.Gender,COUNT(*) AS No_Of_Employees
	 FROM Employee Emp INNER JOIN Department Dept 
	 ON Emp.DeptID=Dept.DeptID GROUP BY Dept.DeptName,Emp.Gender;


	--Query 2:-


	SELECT Dept.DeptID,COUNT(*) AS No_Of_Employees, MAX(Emp.Basic+Emp.DA+Emp.HR) AS Highest_Gross_Salary, 
    SUM(Emp.Basic+Emp.DA+Emp.HR-Emp.TAX) AS Total_Salary
    FROM Employee Emp INNER JOIN Department Dept ON Emp.DeptID=Dept.DeptID GROUP BY Dept.DeptID;


	

	--Query 3:-
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





	--Query 4:-
	SELECT Id,Name FROM Employee WHERE (Basic+DA+HR)>15000;


	--Query 5:-
	 SELECT Id,Name FROM employee WHERE basic=(SELECT MAX(basic) from employee WHERE  basic<(SELECT MAX(basic) FROM Employee));


	--Query 6:-
	SELECT X.DeptName,C.cou as No_Of_Employees FROM 
	(SELECT Dept.DeptName DeptName,Dept.DeptID DID FROM Employee Emp INNER JOIN Department Dept ON Emp.DeptID=Dept.DeptID) X
     INNER JOIN (
     SELECT DeptID,COUNT(DeptID) cou FROM Employee group by DeptID 
     ) C
    ON X.DID=C.DeptId
    where C.cou>3
    GROUP BY X.DeptName,X.DID,C.cou;



	--Query 7:-

	SELECT D.DeptName,E.Name FROM Employee E LEFT JOIN Department D ON D.DeptID=E.DeptID
	WHERE D.DeptHeadID=E.Id;

	--Query 8:-
	SELECT emp.Name AS Employee_having_full_attendance FROM Employee AS emp LEFT JOIN

	(SELECT EmpID,sum(workingDays)-sum(PresentDays) AS diff FROM EmployeeAttendance GROUP BY EmpID) AS att ON emp.Id=att.EmpID WHERE diff=0;



	--Query 9:-
	SELECT  DISTINCT Name FROM Employee emp INNER JOIN
	EmployeeAttendance eat ON emp.Id=eat.EmpID
	INNER JOIN(SELECT EmpID,SUM(PresentDays) AS pr
	FROM EmployeeAttendance GROUP BY EmpID) AS prd
	ON emp.Id=prd.EmpID Where  prd.pr=(SELECT MIN(e.z)
	From Employee inner join(SELECT SUM(PresentDays) AS z,EmpID
	FROM EmployeeAttendance GROUP BY EmpID) AS e
	ON Employee.Id=e.EmpID);


	--Query 10:-
	SELECT emp.Name AS employee_3_leave,emp.id,att.diff FROM Employee AS emp LEFT JOIN

	(SELECT EmpID,sum(workingDays)-sum(PresentDays) AS diff FROM EmployeeAttendance GROUP BY EmpID) AS att ON emp.Id=att.EmpID WHERE diff>3;

