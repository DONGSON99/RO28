
DROP DATABASE IF EXISTS TestingSystem1;

CREATE DATABASE TestingSystem1;

USE TestingSystem1;

DROP TABLE IF EXISTS Department;
CREATE TABLE Department(
	DepartmentID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	DepartmentName NVARCHAR(30) NOT NULL UNIQUE KEY
);
DROP TABLE IF EXISTS Position;
CREATE TABLE `Position` (
	PositionID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	PositionName ENUM('Dev','Test','Scrum Master','PM') NOT NULL UNIQUE KEY
);
DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account`(
	AccountID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	Email VARCHAR(50) NOT NULL UNIQUE KEY,
	Username VARCHAR(50) NOT NULL UNIQUE KEY,
	FullName NVARCHAR(50) NOT NULL,
	DepartmentID TINYINT UNSIGNED NOT NULL,
	PositionID TINYINT UNSIGNED NOT NULL,
	CreateDate DATETIME DEFAULT NOW(),
	FOREIGN KEY(DepartmentID) REFERENCES Department(DepartmentID),
	FOREIGN KEY(PositionID) REFERENCES `Position`(PositionID)
);
DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group`(
	GroupID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	GroupName NVARCHAR(50) NOT NULL UNIQUE KEY,
	CreatorID TINYINT UNSIGNED,
	CreateDate DATETIME DEFAULT NOW(),
	FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountId)
);
DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE GroupAccount(
	GroupID TINYINT UNSIGNED NOT NULL,
	AccountID TINYINT UNSIGNED NOT NULL,
	JoinDate DATETIME DEFAULT NOW(), PRIMARY KEY (GroupID,AccountID),
	FOREIGN KEY(GroupID) REFERENCES `Group`(GroupID),
	FOREIGN KEY(AccountID) REFERENCES `Account`(AccountID)
);
DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion (
	TypeID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	TypeName ENUM('Essay','Multiple-Choice') NOT NULL UNIQUE KEY
);
DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion(
	CategoryID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	CategoryName NVARCHAR(50) NOT NULL UNIQUE KEY
);
DROP TABLE IF EXISTS Question;
CREATE TABLE Question(
	QuestionID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	Content NVARCHAR(100) NOT NULL,
	CategoryID TINYINT UNSIGNED NOT NULL,
	TypeID TINYINT UNSIGNED NOT NULL,
	CreatorID TINYINT UNSIGNED NOT NULL,
	CreateDate DATETIME DEFAULT NOW(),
	FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
	FOREIGN KEY(TypeID) REFERENCES TypeQuestion(TypeID),
	FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountId)
);
DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer(
	AnswerID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	Content NVARCHAR(100) NOT NULL,
	QuestionID TINYINT UNSIGNED NOT NULL,
	isCorrect BIT DEFAULT 1,
	FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID)
);
DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam(
	ExamID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	`Code` CHAR(10) NOT NULL,
	Title NVARCHAR(50) NOT NULL,
	CategoryID TINYINT UNSIGNED NOT NULL,
	Duration TINYINT UNSIGNED NOT NULL,
	CreatorID TINYINT UNSIGNED NOT NULL,
	CreateDate DATETIME DEFAULT NOW(),
	FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
	FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountId)
);
DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion(
	ExamID TINYINT UNSIGNED NOT NULL,
	QuestionID TINYINT UNSIGNED NOT NULL,
	FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID),
	FOREIGN KEY(ExamID) REFERENCES Exam(ExamID) ,
	PRIMARY KEY (ExamID,QuestionID)
);
INSERT INTO Department(DepartmentName)
VALUES
(N'Marketing' ),
(N'Sale' ),
(N'B???o v???' ),
(N'Nh??n s???' ),
(N'K??? thu???t' ),
(N'T??i ch??nh' ),
(N'Ph?? gi??m ?????c'),
(N'Gi??m ?????c' ),
(N'Th?? k??' ),
(N'No person' ),
(N'B??n h??ng' );

INSERT INTO Position (PositionName )
VALUES ('Dev' ),
('Test' ),
('Scrum Master'),
('PM' );

