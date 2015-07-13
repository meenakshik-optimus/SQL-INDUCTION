

												 SECTION-A
                              
	--CREATION OF TABLES:-

	CREATE TABLE Train_Details(Train_ID int PRIMARY KEY,Train_Name VARCHAR(50));


	INSERT INTO Train_Details VALUES (11404,'Shatabdi');
	INSERT INTO Train_Details VALUES(22505,'Rajdhani');
	INSERT INTO Train_Details VALUES(33606,'Passenger');

	SELECT * FROM Train_Details;


	/*
	Train_ID	Train_Name
		11404	Shatabdi
		22505	Rajdhani
		33606	Passenger
*/

	CREATE TABLE Station_Details(Station_ID int PRIMARY KEY,Station_Name VARCHAR(50));


	INSERT INTO Station_Details VALUES(101,'Delhi');
	INSERT INTO Station_Details VALUES(102,'Aligarh');
	INSERT INTO Station_Details VALUES(103,'Lucknow');
	INSERT INTO Station_Details VALUES(104,'Kanpur');

	SELECT * FROM Station_Details;

	/*
	Station_ID	Station_Name
	101			Delhi
	102			Aligarh
	103			Lucknow
	104			Kanpur
*/

	CREATE TABLE Journey_Details(Train_ID int FOREIGN KEY REFERENCES Train_Details(Train_ID),
	Station_ID int FOREIGN KEY REFERENCES Station_Details(Station_ID),
	Distance int, Arrival_GMT DATETIME, Departure_GMT DATETIME);


	INSERT INTO Journey_Details
	(Train_ID,Station_ID,Distance,Departure_GMT)VALUES(11404,101,0,'2012-1-25 03:00:00');

	INSERT INTO Journey_Details
	(Train_ID,Station_ID,Distance,Arrival_GMT)VALUES(11404,103,750,'2012-1-25 09:30:00');

	INSERT INTO Journey_Details
	(Train_ID,Station_ID,Distance,Departure_GMT)VALUES(22505,101,0,'2012-1-25 15:04:00');

	INSERT INTO Journey_Details
	(Train_ID,Station_ID,Distance,Arrival_GMT,Departure_GMT)VALUES(22505,102,225,'2012-1-25 05:30:00','2012-1-25 06:00:00');

	INSERT INTO Journey_Details
	(Train_ID,Station_ID,Distance,Arrival_GMT,Departure_GMT)VALUES(22505,104,150,'2012-1-25 07:10:00','2012-1-25 07:50:00');


	INSERT INTO Journey_Details(Train_ID,Station_ID,Distance,Arrival_GMT)
	VALUES(22505,103,100,'2012-1-25 08:30:00');

	INSERT INTO Journey_Details
	(Train_ID,Station_ID,Distance,Departure_GMT)VALUES(33606,102,0,'2012-1-25 10:45:00');

	INSERT INTO Journey_Details
	(Train_ID,Station_ID,Distance,Arrival_GMT,Departure_GMT)VALUES(33606,104,150,'2012-1-25 13:20:00','2012-1-25 13:45:00');

	INSERT INTO Journey_Details
	(Train_ID,Station_ID,Distance,Arrival_GMT)VALUES(33606,103,100,'2012-1-25 17:20:00');

	 SELECT * FROM Journey_Details;

	 /*
	 Train_ID	Station_ID	Distance	Arrival_GMT 					Departure_GMT
		11404		101			0			NULL						2012-01-25 03:00:00.000
		11404		103			750			2012-01-25 09:30:00.000		NULL
		22505		101			0			NULL						2012-01-25 15:04:00.000
		22505		102			225			2012-01-25 05:30:00.000		2012-01-25 06:00:00.000
		22505		104			150			2012-01-25 07:10:00.000		2012-01-25 07:50:00.000
		22505		103			100			2012-01-25 08:30:00.000		NULL
		33606		102			0			NULL						2012-01-25 10:45:00.000
		33606		104			150			2012-01-25 13:20:00.000		2012-01-25 13:45:00.000
		33606		103			100			2012-01-25 17:20:00.000		NULL
*/



