DROP DATABASE IF EXISTS Testing_System_Assignment_1;

CREATE DATABASE Testing_System_Assignment_1;

USE Testing_System_Assignment_1;

DROP DATABASE IF EXISTS `Deparment`;

CREATE TABLE `Department` (
	DepartmentID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL UNIQUE KEY
);

DROP DATABASE IF EXISTS `Postting` ;
CREATE TABLE `Position` (
	PositionID INT PRIMARY KEY AUTO_INCREMENT ,
    PositionName ENUM('Dev','Test','Scrum Master','PM') NOT NULL UNIQUE KEY
);

DROP DATABASE IF EXISTS `Account` ;
CREATE TABLE `Account` (
	AccountID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Email VARCHAR(255) NOT NULL UNIQUE KEY,
    Usename VARCHAR(255) NOT NULL UNIQUE KEY,
    FullName VARCHAR(255) NOT NULL UNIQUE KEY,
    DepartmentID INT PRIMARY KEY,
    PositionID INT PRIMARY KEY,
    CreateDate DATE
    
);

DROP DATABASE IF EXISTS `Group` ;
CREATE TABLE `Group` (
	GroupID INT UNSIGNED  PRIMARY KEY AUTO_INCREMENT,
    GroupName VARCHAR(255) NOT NULL UNIQUE KEY,
    CreatorID INT PRIMARY KEY,
    CreateDate DATE
);

DROP DATABASE IF EXISTS `GroupAccount` ;
CREATE TABLE `GroupAccount` (
	GroupID INT PRIMARY KEY,
    AccountID INT PRIMARY KEY,
    JoinDate DATE
);

DROP DATABASE IF EXISTS `TypeQuestion` ;
CREATE TABLE `TypeQuestion` (
	TypeID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    TypeName VARCHAR(30) NOT NULL UNIQUE KEY
);

DROP DATABASE IF EXISTS `CategoryQuestion` ;
CREATE TABLE `CategoryQuestion` (
	CategoryID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    CategoryName ENUM('Java','NET','SQL','Postman','Ruby') NOT NULL UNIQUE KEY
);

DROP DATABASE IF EXISTS `Question` ;
CREATE TABLE `Question` (
	QuestionID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content VARCHAR(255) NOT NULL UNIQUE KEY,
    CategoryID INT PRIMARY KEY,
    TypeID INT PRIMARY KEY,
    CreatorID INT PRIMARY KEY,
    CreateDate DATE
);

DROP DATABASE IF EXISTS `Answer` ;
CREATE TABLE `Answer` (
	AnswerID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content VARCHAR(255) NOT NULL UNIQUE KEY,
    QuestionID INT PRIMARY KEY,
    isCorrect BOOLEAN
);

DROP DATABASE IF EXISTS `Exam` ;
CREATE TABLE `Exam` (
	ExamID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Code  VARCHAR(255) NOT NULL UNIQUE KEY,
	Title	VARCHAR(255) NOT NULL UNIQUE KEY,
    CategoryID INT PRIMARY KEY,
    Duration TIME,
    CreatorID INT PRIMARY KEY,
    CreateDate DATE
);

DROP DATABASE IF EXISTS `ExamQuestion` ;
CREATE TABLE `ExamQuestion` (
	ExamID INT PRIMARY KEY,
    QuestionID INT PRIMARY KEY
);

INSERT INTO `Department`(DepartmentName) 
	VALUES ('Kế toán'), ('Giám đốc'), ('Trưởng phòng'), ('Trưởng nhóm'), ('Marketing'), ('Nhân sự'), ('Kế hoạch'), ('Bảo vệ');

INSERT INTO `Position`(PositionName) 
	VALUES ('PM'), ('Test'), ('DEV'), ('Scrum Master');

INSERT INTO `Account` (Email, Username, FullName, DepartmentID, PositionID, CreateDate)
	VALUES ('as@gmail.com','Person1', 'FullNamePerson1','1', '5',  '1999-02-01');
INSERT INTO `Account` (Email, Username, FullName, DepartmentID, PositionID, CreateDate) 
	VALUES ('vb@gmail.com','Person2', 'FullNamePerson2','2', '7',  '1999-02-02');
INSERT INTO `Account` (Email, Username, FullName, DepartmentID, PositionID, CreateDate) 
	VALUES ('cd@gmail.com','Person3', 'FullNamePerson3','3', '6',  '1999-02-03');
