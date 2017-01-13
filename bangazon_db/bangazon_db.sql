/*Delete Bangazon Company Structure*/
DELETE FROM EmployeeInTrainingProgram;
DELETE FROM TrainingProgram;
DELETE FROM DepartmentSupervisor;
DELETE FROM Computer;
DELETE FROM Employee;
DELETE FROM Occupation;
DELETE FROM Department;
/*Delete Bangazon Product Structure*/
DELETE FROM Product;
DELETE FROM PaymentType;
DELETE FROM Customer;
DELETE FROM CustomerOrder;
DELETE FROM ProductType;

/*Drop Table Bangazon Company Structure*/
DROP TABLE IF EXISTS EmployeeInTrainingProgram;
DROP TABLE IF EXISTS TrainingProgram;
DROP TABLE IF EXISTS DepartmentSupervisor;
DROP TABLE IF EXISTS Computer;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Occupation;
DROP TABLE IF EXISTS Department;
/*Drop Table Bangazon Product Structure*/
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS PaymentType;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS CustomerOrder;
DROP TABLE IF EXISTS ProductType;

/* Bangazon Company Structure */
CREATE TABLE `Department` (
    `DepartmentId`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `Title` TEXT NOT NULL,
    `ExpenseBudget`   INTEGER NOT NULL
);
INSERT INTO Department VALUES(null, 'Human Resources', 100000);
INSERT INTO Department VALUES(null, 'Marketing', 100000);
INSERT INTO Department VALUES(null, 'Engineering', 100000);

CREATE TABLE `Occupation` (
    `OccupationId`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `Title` TEXT NOT NULL
);
INSERT INTO Occupation VALUES(null, 'Manager');
INSERT INTO Occupation VALUES(null, 'Engineer');
INSERT INTO Occupation VALUES(null, 'PR Analyst');
INSERT INTO Occupation VALUES(null, 'HR Lawyer');

CREATE TABLE `Employee` (
    `EmployeeId`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `FirstName` TEXT NOT NULL,
    `LastName` TEXT NOT NULL,
	`DepartmentId` INTEGER NOT NULL,
	`OccupationId` INTEGER NOT NULL,
    FOREIGN KEY(`DepartmentId`) REFERENCES `Department`(`DepartmentId`),
    FOREIGN KEY(`OccupationId`) REFERENCES `Occupation`(`OccupationId`)
);
INSERT INTO Employee
    SELECT null, 'Zoe', 'LeBlanc', d.DepartmentId, o.OccupationId
    FROM Department d, Occupation o
    WHERE d.Title = 'Engineering' and o.Title = 'Engineer';

INSERT INTO Employee
    SELECT null, 'Jessica', 'Jones', d.DepartmentId, o.OccupationId
    FROM Department d, Occupation o
    WHERE d.Title = 'Human Resources' and o.Title = 'HR Lawyer';

INSERT INTO Employee
    SELECT null, 'Luke', 'Cage', d.DepartmentId, o.OccupationId
    FROM Department d, Occupation o
    WHERE d.Title = 'Marketing' and o.Title = 'PR Analyst';
	
CREATE TABLE `Computer` (
    `ComputerId`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `PurchaseDate` DATE NOT NULL,
    `DecomissionedDate` DATE NOT NULL,
    `Brand` TEXT NOT NULL,
	`EmployeeId` INTEGER NOT NULL,
    FOREIGN KEY(`EmployeeId`) REFERENCES `Employee`(`EmployeeId`)
);
INSERT INTO Computer
    SELECT null, 2014-11-22, 2016-11-22, 'Mac', e.EmployeeId
    FROM Employee e
    WHERE e.FirstName = 'Zoe' and e.LastName = 'LeBlanc';

INSERT INTO Computer
    SELECT null, 2015-11-22, 2016-11-22, 'Ipad', e.EmployeeId
    FROM Employee e
    WHERE e.FirstName = 'Jessica' and e.LastName = 'Jones';
	
INSERT INTO Computer
    SELECT null, 2015-11-22, 2016-11-22, 'IBM Laptop', e.EmployeeId
    FROM Employee e
    WHERE e.FirstName = 'Luke' and e.LastName = 'Cage';
	
