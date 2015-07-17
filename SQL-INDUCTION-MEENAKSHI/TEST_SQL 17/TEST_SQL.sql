

CREATE TABLE User_Table(UserID INT PRIMARY KEY IDENTITY(101,1),
Name VARCHAR(50),Country VARCHAR(50),Gender VARCHAR(10));

INSERT INTO User_Table (Name,Country,Gender) VALUES('Harsh','India','M');
INSERT INTO User_Table (Name,Country,Gender) VALUES('Richa','Sri Lanka','F');
INSERT INTO User_Table (Name,Country,Gender) VALUES('Richard','US','M');
INSERT INTO User_Table (Name,Country,Gender) VALUES('Gopal','India','M');
INSERT INTO User_Table (Name,Country,Gender) VALUES('Jennifer','US','F');
INSERT INTO User_Table (Name,Country,Gender) VALUES('Karishma','India','F');
INSERT INTO User_Table (Name,Country,Gender) VALUES('Clinton','US','M');
INSERT INTO User_Table (Name,Country,Gender) VALUES('Sadhna','India','F');

SELECT * FROM User_Table;


CREATE TABLE Post_Table(PostID INT PRIMARY KEY IDENTITY(201,1),
UserID INT FOREIGN KEY REFERENCES User_Table(UserID),Post VARCHAR(255));

INSERT INTO Post_Table(UserID,Post) VALUES(104,'My name is Gopal');
INSERT INTO Post_Table(UserID,Post) VALUES(101,'Hello Friends');
INSERT INTO Post_Table(UserID,Post) VALUES(105,'Bon Voyage');
INSERT INTO Post_Table(UserID,Post) VALUES(104,'Cherishing Life');
INSERT INTO Post_Table(UserID,Post) VALUES(108,'Switching Lanes');
INSERT INTO Post_Table(UserID,Post) VALUES(105,'Feeling Nostalgic');
INSERT INTO Post_Table(UserID,Post) VALUES(102,'Sangakkara Rocks');
INSERT INTO Post_Table(UserID,Post) VALUES(104,'Bleeding Blue');


SELECT * FROM Post_Table;



CREATE TABLE Friend_Request_Table(RequestID INT PRIMARY KEY IDENTITY(301,1),
SenderID INT,ReceiverID INT,Status VARCHAR(50));

INSERT INTO Friend_Request_Table(SenderID,ReceiverID,Status) VALUES(101,102,'Approved');
INSERT INTO Friend_Request_Table(SenderID,ReceiverID,Status) VALUES(107,105,'Rejected');
INSERT INTO Friend_Request_Table(SenderID,ReceiverID,Status) VALUES(101,106,'Approved');
INSERT INTO Friend_Request_Table(SenderID,ReceiverID,Status) VALUES(108,101,'Approved');
INSERT INTO Friend_Request_Table(SenderID,ReceiverID,Status) VALUES(106,103,'Approved');
INSERT INTO Friend_Request_Table(SenderID,ReceiverID,Status) VALUES(104,108,'Pending');
INSERT INTO Friend_Request_Table(SenderID,ReceiverID,Status) VALUES(104,101,'Approved');
INSERT INTO Friend_Request_Table(SenderID,ReceiverID,Status) VALUES(105,102,'Pending');
INSERT INTO Friend_Request_Table(SenderID,ReceiverID,Status) VALUES(107,103,'Approved');
INSERT INTO Friend_Request_Table(SenderID,ReceiverID,Status) VALUES(106,102,'Rejected');

SELECT * FROM Friend_Request_Table;

CREATE TABLE Post_Likes_Table(LikeID INT PRIMARY KEY IDENTITY(401,1),
PostID INT FOREIGN KEY REFERENCES Post_Table(PostID),UserID INT FOREIGN KEY REFERENCES User_Table(UserID)); 

INSERT INTO Post_Likes_Table(PostId,UserID) VALUES(203,102);
INSERT INTO Post_Likes_Table(PostId,UserID) VALUES(208,108);
INSERT INTO Post_Likes_Table(PostId,UserID) VALUES(204,106);
INSERT INTO Post_Likes_Table(PostId,UserID) VALUES(203,108);
INSERT INTO Post_Likes_Table(PostId,UserID) VALUES(207,102);
INSERT INTO Post_Likes_Table(PostId,UserID) VALUES(202,102);
INSERT INTO Post_Likes_Table(PostId,UserID) VALUES(203,106);
INSERT INTO Post_Likes_Table(PostId,UserID) VALUES(205,102);
INSERT INTO Post_Likes_Table(PostId,UserID) VALUES(204,107);
INSERT INTO Post_Likes_Table(PostId,UserID) VALUES(203,101);


SELECT * FROM Post_Likes_Table;