INSERT INTO `Account` (Email, Username, FullName, DepartmentID, PositionID, CreateDate) 
	VALUES ('ed@gmail.com','Person4', 'FullNamePerson4','4', '8',  '1999-02-04');
INSERT INTO `Account` (Email, Username, FullName, DepartmentID, PositionID, CreateDate) 
	VALUES ('he@gmail.com','Person5', 'FullNamePerson5','5', '8',  '1999-02-05');
INSERT INTO `Account` (Email, Username, FullName, DepartmentID, PositionID, CreateDate) 
	VALUES ('jf@gmail.com','Person6', 'FullNamePerson6','6', '5',  '1999-02-06');
INSERT INTO `Account` (Email, Username, FullName, DepartmentID, PositionID, CreateDate) 
	VALUES ('kg@gmail.com','Person7', 'FullNamePerson7','7', '7',  '1999-02-07');
INSERT INTO `Account` (Email, Username, FullName, DepartmentID, PositionID, CreateDate) 
	VALUES ('ah@gmail.com','Person8', 'FullNamePerson8','8', '5',  '1999-02-08');

INSERT INTO `Group`(GroupName , CreatorID , CreateDate)  
	VALUES (N'Box chát','1', '2022-02-01');
INSERT INTO `Group`(GroupName , CreatorID , CreateDate)  
	VALUES (N'Ăn uống','1', '2022-02-01');
INSERT INTO `Group`(GroupName , CreatorID , CreateDate)  
	VALUES (N'Lên ý tưởng','1', '2022-02-01');
INSERT INTO `Group`(GroupName , CreatorID , CreateDate)  
	VALUES (N'Báo cáo doanh thu','1', '2022-02-01');
INSERT INTO `Group`(GroupName , CreatorID , CreateDate)  
	VALUES (N'Nhu yếu phẩm','1', '2022-02-01');
INSERT INTO `Group`(GroupName , CreatorID , CreateDate) 
	VALUES (N'Team Building','1', '2022-02-01');
INSERT INTO `Group`(GroupName , CreatorID , CreateDate)  
	VALUES (N'Thảo luận','1', '2022-02-01');

INSERT INTO `GroupAccount`(GroupID , AccountID , JoinDate) 
	VALUES ('1', '1', '2022-02-02');
INSERT INTO `GroupAccount`(GroupID , AccountID , JoinDate) 
	VALUES ('2', '4', '2022-02-03');
INSERT INTO `GroupAccount`(GroupID , AccountID , JoinDate) 
	VALUES ('3', '5', '2022-02-04');
INSERT INTO `GroupAccount`(GroupID , AccountID , JoinDate) 
	VALUES ('4', '6', '2022-02-05');
INSERT INTO `GroupAccount`(GroupID , AccountID , JoinDate) 
	VALUES ('5', '7', '2022-02-06');
INSERT INTO `GroupAccount`(GroupID , AccountID , JoinDate) 
	VALUES ('6', '8', '2022-02-07');
INSERT INTO `GroupAccount`(GroupID , AccountID , JoinDate) 
	VALUES ('7', '9', '2022-02-08');
INSERT INTO `GroupAccount`(GroupID , AccountID , JoinDate) 
	VALUES ('6', '10', '2022-02-09');

INSERT INTO `TypeQuestion`(TypeName) 
	VALUES('Essay'), ('Multiple-Choice');

INSERT INTO `CategoryQuestion`(CategoryName) 
	VALUES  ('Ruby'),('.NET'),('SQL'),('Postman'),('JAVA');

INSERT INTO `Question`(Content, CategoryID, TypeID, CreatorID, CreateDate) 
	VALUES (N'Tại sao không chạy được code', '1', '1','1','2022-03-01');
INSERT INTO `Question`(Content, CategoryID, TypeID, CreatorID, CreateDate) 
	VALUES (N'Tại sao chạy code lỗi', '2', '2','1','2022-03-01=2');
INSERT INTO` Question`(Content, CategoryID, TypeID, CreatorID, CreateDate) 
	VALUES (N'Tại sao code dài mà chạy nhanh', '3', '1','1','2022-03-03');
INSERT INTO `Question`(Content, CategoryID, TypeID, CreatorID, CreateDate) 
	VALUES (N'Tại sao code bị sai mà vẫn chạy được', '4', '1','1','2022-03-04');