/*
    ------Query 1:-Write an SQL which gives the route map for each train and also the total
	 distance (in KM) covered by each train and their average speed (In Km/hr) during the journey, as shown below.


	*/

	 SELECT DISTINCT T.Train_Name,q.Station_Name,q.speed,q.totaldistance FROM Train_Details T INNER JOIN
	 (SELECT S.Station_ID,S.Station_Name,l.Train_ID,l.totaldistance,l.DiffDate,(SELECT CAST((l.totaldistance*3600.0)/l.DiffDate AS float))as speed
	 FROM Station_Details S INNER JOIN (SELECT J.Train_ID,J.Station_ID,t.totaldistance,t.DiffDate FROM Journey_Details 
	 J INNER JOIN (SELECT Train_ID,SUM(Distance) 
	 AS totaldistance,DATEDIFF(SS,MIN(Departure_GMT),MAX(Arrival_GMT)) AS DiffDate FROM Journey_Details GROUP BY Train_ID )t
	 ON t.Train_ID=J.Train_ID) l ON l.Station_ID=S.Station_ID) q ON T.Train_ID=q.Train_ID GROUP BY q.Train_ID,T.Train_Name,
	 q.totaldistance,q.speed,q.Station_Name;


	 /* OUTPUT 1

	 Train_Name	Station_Name	speed				totaldistance
	Passenger	Aligarh			37.974683544303		250
	Passenger	Kanpur			37.974683544303		250
	Passenger	Lucknow			37.974683544303		250
	Rajdhani	Aligarh			190					475
	Rajdhani	Delhi			190					475
	Rajdhani	Kanpur			190					475
	Rajdhani	Lucknow			190					475
	Shatabdi	Delhi			115.384615384615	750
	Shatabdi	Lucknow			115.384615384615	750
*/

	 --Query 2A:-Name of the train which covered the maximum distance during its journey.


	SELECT TOP 1 D.Train_Name FROM Train_Details D INNER JOIN Journey_Details J
	ON D.Train_ID=J.Train_ID 
	INNER JOIN
	(SELECT Train_ID,SUM(Distance) s FROM Journey_Details GROUP BY Train_ID ) T
	ON T.Train_ID=D.Train_ID
	GROUP BY D.Train_Name ORDER BY D.Train_Name DESC;

	/* OUTPUT
	Train_Name
	Shatabdi
	*/

	--Query 2B:-Name of the train which has the max Average speed.


	SELECT TOP 1 T.Train_Name FROM Train_Details T INNER JOIN
	(SELECT Train_ID,SUM(Distance) 
	AS totaldistance,DATEDIFF(SS,MIN(Departure_GMT),MAX(Arrival_GMT))
	AS DiffDate FROM Journey_Details GROUP BY Train_ID)AS f ON T.Train_ID=f.Train_ID ORDER BY f.totaldistance/f.DiffDate;

	/*
	Train_Name
	Rajdhani
*/

	--Query 2C:-Name those trains which stop at least at three stations.



	SELECT D.Train_Name FROM Train_Details D INNER JOIN Journey_Details J
    ON D.Train_ID=J.Train_ID 
    INNER JOIN
    (SELECT Train_ID,COUNT(Station_ID) s FROM Journey_Details GROUP BY Train_ID ) T
    ON T.Train_ID=D.Train_ID
    WHERE T.s>3
    GROUP BY D.Train_Name;


	/*
	Train_Name
	Rajdhani
*/


	--Query 2D:-Name those trains whose stoppage is not Aligarh and Kanpur.



	SELECT DISTINCT Train_Name
	FROM Train_Details
	WHERE Train_ID NOT IN (SELECT Train_ID
	FROM Journey_Details
	WHERE Station_ID IN (102)
	GROUP BY Train_ID) AND  Train_ID NOT IN (SELECT Train_ID
	FROM Journey_Details
	WHERE Station_ID IN (104)
	GROUP BY Train_ID);

	/*
	Train_Name
	Shatabdi
*/