INSERT INTO `Account`(Email , Username, FullName , DepartmentID , PositionID,CreateDate)
VALUES 	('Email1@gmail.com' ,'cho' ,'inu' , '5' , '1','2020-03-05'), 
		('Email2@gmail.com' ,'khicon' ,'goku' , '1' , '2','2020-03-05'), 
		('Email3@gmail.com' , 'zoo' ,'muduong', '2' , '2' ,'2020-03-07'), 
		('Email4@gmail.com' , 'yasuo' ,'mid', '3' , '4' ,'2020-03-08'), 
		('Email5@gmail.com' , 'koo' ,'tora', '4' , '4' ,'2020-03-10'), 
		('Email6@gmail.com' , 'takamichi' ,'saita', '6' , '3' ,'2020-04-05'), 
		('Email7@gmail.com' , 'baka' ,'yaro', '2' , '2' , NULL ), 
		('Email8@gmail.com' , 'usagi' ,'tho', '8' , '1' ,'2020-04-07'), 
		('Email9@gmail.com' , 'hebi' ,'ran', '2' , '2' ,'2020-04-07'), 
		('Email10@gmail.com' , 'tori' ,'chim', '10' , '1' ,'2020-04-09'), 
		('Email11@gmail.com' , 'ryu' ,'dragon', '10' , '1' , DEFAULT), 
		('Email12@gmail.com' , 'Dsen','neko' , '10' , '1' , DEFAULT); 
INSERT INTO `Group` ( GroupName , CreatorID , CreateDate)
VALUES	(N'Testing System' , 5,'2019-03-05'),
		(N'Development' , 1,'2020-03-07'),
		(N'VTI Sale 01' , 2 ,'2020-12-20'),
		(N'VTI Sale 02' , 3 ,'2017-03-10'),
		(N'VTI Sale 03' , 4 ,'2020-03-28'),
		(N'VTI Creator' , 6 ,'2015-04-06'),
		(N'VTI Marketing 01' , 7 ,'2020-04-07'),
		(N'Management' , 8 ,'2020-04-08'),
		(N'Chat with love' , 9 ,'2020-04-09'),
		(N'Vi Ti Ai' , 10 ,'2020-04-10');
INSERT INTO `GroupAccount` ( GroupID , AccountID , JoinDate )
VALUES 	( 1 , 1,'2019-03-05'),
		( 1 , 2,'2020-03-07'),
		( 3 , 3,'2020-03-09'),
		( 3 , 4,'2020-03-10'),
		( 5 , 5,'2020-03-28'),
		( 1 , 3,'2020-04-06'),
		( 1 , 7,'2020-04-07'),
		( 8 , 3,'2020-04-08'),
		( 1 , 9,'2020-04-09'),
		( 10 , 10,'2020-04-10');

INSERT INTO TypeQuestion (TypeName )
VALUES ('Essay' ),('Multiple-Choice' );

INSERT INTO CategoryQuestion (CategoryName )
VALUES 	('CS' ),
		('CF' ),
		('A1' ),
		('Poke' ),
		('LMHT' ),
		('Ruby' ),
		('FIFA' ),
		('C++' ),
		('PUBG' ),
		('AOE' );

INSERT INTO Question (Content , CategoryID, TypeID , CreatorID, CreateDate )
VALUES 	(N'C??u h???i v??? LMHT' , 1 ,'1' , '2' ,'2020-04-05'),
		(N'C??u H???i v??? FIFA' , 10 ,'2' , '2' ,'2020-04-05'),
		(N'H???i v??? CS' , 9 ,'2' , '3' ,'2020-04-06'),
		(N'H???i v??? Ruby' , 6 ,'1' , '4' ,'2020-04-06'),
		(N'H???i v??? Poke' , 5 ,'1' , '5' ,'2020-04-06'),
		(N'H???i v??? AOE' , 3 ,'2' , '6' ,'2020-04-06'),
		(N'H???i v??? PUBG' , 2 ,'1' , '7' ,'2020-04-06'),
		(N'H???i v??? C++' , 8 ,'1' , '8' ,'2020-04-07'),
		(N'H???i v??? CF' , 4 ,'2' , '9' ,'2020-04-07'),
		(N'H???i v??? A1' , 7 ,'1' , '10' ,'2020-04-07');
INSERT INTO Answer ( Content , QuestionID , isCorrect )
VALUES 	(N'Tr??? l???i 01' , 1 , 0),
		(N'Tr??? l???i 02' , 1 , 1),
		(N'Tr??? l???i 03', 1 , 0 ),
		(N'Tr??? l???i 04', 1 , 1 ),
		(N'Tr??? l???i 05', 2 , 1 ),
		(N'Tr??? l???i 06', 3 , 1 ),
		(N'Tr??? l???i 07', 4 , 0 ),
		(N'Tr??? l???i 08', 8 , 0 ),
		(N'Tr??? l???i 09', 9 , 1 ),
		(N'Tr??? l???i 10', 10 , 1 );

