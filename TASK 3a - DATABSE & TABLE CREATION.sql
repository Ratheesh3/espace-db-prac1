-- ============================================
-- TASK 3a: DATABSE & TABLE CREATION
-- ============================================
CREATE DATABASE ESpaceDB;

USE ESpaceDB;

/*TABLE CREATION*/
CREATE TABLE Colonist (
  MCID INT IDENTITY(1,1) PRIMARY KEY,
  FirstName NVARCHAR(50) NOT NULL,
  MiddleName NVARCHAR(50),
  SirName NVARCHAR(50) NOT NULL,
  DOB DATE,
  Age INT,
  Gender CHAR(1),
  ContactNo VARCHAR(20),
  CivilStatus NVARCHAR(20),
  Qualification NVARCHAR(100),
  EarthAddress NVARCHAR(200)
);

CREATE TABLE Dependent (
  DependentID INT IDENTITY(1,1) PRIMARY KEY,
  MCID INT NOT NULL FOREIGN KEY REFERENCES Colonist(MCID),
  Name NVARCHAR(100),
  DOB DATE,
  Age INT,
  Gender CHAR(1),
  RelationshipToColonist NVARCHAR(50)
);

CREATE TABLE House (
  LotNumber INT PRIMARY KEY,
  NumRooms INT,
  SquareFeet DECIMAL(10,2)
);

CREATE TABLE AssignedHouse (
  MCID INT FOREIGN KEY REFERENCES Colonist(MCID),
  LotNumber INT FOREIGN KEY REFERENCES House(LotNumber),
  PRIMARY KEY (MCID, LotNumber)
);

CREATE TABLE Job (
  JobID INT IDENTITY(1,1) PRIMARY KEY,
  JobName NVARCHAR(100),
  JobDescription NVARCHAR(200)
);

CREATE TABLE Works (
  MCID INT FOREIGN KEY REFERENCES Colonist(MCID),
  JobID INT FOREIGN KEY REFERENCES Job(JobID),
  PRIMARY KEY (MCID, JobID)
);

CREATE TABLE EJet (
  JetCode VARCHAR(20) PRIMARY KEY,
  JetType NVARCHAR(50),
  Weight DECIMAL(10,2),
  PowerSource NVARCHAR(50),
  PassengerSeats INT,
  NuclearEnginePower DECIMAL(10,2)
);

CREATE TABLE Trip (
  TripID INT IDENTITY(1,1) PRIMARY KEY,
  JetCode VARCHAR(20) FOREIGN KEY REFERENCES EJet(JetCode),
  LaunchDate DATE,
  ReturnDate DATE
);

CREATE TABLE Takes (
  MCID INT FOREIGN KEY REFERENCES Colonist(MCID),
  TripID INT FOREIGN KEY REFERENCES Trip(TripID),
  PRIMARY KEY (MCID, TripID)
);

CREATE TABLE Pilot (
  PilotID INT IDENTITY(1,1) PRIMARY KEY,
  Name NVARCHAR(100),
  SpaceHours INT,
  Rank NVARCHAR(50)
);

CREATE TABLE Qualification (
  QualID INT IDENTITY(1,1) PRIMARY KEY,
  QualName NVARCHAR(100),
  Description NVARCHAR(200)
);

CREATE TABLE AssignedTo (
  PilotID INT FOREIGN KEY REFERENCES Pilot(PilotID),
  JetCode VARCHAR(20) FOREIGN KEY REFERENCES EJet(JetCode),
  PRIMARY KEY (PilotID, JetCode)
);

CREATE TABLE Holds (
  PilotID INT FOREIGN KEY REFERENCES Pilot(PilotID),
  QualID INT FOREIGN KEY REFERENCES Qualification(QualID),
  PRIMARY KEY (PilotID, QualID)
);