INSERT INTO `Question`(Content, CategoryID, TypeID, CreatorID, CreateDate)
	VALUES (N'Tại sao khó quá', '5', '2','1','2022-03-05');
INSERT INTO `Question`(Content, CategoryID, TypeID, CreatorID, CreateDate) 
	VALUES (N'Tại sao làm đúng mà nó cứ báo sai suốt', '2', '1','1','2022-03-06');
INSERT INTO `Question`(Content, CategoryID, TypeID, CreatorID, CreateDate) 
	VALUES (N'Tại sao code chạy được nhưng kết quả sai', '3', '1','1','2022-03-07');
INSERT INTO `Question`(Content, CategoryID, TypeID, CreatorID, CreateDate) 
	VALUES (N'Tại sao debug mãi code không chạy được', '4', '1','1','2022-03-08');

INSERT INTO `Answer`(Content , QuestionID , isCorrect)
	VALUES (N'Ans1','1','TRUE');
INSERT INTO `Answer`(Content , QuestionID , isCorrect) 
	VALUES (N'Ans2','2','FALSE');
INSERT INTO `Answer`(Content , QuestionID , isCorrect) 
	VALUES (N'Ans3','3','TRUE');
INSERT INTO `Answer`(Content , QuestionID , isCorrect) 
	VALUES (N'Ans4','4','FALSE');
INSERT INTO`Answer`(Content , QuestionID , isCorrect)	
 VALUES (N'Ans5','5','TRUE');
INSERT INTO `Answer`(Content , QuestionID , isCorrect)
	VALUES (N'Ans6','6','FALSE');
INSERT INTO `Answer`(Content , QuestionID , isCorrect) 	
VALUES (N'Ans7','7','TRUE');
INSERT INTO `Answer`(Content , QuestionID , isCorrect) 
	VALUES (N'Ans8','8','FALSE');

INSERT INTO  `Exam`(`Code` , Title , CategoryID, Duration , CreatorID , CreateDate) 
	VALUES ('1','Thi JAVA','1', '60m','1','2022-05-01');
INSERT INTO `Exam`(`Code` , Title , CategoryID, Duration , CreatorID , CreateDate) 
	VALUES ('2','Thi js','2', '120m','4','2022-05-02');
INSERT INTO  `Exam`(`Code` , Title , CategoryID, Duration , CreatorID , CreateDate)	
	VALUES ('3','Thi html','3', '100m','5','2022-05-03');
INSERT INTO  `Exam`(`Code` , Title , CategoryID, Duration , CreatorID , CreateDate)
	VALUES ('4','Thi css','4', '60m','6','2022-05-04');
INSERT INTO  `Exam`(`Code` , Title , CategoryID, Duration , CreatorID , CreateDate) 
	VALUES ('5','Thi reactjs','5', '100m','7','2022-05-05');
INSERT INTO  `Exam`(`Code` , Title , CategoryID, Duration , CreatorID , CreateDate) 
	VALUES ('6','Thi expressjs','1', '60m','8','2022-05-06');
INSERT INTO  `Exam`(`Code` , Title , CategoryID, Duration , CreatorID , CreateDate)
	VALUES ('7','Thi php','2', '60m','9','2022-05-07');
INSERT INTO  `Exam`(`Code` , Title , CategoryID, Duration , CreatorID , CreateDate) 
	VALUES ('8','Thi C++','3', '120m','10','2022-05-08');

INSERT INTO `ExamQuestion`(ExamID , QuestionID)
	VALUES ('1','1');
INSERT INTO `ExamQuestion`(ExamID , QuestionID)
	VALUES ('6','2');
INSERT INTO `ExamQuestion`(ExamID , QuestionID)
	VALUES ('7','3');
INSERT INTO `ExamQuestion`(ExamID , QuestionID) 
	VALUES ('8','4');
INSERT INTO `ExamQuestion`(ExamID , QuestionID) 
	VALUES ('9','5');
INSERT INTO `ExamQuestion`(ExamID , QuestionID) 
	VALUES ('11','6');
INSERT INTO `ExamQuestion`(ExamID , QuestionID) 
	VALUES ('12','7');
INSERT INTO `ExamQuestion`(ExamID , QuestionID) 	
	VALUES ('13','8');
		