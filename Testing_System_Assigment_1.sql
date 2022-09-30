

#Xoa databedi neu ton tai
DROP DATABASE IF EXISTS Testing_System_Assigment_1;

#Cau lenh de tao ra mot co so du lieu
CREATE DATABASE Testing_System_Assignment_1;

USE Testing_System_Assignment_1;

DROP DATABASE IF EXISTS `Deparment`;
#Tao bang trong co so du lieu 
CREATE TABLE `Department` (
	DepartmentID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    DepartmentNAME VARCHAR(30) NOT NULL UNIQUE KEY
);

DROP DATABASE IF EXISTS `Postting` ;
CREATE TABLE `Position` (
	PositionID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    PositionName ENUM(`Dew`,`Tset`,`Scrum`,`Master`,`PM`) NOT NULL UNIQUE KEY
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
    CategoryName ENUM(`Java`,`NET`,`SQL`,`Postman`,`Ruby`) NOT NULL UNIQUE KEY
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
    Code VARCHAR(255) NOT NULL UNIQUE KEY,
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