/* INSERTING SAMPLE DATA (5 rows each)*/
INSERT INTO Colonist (FirstName, MiddleName, SirName, DOB, Age, Gender, ContactNo, CivilStatus, Qualification, EarthAddress)
VALUES 
('John','A','Wick','1990-01-01',40,'M','0776722739','Married','Engineer','No.6 Peradeniya rd, Kandy'),
('Sara',NULL,'Ali','1988-02-15',36,'F','0717294399','Single','Doctor','No.150 Galle rd, Galle'),
('Harry','K','Potter','1995-07-21',29,'M','076731638','Married','Scientist','No.45 Gampola rd, Colombo'),
('Sydney',NULL,'Charles','1992-10-10',32,'F','0758237900','Single','Teacher','No.78 Peradeniya rd, Kandy'),
('Tony','R','Stark','1985-03-05',39,'M','0758237935','Married','Technician','N0.1 Colombo rd, Jaffna');

INSERT INTO Dependent (MCID, Name, DOB, Age, Gender, RelationshipToColonist)
VALUES 
(1,'Eleven','2015-05-10',9,'F','Daughter'),
(1,'Peter','2018-11-22',6,'M','Son'),
(3,'Heisenberg','2020-06-01',4,'M','Son'),
(5,'Hank','2012-03-11',12,'M','Son'),
(5,'Jesse','2017-08-19',7,'F','Daughter');

INSERT INTO House (LotNumber, NumRooms, SquareFeet)
VALUES 
(101,3,1200.50),
(102,2,900.75),
(103,4,1500.00),
(104,3,1100.25),
(105,5,2000.00);

INSERT INTO AssignedHouse (MCID, LotNumber)
VALUES 
(1,101),
(2,102),
(3,103),
(4,104),
(5,105);

INSERT INTO Job (JobName, JobDescription)
VALUES 
('Engineer','Responsible for systems'),
('Doctor','Healthcare duties'),
('Scientist','Research work'),
('Teacher','Education support'),
('Technician','Maintenance');

INSERT INTO Works (MCID, JobID) 
VALUES 
(1,1),
(2,2),
(3,3),
(4,4),
(5,5);

INSERT INTO EJet (JetCode, JetType, Weight, PowerSource, PassengerSeats, NuclearEnginePower)
VALUES 
('EJ1','Nuclear',200000,'Nuclear',100,5000),
('EJ2','Nuclear-Hydro',250000,'Hybrid',150,6000),
('EJ3','Hydro',220000,'Hydro',120,5500),
('EJ4','Nuclear',190000,'Nuclear',90,4800),
('EJ5','Hybrid',230000,'Hybrid',130,5800);

INSERT INTO Trip (JetCode, LaunchDate, ReturnDate)
VALUES 
('EJ1','2040-01-01','2040-06-01'),
('EJ2','2040-02-15','2040-07-15'),
('EJ3','2040-03-20','2040-08-20'),
('EJ4','2040-04-25','2040-09-25'),
('EJ5','2040-05-30','2040-10-30');

INSERT INTO Takes (MCID, TripID) 
VALUES 
(1,1),
(2,2),
(3,3),
(4,4),
(5,5);

INSERT INTO Pilot (Name, SpaceHours, Rank)
VALUES 
('Dustin Henderson',12000,'Senior Pilot'),
('Will Byers',8000,'Pilot'),
('Max Mayfield',15000,'Chief Astronomer'),
('Steve Harrington',9000,'Pilot'),
('Nancy Wheeler',7000,'Flight Engineer');

INSERT INTO Qualification (QualName, Description)
VALUES 
('AstroNav','Navigation training'),
('EngSys','Engineering systems'),
('LifeSupport','Life support ops'),
('FlightOps','Advanced flight'),
('Medical','Space medicine');

INSERT INTO AssignedTo (PilotID, JetCode) 
VALUES 
(1,'EJ1'),
(2,'EJ2'),
(3,'EJ3'),
(4,'EJ4'),
(5,'EJ5');

INSERT INTO Holds (PilotID, QualID) 
VALUES 
(1,1),
(2,2),
(3,3),
(4,4),
(5,5);

SELECT * FROM Colonist;
SELECT * FROM AssignedHouse;
SELECT * FROM AssignedTo;
SELECT * FROM Dependent;
SELECT * FROM EJet;
SELECT * FROM Holds;
SELECT * FROM House;
SELECT * FROM Job;
SELECT * FROM Pilot;
SELECT * FROM Qualification;
SELECT * FROM Takes;
SELECT * FROM Trip;
SELECT * FROM Works;