/*
    --Query 4:-


	Write an SQL query which results out the boarding and destination station name for each train as shown below.
Train ID	Train Name	 Boarding	Destination
111			A				Delhi	Aligarh
222			B				Aligarh	Delhi


*/




 





	SELECT DISTINCT z.Train_ID,Train_Name,z.j AS Boarding,m.n AS Destination
	FROM Train_Details
	INNER JOIN
	Journey_Details
	ON Train_Details.Train_ID=Journey_Details.Train_ID
	INNER JOIN(SELECT  DISTINCT Train_ID,Station_Name AS j
	FROM Journey_Details INNER JOIN Station_Details
	ON Journey_Details.Station_ID=Station_Details.Station_ID
	WHERE DISTANCE=0 AND Arrival_GMT IS NULL) AS z
	ON Journey_Details.Train_ID=z.Train_ID
	INNER JOIN(SELECT  DISTINCT Train_ID,Station_Name AS n
	FROM Journey_Details INNER JOIN Station_Details
	ON Journey_Details.Station_ID=Station_Details.Station_ID
	WHERE DISTANCE>0 AND Departure_GMT IS NULL) AS m
	ON Journey_Details.Train_ID=m.Train_ID;


	/*

	OUTPUT

	Train_ID	Train_Name	Boarding	Destination
	11404		Shatabdi	Delhi		Lucknow
	22505		Rajdhani	Delhi		Lucknow
	33606		Passenger	Aligarh		Lucknow
*/

	--Query 5:-











													SECTION-B




	--Question 1 Creation and insertion of values in table:-


	CREATE TABLE Departments 
	(Dept_Id INT Primary key,
	Dept_Name VARCHAR(50)
	);
	
	CREATE TABLE Projects
	(P_Id INT PRIMARY KEY,
	P_Name VARCHAR(50),
	Dept_Id INT FOREIGN KEY REFERENCES Departments(Dept_Id)
	);
	
	CREATE TABLE Engineers
	(E_Id INT PRIMARY KEY,
	Dept_Id INT FOREIGN KEY REFERENCES Departments(Dept_Id),
	Emp_Name VARCHAR(50)
	);
	
	CREATE TABLE Attendance
	(
	Att_Id INT PRIMARY KEY,
	E_Id INT FOREIGN KEY REFERENCES Engineers(E_Id),
	P_Id INT FOREIGN KEY REFERENCES Projects(P_Id),
	Atten_Date DATE,
	Hrs INT
	);


	
	
	
	

	INSERT INTO Departments
	(Dept_Id ,
	Dept_Name)
	VALUES
	(1,'HR'),
	(2,'Development'),
	(3,'Testing');

	SELECT * FROM Departments ;
	/*
	Dept_Id		Dept_Name
	1			HR
	2			Development
	3			Testing
*/

	INSERT INTO Projects
	(P_Id,P_Name,Dept_Id)
	VALUES
	(1,'Monkey_media','2'),
	(2,'Amazon','2'),
	(3,'(x)matters','2'),
	(4,'samsung','3'),
	(5,'Olacabs','3'),
	(6,'snapdeal','2'),
	(7,'nokia','3');

	SELECT * FROM Projects;
	/*
	P_Id		P_Name			Dept_Id
	1			Monkey_media	2
	2			Amazon			2
	3			(x)matters		2
	4			samsung			3
	5			Olacabs			3
	6			snapdeal		2
	7			nokia			3
*/

	INSERT INTO Engineers
	(E_Id ,
	Dept_Id ,
	Emp_Name)
	VALUES
	(1,2,'Shaumya'),
	(2,3,'Meena'),
	(3,3,'Adam'),
	(4,2,'Jack'),
	(5,2,'Manish'),
	(6,3,'Nitish'),
	(7,3,'sarika');

	SELECT * FROM Engineers;
	/*
	E_Id	Dept_Id		Emp_Name
	1		2			Shaumya
	2		3			Meena
	3		3			Adam
	4		2			Jack
	5		2			Manish
	6		3			Nitish
	7		3			sarika
*/


	INSERT INTO Attendance
	(Att_Id,
	E_Id,
	P_Id,
	Atten_Date,
	Hrs 
	)
	VALUES
	(1,1,1,'2010-2-5',7),
	(2,2,2,'2010-2-5',6),
	(3,2,2,'2010-2-5',11),
	(4,3,3,'2010-2-5',9),
	(5,3,3,'2010-2-5',4);

	SELECT * FROM Attendance;
	/*
	Att_Id	E_Id	P_Id	Atten_Date	Hrs
	1		1		1		2010-02-05	7
	2		2		2		2010-02-05	6
	3		2		2		2010-02-05	11
	4		3		3		2010-02-05	9
	5		3		3		2010-02-05	4
*/

/*	--Query 2(a):-

	Query which displays the total number of hours spend as Each engineer in their respective project.

*/

	SELECT engr.Emp_Name,sum(att.Hrs) as TOTAL_HOURS
	from
	Engineers engr LEFT JOIN Attendance att
	ON engr.E_Id=att.E_Id
	GROUP BY engr.Emp_Name;

/*
	OUTPUT
	Emp_Name	TOTAL_HOURS
	Adam		13
	Jack		NULL
	Manish		NULL
	Meena		17
	Nitish		NULL
	sarika		NULL
	Shaumya		7
*/
	
	/*
	--Query 2(b):-
	Query which displays the total number of hours spend as 
	Each project in their respective department.
	*/

	SELECT pr.P_Name,sum(att.Hrs) as TOTAL_HRS_PROJECT
	from
	Projects pr LEFT JOIN Attendance att
	ON pr.P_Id=att.P_Id
	GROUP BY pr.P_Name;

	/* OUTPUT
	P_Name			TOTAL_HRS_PROJECT
	(x)matters		13
	Amazon			17
	Monkey_media	7
	nokia			NULL
	Olacabs			NULL
	samsung			NULL
	snapdeal		NULL
*/