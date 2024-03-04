CREATE DATABASE  IF NOT EXISTS `stydent` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `stydent`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: stydent
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `academic_year`
--

DROP TABLE IF EXISTS `academic_year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academic_year` (
  `idAcademic_Year` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idAcademic_Year`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_year`
--

LOCK TABLES `academic_year` WRITE;
/*!40000 ALTER TABLE `academic_year` DISABLE KEYS */;
INSERT INTO `academic_year` VALUES (1),(2),(3),(4);
/*!40000 ALTER TABLE `academic_year` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_course`
--

DROP TABLE IF EXISTS `category_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_course` (
  `idCategory_Course` int NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(3) NOT NULL,
  `categoryDescription` varchar(500) NOT NULL,
  PRIMARY KEY (`idCategory_Course`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_course`
--

LOCK TABLES `category_course` WRITE;
/*!40000 ALTER TABLE `category_course` DISABLE KEYS */;
INSERT INTO `category_course` VALUES (1,'INT','Bachelor of Science Programme in Information Technology'),(2,'GEN','GENERAL EDUCATION');
/*!40000 ALTER TABLE `category_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `idComment` int NOT NULL AUTO_INCREMENT,
  `emailOwner` varchar(100) NOT NULL,
  `commentDetail` varchar(1000) NOT NULL,
  `commentCreatedOn` timestamp NOT NULL,
  `Course_File_idCourse_File` int NOT NULL,
  PRIMARY KEY (`idComment`),
  KEY `fk_Comment_Course_File1_idx` (`Course_File_idCourse_File`),
  CONSTRAINT `fk_Comment_Course_File1` FOREIGN KEY (`Course_File_idCourse_File`) REFERENCES `course_file` (`idCourse_File`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `idCourse` int NOT NULL AUTO_INCREMENT,
  `courseName` varchar(6) NOT NULL,
  `courseFullName` varchar(100) NOT NULL,
  `courseDescription` varchar(500) NOT NULL,
  `courseCredit` int NOT NULL,
  `semester_idSemester` int NOT NULL,
  `category_Course_idCategory_Course` int NOT NULL,
  PRIMARY KEY (`idCourse`),
  KEY `fk_Course_Semester1_idx` (`semester_idSemester`),
  KEY `fk_Course_Category_Course1_idx` (`category_Course_idCategory_Course`),
  CONSTRAINT `fk_Course_Category_Course1` FOREIGN KEY (`category_Course_idCategory_Course`) REFERENCES `category_course` (`idCategory_Course`),
  CONSTRAINT `fk_Course_Semester1` FOREIGN KEY (`semester_idSemester`) REFERENCES `semester` (`idSemester`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'INT100','Information Technology Fundamentals','Description',3,1,1),(2,'INT101','Programming Fundamentals','Description',3,1,1),(3,'GEN101','Physical Education','Description',1,1,2);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_file`
--

DROP TABLE IF EXISTS `course_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_file` (
  `idCourse_File` int NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `fileDescription` varchar(500) NOT NULL,
  `fileCreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fileUpload` varchar(100) NOT NULL,
  `emailOwner` varchar(100) NOT NULL,
  `course_idCourse` int NOT NULL,
  PRIMARY KEY (`idCourse_File`),
  KEY `fk_Course_File_Course1_idx` (`course_idCourse`),
  CONSTRAINT `fk_Course_File_Course1` FOREIGN KEY (`course_idCourse`) REFERENCES `course` (`idCourse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_file`
--

LOCK TABLES `course_file` WRITE;
/*!40000 ALTER TABLE `course_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_has_user`
--

DROP TABLE IF EXISTS `course_has_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_has_user` (
  `course_idCourse` int NOT NULL,
  `user_idUser` int NOT NULL,
  PRIMARY KEY (`course_idCourse`,`user_idUser`),
  KEY `fk_Course_has_User_User1_idx` (`user_idUser`),
  KEY `fk_Course_has_User_Course1_idx` (`course_idCourse`),
  CONSTRAINT `fk_Course_has_User_Course1` FOREIGN KEY (`course_idCourse`) REFERENCES `course` (`idCourse`),
  CONSTRAINT `fk_Course_has_User_User1` FOREIGN KEY (`user_idUser`) REFERENCES `user` (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_has_user`
--

LOCK TABLES `course_has_user` WRITE;
/*!40000 ALTER TABLE `course_has_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_has_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `idReview` int NOT NULL AUTO_INCREMENT,
  `gradesReceived` varchar(2) NOT NULL,
  `section` int DEFAULT NULL,
  `semester` int NOT NULL,
  `year` int NOT NULL,
  `instructorName` varchar(100) NOT NULL,
  `ratingOfInteresting` int NOT NULL,
  `ratingOfGroupWork` int NOT NULL,
  `ratingOfGradeCollect` int NOT NULL,
  `ratingOfEasyExam` int NOT NULL,
  `ratingOfIndividualWork` int NOT NULL,
  `work` varchar(500) NOT NULL,
  `reviewDescription` varchar(1000) NOT NULL,
  `reviewCreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `emailOwner` varchar(100) NOT NULL,
  `course_idCourse` int NOT NULL,
  PRIMARY KEY (`idReview`),
  KEY `fk_Review_Course1_idx` (`course_idCourse`),
  CONSTRAINT `fk_Review_Course1` FOREIGN KEY (`course_idCourse`) REFERENCES `course` (`idCourse`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,'A',1,1,1,'Saim',4,3,5,1,2,'wasd','dasd','2024-02-16 07:59:58','std01@st.sit.kmutt.ac.th',1);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semester`
--

DROP TABLE IF EXISTS `semester`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `semester` (
  `idSemester` int NOT NULL AUTO_INCREMENT,
  `academic_Year_idAcademic_Year` int NOT NULL,
  PRIMARY KEY (`idSemester`),
  KEY `fk_Semester_Academic_Year_idx` (`academic_Year_idAcademic_Year`),
  CONSTRAINT `fk_Semester_Academic_Year` FOREIGN KEY (`academic_Year_idAcademic_Year`) REFERENCES `academic_year` (`idAcademic_Year`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semester`
--

LOCK TABLES `semester` WRITE;
/*!40000 ALTER TABLE `semester` DISABLE KEYS */;
INSERT INTO `semester` VALUES (1,1),(2,1),(3,2),(4,2),(5,3),(6,3),(7,4),(8,4);
/*!40000 ALTER TABLE `semester` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `idUser` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(100) NOT NULL,
  `userEmail` varchar(100) NOT NULL,
  `role` enum('staff_group','st_group') NOT NULL,
  PRIMARY KEY (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-16 15:00:57