--Query 1 Select the country that posts the maximum.

 SELECT TOP 1 l.Country AS Country_With_Maximum_Posts FROM
 (SELECT Country,sum(temp1.number_of_post) AS posts FROM
(SELECT UserID,COUNT(UserID) AS number_of_post FROM Post_table group by UserID)temp1
 LEFT JOIN User_Table ON temp1.UserID=User_Table.UserID GROUP BY country)l ORDER by posts desc;


 --Query 2 Select top poster of each country.

 SELECT k.Name,o.country_wise_maxPosts,o.Country FROM
 (SELECT Name,MAX(number_of_posts) AS poster,Country,temp1.UserID FROM
(SELECT UserID,COUNT(UserID) AS number_of_posts FROM Post_table GROUP BY UserID)temp1
 LEFT JOIN User_Table ON temp1.UserID=User_Table.UserID GROUP BY country,Name,temp1.UserID)k
 RIGHT JOIN
 (SELECT MAX(poster) as country_wise_maxPosts,Country FROM
 (SELECT Name,MAX(number_of_posts) AS poster,Country,temp1.UserID FROM
(SELECT UserID,COUNT(UserID) AS number_of_posts FROM Post_table GROUP BY UserID)temp1
 LEFT JOIN User_Table ON temp1.UserID=User_Table.UserID GROUP BY country,Name,temp1.UserID)l GROUP BY Country)o
 ON (k.Country=o.Country AND k.poster=o.country_wise_maxPosts);


 --Query 3 Post with 3rd highest like

 SELECT g.Highest_Third_Like_Post,Post_Table.Post FROM
 (SELECT PostID As Highest_Third_Like_Post FROM (SELECT COUNT(PostID) AS likes,PostID FROM Post_Likes_Table GROUP BY PostID)l WHERE l.Likes<
 (SELECT MAX(l.Likes) FROM (SELECT COUNT(PostID) AS likes,PostID FROM Post_Likes_Table GROUP BY PostID)l
  WHERE l.Likes<(SELECT MAX(l.Likes) FROM (SELECT COUNT(PostID) AS likes,PostID FROM Post_Likes_Table GROUP BY PostID)l)))g LEFT JOIN Post_Table
  ON g.Highest_Third_Like_Post=Post_Table.PostID


  --Query 4 Find user whose posts have maximum likes

 SELECT Name AS User_With_Maximum_Post_Likes FROM (SELECT w.Likes,w.PostID,Post_Table.UserID FROM (SELECT TOP 1 l.Likes,l.PostID  FROM (SELECT COUNT(PostID) AS likes,
 PostID FROM Post_Likes_Table GROUP BY PostID)l 
  ORDER BY l.Likes desc)w LEFT JOIN Post_Table ON w.PostId=Post_Table.PostID)z LEFT JOIN User_Table ON User_Table.UserID=z.UserID;


  --Query 5 find User with no friend request accepted

  SELECT SenderID FROM Friend_Request_Table WHERE Status like 'Pending';



  --Query 6 Highest Like Post of each user

 /**
 SELECT MAX(max_likes),temp2.UserID,temp2.PostID FROM

 (SELECT MAX(likes)as max_likes,UserId FROM (SELECT COUNT(PostID) AS likes,PostID FROM Post_Likes_Table
  GROUP BY PostID)o LEFT JOIN Post_Table ON o.PostID=Post_Table.PostId
 GROUP BY UserID
 )temp1 LEFT JOIN (SELECT o.likes,o.PostID,Post_Table.UserID,Post FROM (SELECT COUNT(PostID) AS likes,
 PostID FROM Post_Likes_Table GROUP BY PostID)o LEFT JOIN Post_Table ON o.PostID=Post_Table.PostID)temp2 
 ON temp1.UserID=temp2.UserID ;

 SELECT * FROM
 (
 
 
SELECT * FROM (SELECT MAX(likes)as max_likes,UserId,PostID FROM (SELECT COUNT(PostID) AS likes,PostID FROM Post_Likes_Table
  GROUP BY PostID)o LEFT JOIN Post_Table ON o.PostID=Post_Table.PostId
 )temp1
 LEFT JOIN
 (SELECT o.likes,o.PostID,Post_Table.UserID,Post FROM (SELECT COUNT(PostID) AS likes,
 PostID FROM Post_Likes_Table GROUP BY PostID)o LEFT JOIN Post_Table ON o.PostID=Post_Table.PostID)temp2 ON temp1.UserID=temp2.UserID
 */

 SELECT * FROM (SELECT MAX(q.m_likes) AS likes,UserID FROM (SELECT MAX(likes) AS m_likes,h.PostID FROM
  (SELECT COUNT(PostID) AS likes,PostID FROM Post_Likes_Table
  GROUP BY PostID)h INNER JOIN Post_Likes_Table p ON p.PostID=h.PostID GROUP BY h.PostID)q 


  LEFT JOIN Post_Table ON Post_Table.PostID=q.PostID GROUP BY UserID)r 
  LEFT JOIN 
  (SELECT p.PostID FROM (SELECT COUNT(PostID) AS likes,PostID FROM Post_Likes_Table
  GROUP BY PostID)h INNER JOIN Post_Likes_Table p ON p.PostID=h.PostID GROUP BY p.PostID)o LEFT
   JOIN Post_Table ON Post_Table.PostID=o.PostID)t ON r.m_Likes=t.Likes;


   

 --Query 7

 SELECT sum(number_of_posts) AS number_of_posts,country FROM (SELECT UserID,COUNT(UserID) AS number_of_posts FROM Post_table GROUP BY UserID)t
 LEFT JOIN User_Table ON User_Table.UserId=t.UserId GROUP BY country;


 --Query 8
 SELECT User_Table.Country,User_Table.Gender,sum(t.number_of_post) AS post FROM 
 (SELECT UserID,COUNT(UserID) AS number_of_post FROM Post_table group by UserID)t LEFT
  JOIN User_Table ON t.UserId=User_Table.UserId GROUP BY User_Table.Country,User_Table.Gender

  --Query 9