CREATE TABLE `DepartmentSupervisor` (
    `DepartmentSupervisorId`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`DepartmentId` INTEGER NOT NULL,
	`OccupationId` INTEGER NOT NULL,
	`EmployeeId` INTEGER NOT NULL,
    FOREIGN KEY(`DepartmentId`) REFERENCES `Department`(`DepartmentId`),
    FOREIGN KEY(`OccupationId`) REFERENCES `Occupation`(`OccupationId`),
    FOREIGN KEY(`EmployeeId`) REFERENCES `Employee`(`EmployeeId`)
);

INSERT INTO DepartmentSupervisor
    SELECT null, e.DepartmentId, e.OccupationId, e.EmployeeId
    FROM Employee e
    WHERE e.FirstName = 'Zoe' 
	and e.LastName = 'LeBlanc'; 

INSERT INTO DepartmentSupervisor
    SELECT null, e.DepartmentId, e.OccupationId, e.EmployeeId
    FROM Employee e
    WHERE e.FirstName = 'Jessica' 
	and e.LastName = 'Jones'; 
	
INSERT INTO DepartmentSupervisor
    SELECT null, e.DepartmentId, e.OccupationId, e.EmployeeId
    FROM Employee e
    WHERE e.FirstName = 'Luke' 
	and e.LastName = 'Cage'; 

CREATE TABLE `TrainingProgram` (
    `TrainingProgramId`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `Title` TEXT NOT NULL,
    `StartDate` DATE NOT NULL,
    `EndDate` DATE NOT NULL,
    `MaxEmployees` INTEGER NOT NULL
);
INSERT INTO TrainingProgram VALUES(null, 'Intro to Big Data', 2017-01-12, 2017-01-13, 12);
INSERT INTO TrainingProgram VALUES(null, 'Intro to Making Enemies', 2017-01-12, 2017-01-13, 12);
INSERT INTO TrainingProgram VALUES(null, 'Intro to Selling Things', 2017-01-12, 2017-01-13, 12);

CREATE TABLE `EmployeeInTrainingProgram` (
    `EmployeeInTrainingProgramId`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`TrainingProgramId` INTEGER NOT NULL,
	`EmployeeId` INTEGER NOT NULL,
    FOREIGN KEY(`TrainingProgramId`) REFERENCES `TrainingProgram`(`TrainingProgramId`),
    FOREIGN KEY(`EmployeeId`) REFERENCES `Employee`(`EmployeeId`)
);
INSERT INTO EmployeeInTrainingProgram
    SELECT null, t.TrainingProgramId, e.EmployeeId
    FROM TrainingProgram t, Employee e
    WHERE t.Title = 'Intro to Big Data' and e.FirstName = 'Zoe' and e.LastName= 'LeBlanc';
INSERT INTO EmployeeInTrainingProgram
    SELECT null, t.TrainingProgramId, e.EmployeeId
    FROM TrainingProgram t, Employee e
    WHERE t.Title = 'Intro to Making Enemies' and e.FirstName = 'Zoe' and e.LastName= 'LeBlanc';
INSERT INTO EmployeeInTrainingProgram
    SELECT null, t.TrainingProgramId, e.EmployeeId
    FROM TrainingProgram t, Employee e
    WHERE t.Title = 'Intro to Big Data' and e.FirstName = 'Jessica' and e.LastName= 'Jones';
INSERT INTO EmployeeInTrainingProgram
    SELECT null, t.TrainingProgramId, e.EmployeeId
    FROM TrainingProgram t, Employee e
    WHERE t.Title = 'Intro to Making Enemies' and e.FirstName = 'Jessica' and e.LastName= 'Jones';
INSERT INTO EmployeeInTrainingProgram
    SELECT null, t.TrainingProgramId, e.EmployeeId
    FROM TrainingProgram t, Employee e
    WHERE t.Title = 'Intro to Making Enemies' and e.FirstName = 'Luke' and e.LastName= 'Cage';
INSERT INTO EmployeeInTrainingProgram
    SELECT null, t.TrainingProgramId, e.EmployeeId
    FROM TrainingProgram t, Employee e
    WHERE t.Title = 'Intro to Selling Things' and e.FirstName = 'Luke' and e.LastName= 'Cage';
	
/* Bangazon Product Structure */
CREATE TABLE `ProductType` (
    `ProductTypeId`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `Type` TEXT NOT NULL
);
INSERT INTO ProductType VALUES(null, 'Web Application');
INSERT INTO ProductType VALUES(null, 'Poster');
INSERT INTO ProductType VALUES(null, 'Consultation');

