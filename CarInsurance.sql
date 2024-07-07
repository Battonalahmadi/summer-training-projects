

-- Create Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName varchar(50),
    LastName varchar(50),
    DateOfBirth DATE,
    Address varchar(100),
    PhoneNumber varchar(15),
    Email varchar(50)
);


-- Create Cars table
CREATE TABLE Cars (
    CarID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT,
    Make varchar(50),
    Model varchar(50),
    Year INT,
    VIN varchar(50) UNIQUE,
    LicensePlate varchar(20),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


-- Create Policies table
CREATE TABLE Policies (
    PolicyID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT,
    CarID INT,
    PolicyNumber varchar(50) UNIQUE,
    StartDate DATE,
    EndDate DATE,
    CoverageType varchar(50),
    Premium DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (CarID) REFERENCES Cars (CarID)
);


-- Create Claims table
CREATE TABLE Claims (
    ClaimID INT PRIMARY KEY IDENTITY(1,1),
    PolicyID INT,
    ClaimNumber varchar(50) UNIQUE,
    DateOfClaim DATE,
    Description NVARCHAR(MAX),
    ClaimAmount DECIMAL(10, 2),
    ClaimStatus varchar(20),
    FOREIGN KEY (PolicyID) REFERENCES Policies(PolicyID)
);


-- Create Payments table
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY IDENTITY(1,1),
    PolicyID INT,
    PaymentDate DATE,
    Amount DECIMAL(10, 2),
    PaymentMethod varchar(20),
    TransactionID varchar(50) UNIQUE,
    FOREIGN KEY (PolicyID) REFERENCES Policies(PolicyID)
);



---Insert Data into Customers Table


-- Use the database
---USE CarInsurance;

-- Insert data into Customers table
INSERT INTO Customers (FirstName, LastName, DateOfBirth, Address, PhoneNumber, Email)
VALUES 
('Batton', 'alahmadi', '1980-01-01', '123 Main St', '966-1234', 'batton@gamil.com'),
('Banan', 'aljuhani', '1985-05-15', '456 Oak Ave', '966-5678', 'banan@hmail.com'),
('Byader', 'alzhrani', '1990-12-10', '789 Pine Rd', '966-9012', 'byader@gmail.com');



--- Insert Data into Vehicles Table


-- Insert data into Vehicles table
INSERT INTO Cars(CustomerID, Make, Model, Year, VIN, LicensePlate)
VALUES 
(1, 'Toyota', 'Camry', 2015, '1HGBH41JXMN109186', 'ABC123'),
(2, 'Honda', 'Civic', 2018, '1HGCM82633A123456', 'XYZ789'),
(3, 'Ford', 'Focus', 2020, '1FAFP34P5WK123456', 'LMN456');



--- Insert Data into Policies Table


-- Insert data into Policies table

INSERT INTO Policies (CustomerID, CarID, PolicyNumber, StartDate, EndDate, CoverageType, Premium)
VALUES 
(1, 1, 'POL123456', '2023-01-01', '2024-01-01', 'Full Coverage', 1200.00),
(2, 2, 'POL789012', '2023-06-01', '2024-06-01', 'Liability', 800.00),
(3, 3, 'POL345678', '2023-03-01', '2024-03-01', 'Collision', 1000.00);



--- Insert Data into Claims Table


-- Insert data into Claims table
INSERT INTO Claims (PolicyID, ClaimNumber, DateOfClaim, Description, ClaimAmount, ClaimStatus)
VALUES 
(1, 'CLM123456', '2023-02-15', 'Rear-end collision', 2500.00, 'JED'),
(2, 'CLM789012', '2023-07-20', 'Windshield damage', 300.00, 'MAC'),
(3, 'CLM345678', '2023-04-05', 'Side swipe accident', 1500.00, 'RIG');




-- Insert data into Payments table
INSERT INTO Payments (PolicyID, PaymentDate, Amount, PaymentMethod, TransactionID)
VALUES 
(1, '2023-01-01', 100.00, 'Credit Card', 'TXN123456'),
(2, '2023-06-01', 80.00, 'Debit Card', 'TXN789012'),
(3, '2023-03-01', 90.00, 'Bank Transfer', 'TXN345678');




select * from Cars
select * from Claims
select * from Customers
select * from Payments
select * from Policies


---- Queries - Joins


select distinct CarID,Make,Year,Model
from Cars
inner join Customers on Customers.CustomerID = Cars.CarID
order by Year

select distinct CarID,Make,Year
from Cars
left join Customers on Customers.CustomerID = Cars.CarID


select distinct CarID,Make,Year
from Cars
inner join Customers on Customers.CustomerID = Cars.CarID


select  Customers.CustomerID, Cars.CarID
from Customers
full  outer join Cars on Cars.CarID = Customers.CustomerID



Select description
From Claims
Where ClaimID > 1;

select * from Claims


---- COMPARING STRING 

select FirstName
from Customers
where FirstName like '%d%'

select * from Customers

select FirstName
from Customers
where FirstName like '%n'


select CarID,Make,
from Cars
group by CarID


Select description
From Claims
Where ClaimID >= 3
UNION
Select description
From Claims
Where ClaimID > 1;

-----EXAMPLE


 SELECT FirstName, LastName FROM Customers ORDER BY FirstName, LastName


 SELECT FirstName, LastName FROM Customers ORDER BY 1, 2


--- SQL QUERIES 

select FirstName,CarID,Model,Description
from Customers,Cars,Claims
where Cars.CarID = Customers.CustomerID 

  


 -----AGGregation 

select COUNT(make) from Cars;

select AVG (year) from Cars;