INSERT INTO Exam (`Code` , Title , CategoryID, Duration , CreatorID , CreateDate )
VALUES 	('VTIQ001' , N'????? thi AOE' ,1 , 60 , '5' ,'2019-04-05'),
		('VTIQ002' , N'????? thi LMHT' ,10 , 60 , '2' ,'2019-04-05'),
		('VTIQ004' , N'????? thi FIFA' , 6 , 60, '3' ,'2020-04-08'),
		('VTIQ005' , N'????? thi Ruby' , 5 , 120, '4' ,'2020-04-10'),
		('VTIQ006' , N'????? thi Poke' , 3 ,60 , '6' ,'2020-04-05'),
		('VTIQ007' , N'????? thi A1' , 2 ,60 , '7' ,'2020-04-05'),
		('VTIQ008' , N'????? thi PUBG' , 8 ,60 , '8' ,'2020-04-07'),
		('VTIQ009' , N'????? thi CF' , 4 ,90 , '9' ,'2020-04-07'),
        ('VTIQ009' , N'????? thi C++' , 4 ,90 , '9' ,'2020-04-07'),
		('VTIQ010' , N'????? thi CS', 7 ,90 , '10' ,'2020-04-08');

INSERT INTO ExamQuestion(ExamID , QuestionID )
VALUES 	( 1 , 5 ),
		( 2 , 10 ),
		( 3 , 4 ),
		( 4 , 3 ),
		( 5 , 7 ),
		( 6 , 10 ),
		( 7 , 2 ),
		( 8 , 10 ),
		( 9 , 9 ),
		( 10 , 8 );

#Question 2: l???y ra t???t c??? c??c ph??ng ban
SELECT * FROM Department;

#Question 3: l???y ra id c???a ph??ng ban "Sale"
SELECT DepartmentID FROM Department WHERE DepartmentName = N'Sale';

#Question 4: l???y ra th??ng tin account c?? full name d??i nh???t
SELECT * FROM `Account`
WHERE LENGTH(Fullname) = (SELECT MAX(LENGTH(Fullname)) FROM `Account`)
ORDER BY Fullname DESC;

#Question 5: L???y ra th??ng tin account c?? full name d??i nh???t v?? thu???c ph??ng ban c?? id = 3
SELECT * FROM `Account`
WHERE LENGTH(Fullname) = (SELECT MAX(LENGTH(Fullname)) FROM `Account`) 
AND DepartmentID = 3 ORDER BY Fullname ASC;

#Question 6: L???y ra t??n group ???? tham gia tr?????c ng??y 20/12/2019
SELECT GroupName FROM `Group` WHERE CreateDate < '2019-12-20';

#Question 7: L???y ra ID c???a question c?? >= 4 c??u tr??? l???i
SELECT QuestionID FROM Answer 
GROUP BY QuestionID HAVING COUNT(QuestionID) >=4;

#Question 8: L???y ra c??c m?? ????? thi c?? th???i gian thi >= 60 ph??t v?? ???????c t???o tr?????c ng??y 20/12/2019
SELECT `Code` FROM Exam
WHERE Duration >= 60 AND CreateDate < '2019-12-20';

#Question 9: L???y ra 5 group ???????c t???o g???n ????y nh???t
SELECT * FROM `Group`
ORDER BY CreateDate DESC LIMIT 5;

#Question 10: ?????m s??? nh??n vi??n thu???c department c?? id = 2
SELECT departmentID, COUNT(AccountID) AS SL
FROM `Account` WHERE DepartmentID = 2;

#Question 11: L???y ra nh??n vi??n c?? t??n b???t ?????u b???ng ch??? "D" v?? k???t th??c b???ng ch??? "o"
SELECT Fullname FROM `Account`
WHERE (SUBSTRING_INDEX(FullName, ' ', -1)) LIKE 'D%o' ;

#Question 12: X??a t???t c??? c??c exam ???????c t???o tr?????c ng??y 20/12/2019
DELETE FROM Exam WHERE CreateDate < '2019-12-20';

#Question 13: X??a t???t c??? c??c question c?? n???i dung b???t ?????u b???ng t??? "c??u h???i"
DELETE FROM `question`
WHERE (SUBSTRING_INDEX(Content,' ',2)) ='c??u h???i';

#Question 14: Update th??ng tin c???a account c?? id = 5 th??nh t??n "Nguy???n B?? L???c" v?? email th??nh loc.nguyenba@vti.com.vn
UPDATE `Account` SET Fullname = N'Nguy???n B?? L???c',
Email = 'loc.nguyenba@vti.com.vn' WHERE AccountID = 5;

#Question 15: update account c?? id = 5 s??? thu???c group c?? id = 4
UPDATE `GroupAccount` SET AccountID = 5
WHERE GroupID = 4;