CREATE TABLE `CustomerOrder` (
    `CustomerOrderId`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `Number` INTEGER NOT NULL
);
INSERT INTO CustomerOrder VALUES(null, 123456);
INSERT INTO CustomerOrder VALUES(null, 1234567);
INSERT INTO CustomerOrder VALUES(null, 12345678);

CREATE TABLE `Customer` (
    `CustomerId`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `FirstName` TEXT NOT NULL,
    `LastName` TEXT NOT NULL,
    `DateAccountCreated` DATE NOT NULL,
    `ActiveAccountInLast240Days` BOOLEAN NOT NULL,
	`CustomerOrderId` INTEGER NOT NULL,
    FOREIGN KEY(`CustomerOrderId`) REFERENCES `CustomerOrder`(`CustomerOrderId`)
);
INSERT INTO Customer
    SELECT null, 'Dani', 'Adkins', 2016-07-05, 1, co.CustomerOrderId
    FROM CustomerOrder co
    WHERE co.Number = 123456;
INSERT INTO Customer
    SELECT null, 'Buffy', 'Summers', 2016-07-05, 1, co.CustomerOrderId
    FROM CustomerOrder co
    WHERE co.Number = 1234567;
INSERT INTO Customer
    SELECT null, 'Sarah', 'Connor', 2016-07-05, 1, co.CustomerOrderId
    FROM CustomerOrder co
    WHERE co.Number = 12345678;

CREATE TABLE `PaymentType` (
    `PaymentTypeId`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `PaymentMethod` TEXT NOT NULL,
	`CustomerId` INTEGER NOT NULL,
    FOREIGN KEY(`CustomerId`) REFERENCES `Customer`(`CustomerId`)
);
INSERT INTO PaymentType
    SELECT null, 'Mastercard', c.CustomerId
    FROM Customer c
    WHERE c.FirstName = 'Dani' and c.LastName = 'Adkins';
INSERT INTO PaymentType
    SELECT null, 'Cash', c.CustomerId
    FROM Customer c
    WHERE c.FirstName = 'Dani' and c.LastName = 'Adkins';
INSERT INTO PaymentType
    SELECT null, 'Mastercard', c.CustomerId
    FROM Customer c
    WHERE c.FirstName = 'Buffy' and c.LastName = 'Summers';
INSERT INTO PaymentType
    SELECT null, 'Cash', c.CustomerId
    FROM Customer c
    WHERE c.FirstName = 'Buffy' and c.LastName = 'Summers';
INSERT INTO PaymentType
    SELECT null, 'Mastercard', c.CustomerId
    FROM Customer c
    WHERE c.FirstName = 'Sarah' and c.LastName = 'Connor';
INSERT INTO PaymentType
    SELECT null, 'Cash', c.CustomerId
    FROM Customer c
    WHERE c.FirstName = 'Sarah' and c.LastName = 'Connor';
	
CREATE TABLE `Product` (
    `ProductId`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `Title` TEXT NOT NULL,
    `Price` DECIMAL NOT NULL,
    `Description` TEXT NOT NULL,
	`CustomerId` INTEGER NOT NULL,
	`ProductTypeId` INTEGER NOT NULL,
    FOREIGN KEY(`CustomerId`) REFERENCES `Customer`(`CustomerId`),
    FOREIGN KEY(`ProductTypeId`) REFERENCES `ProductType`(`ProductTypeId`)
);
INSERT INTO Product
    SELECT null, 'Archivlo Pro', 10.99, 'Access for a year to Archivlo', c.CustomerId, pt.ProductTypeId
    FROM Customer c, ProductType pt
    WHERE c.FirstName = 'Dani' and c.LastName = 'Adkins' and pt.Type = 'Web Application';
INSERT INTO Product
    SELECT null, 'Promotional Poster', 100.99, 'Designed Poster', c.CustomerId, pt.ProductTypeId
    FROM Customer c, ProductType pt
    WHERE c.FirstName = 'Buffy' and c.LastName = 'Summers' and pt.Type = 'Poster';
INSERT INTO Product
    SELECT null, 'Consult on Terminator Issue', 0.00, 'Initial consultation', c.CustomerId, pt.ProductTypeId
    FROM Customer c, ProductType pt
    WHERE c.FirstName = 'Sarah' and c.LastName = 'Connor' and pt.Type = 'Consultation';
	