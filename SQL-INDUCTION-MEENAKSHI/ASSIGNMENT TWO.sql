	---Question 1:- Create three tables as follows:
	 (i) Product Table: t_product_master
	 (ii)User Table: t_user_master
	 (iii)Transaction Table: t_transaction





	CREATE TABLE t_product_master(Product_ID varchar(25) PRIMARY KEY,Product_Name varchar(25),Cost_Per_Item int);
	INSERT INTO t_product_master VALUES('P1','Pen',10);
	INSERT INTO t_product_master VALUES('P2','Scale',15);
	INSERT INTO t_product_master VALUES('P3','Note Book',25);


	CREATE TABLE t_user_master(User_ID varchar(25) PRIMARY KEY,User_Name varchar(60));
	INSERT INTO t_user_master VALUES('U1','Alfred Lawrence');
	INSERT INTO t_user_master VALUES('U2','William Paul');
	INSERT INTO t_user_master VALUES('U3','Edward Fillip');


	SELECT * FROM t_product_master;

	SELECT * FROM t_user_master;



	CREATE TABLE t_transaction(User_ID varchar(25) FOREIGN KEY REFERENCES t_user_master(User_ID),
	Product_ID varchar(25) FOREIGN KEY REFERENCES t_product_master(Product_ID),Transaction_Date DATE,
	Transaction_Type varchar(25),Transaction_Amount int);


	INSERT INTO t_transaction VALUES('U1','P1','2010-10-25','Order',150);
	INSERT INTO t_transaction VALUES('U1','P1','2010-11-20','Payment',750);
	INSERT INTO t_transaction VALUES('U1','P1','2010-11-20','Order',200);
	INSERT INTO t_transaction VALUES('U1','P3','2010-11-25','Order',50);
	INSERT INTO t_transaction VALUES('U3','P2','2010-11-26','Order',100);
	INSERT INTO t_transaction VALUES('U2','P1','2010-12-15','Order',75);
	INSERT INTO t_transaction VALUES('U3','P2','2011-01-15','Payment',250);

	SELECT * FROM t_transaction;

  --Question 2:- QUERY

	 SELECT t_user_master.User_Name,
	 t_product_master.Product_Name,
	 SUM(CASE WHEN Transaction_Type='Order'THEN t_transaction.Transaction_Amount ELSE 0 END) AS Ordered_Quantity,
	 SUM(CASE WHEN Transaction_Type='Payment'THEN  t_transaction.Transaction_Amount ELSE 0 END) AS Amount_Paid,
	 MAX(t_transaction.Transaction_Date) AS Last_Target_Date,
	 (SUM(CASE WHEN Transaction_Type='Order'THEN t_transaction.Transaction_Amount* t_product_master.Cost_Per_Item ELSE 0 END)-
	 SUM(CASE WHEN Transaction_Type='Payment'THEN t_transaction.Transaction_Amount ELSE 0 END)) AS Balance
	 FROM ((t_transaction LEFT JOIN t_user_master ON 
	 t_transaction.User_ID=t_user_master.User_ID) LEFT JOIN t_product_master ON 
	 t_transaction.Product_ID=t_product_master.Product_ID) group by t_user_master.User_Name,t_product_master.Product_Name;


   --Question 3:- Creation of required tables



    CREATE TABLE t_emp(EMP_id int IDENTITY(1001,2) NOT NULL PRIMARY KEY,Emp_Code varchar(25),Emp_f_name varchar(25) NOT NULL,Emp_m_name varchar(25),Emp_l_name varchar(25),Emp_DOB DATE,Emp_DOJ DATE NOT NULL);
    INSERT INTO t_emp(Emp_Code,Emp_f_name,Emp_l_name,Emp_DOB,Emp_DOJ) VALUES('OPT20110105','Manmohan','Singh','1983-02-10','2010-05-25');
    INSERT INTO t_emp(Emp_Code,Emp_f_name,Emp_m_name,Emp_l_name,Emp_DOB,Emp_DOJ) VALUES('OPT20100915','Alfred','Joseph','Lawrence','1988-02-28','2009-03-24');
    INSERT INTO t_emp(Emp_Code,Emp_f_name,Emp_m_name,Emp_l_name,Emp_DOB,Emp_DOJ) VALUES('OPT20100916','Adam','Hilary','wiliam','1988-02-29','2009-04-25');
    INSERT INTO t_emp(Emp_Code,Emp_f_name,Emp_l_name,Emp_DOB,Emp_DOJ) VALUES('OPT20110106','Meenakshi','kumari','1993-02-28','2010-05-25');
    SELECT * FROM t_emp;

	CREATE TABLE t_activity(Activity_id int PRIMARY KEY,Activity_Description varchar(255));
	INSERT INTO t_activity VALUES(1,'Code Analysis');
	INSERT INTO t_activity VALUES(2,'Lunch');
	INSERT INTO t_activity VALUES(3,'Coding');
	INSERT INTO t_activity VALUES(4,'Knowledge Transition');
	INSERT INTO t_activity VALUES(5,'Database');

   SELECT * FROM t_activity;

	CREATE table t_atten_det(Atten_id int IDENTITY(1001,1),
	Emp_id int FOREIGN KEY REFERENCES t_emp(Emp_id),
	Activity_id int FOREIGN KEY REFERENCES t_activity(Activity_id),
	Atten_Start_Datetime DATETIME,Atten_end_hrs int);

	INSERT INTO t_atten_det VALUES(1001,5,'2011-02-13 10:00:00',2);
	INSERT INTO t_atten_det VALUES(1001,1,'2011-01-14 10:00:00',3);
	INSERT INTO t_atten_det VALUES(1001,3,'2011-01-14 13:00:00',5);
	INSERT INTO t_atten_det VALUES(1003,5,'2011-02-16 10:00:00',8);
	INSERT INTO t_atten_det VALUES(1003,5,'2011-02-17 10:00:00',8);
	INSERT INTO t_atten_det VALUES(1003,5,'2011-02-19 10:00:00',7);
	SELECT * FROM t_atten_det;



	CREATE TABLE t_salary(Salary_id int PRIMARY KEY,Emp_Id int,Changed_date DATE,New_Salary float);
	INSERT INTO t_salary VALUES(1001,1003,'2011-01-14',20000.00);
	INSERT INTO t_salary VALUES(1002,1003,'2011-02-16',25000.00);
	INSERT INTO t_salary VALUES(1003,1001,'2011-02-16',26000.00);



  --Question 4.1:-

	SELECT Emp_f_name +' '+ CASE WHEN Emp_m_name IS NULL THEN '' ELSE Emp_m_name END+' '+ Emp_l_name AS Name,Emp_DOB 
	FROM t_emp where Emp_DOB=CONVERT(VARCHAR(25),DATEADD(dd,-(DAY(DATEADD(mm,1,t_emp.Emp_DOB))),
	DATEADD(mm,1,t_emp.Emp_DOB)),101);




   --Question 4.2:-

	  SELECT * FROM
	  (

		SELECT DISTINCT s.Emp_id,
			year(s.Atten_Start_Datetime) AS [year],
			datename(month,s.Atten_Start_Datetime) AS [month], datename(day,s.Atten_Start_Datetime) d,t_emp.Emp_f_name +' '+
			 CASE WHEN t_emp.Emp_m_name IS NULL THEN '' ELSE t_emp.Emp_m_name END+' '+ t_emp.Emp_l_name AS Name,
			s.atten_end_hrs AS hrs 
		FROM t_emp INNER JOIN t_atten_det s ON t_emp.emp_id= s.Emp_id
		)t
	PIVOT
	(
	SUM(t.hrs)
		FOR t.d IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14],[15],[16],
		[17],[18],[19],[20],[21],[22],[23],[24],[25],[26],[27],[28],[29],[30,[31])
	)AS pivot_table;




    --Question 4.3:-

		   SELECT  t_emp.Emp_f_name +' '+
			 CASE WHEN t_emp.Emp_m_name IS NULL THEN '' ELSE t_emp.Emp_m_name END+' '+ t_emp.Emp_l_name AS Name,
			t_atten_det.Emp_id,
			(CASE WHEN (max(t_salary.New_Salary)-min(t_salary.New_Salary))>0 
				THEN 'YES' ELSE 'NO' END) AS got_increment_in_salary,
			min(t_salary.New_Salary) AS previous_salary,
			max(t_salary.New_Salary) AS current_salary ,
			s.ss AS total_worked_hours,
			f.ff AS last_worked_activity,
			f.hh AS hours_worked_in_that
		
		FROM t_salary 
		LEFT JOIN t_emp ON t_salary.Emp_Id=t_emp.EMP_id 
		LEFT JOIN t_atten_det ON t_salary.Emp_Id=t_atten_det.Emp_id 
		LEFT JOIN t_activity ON t_activity.Activity_id=t_atten_det.Activity_id  
		LEFT JOIN (SELECT Emp_id, sum(atten_end_hrs) ss FROM t_atten_det GROUP BY Emp_id) s ON s.Emp_id=t_emp.EMP_id 
		LEFT JOIN (SELECT atten_end_hrs hh,ACTivity_id ff,z.Emp_id FROM  t_atten_det z LEFT OUTER JOIN
		(SELECT Emp_id, MAX(Atten_Start_Datetime) g FROM t_atten_det GROUP BY Emp_id)  w ON z.Emp_id=w.Emp_id WHERE z.Atten_Start_Datetime=w.g) f ON f.Emp_id=t_emp.EMP_id

		GROUP BY t_emp.Emp_f_name,t_emp.Emp_m_name,t_emp.Emp_l_name,t_atten_det.Emp_Id,s.ss,f.ff,f.hh;













SELECT *
FROM (
    SELECT 
        year(Atten_Start_Datetime) as [year],
		datename(month,Atten_Start_Datetime) as [month], datename(day,Atten_Start_Datetime) [day],
        atten_end_hrs as hrs 
    FROM t_atten_det) s

PIVOT
(
SUM(hrs)
    FOR [day] IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14],[15],[16],[17],[18],[19],[20])
)AS pivottable;

