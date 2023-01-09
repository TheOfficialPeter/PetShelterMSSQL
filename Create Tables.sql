/*
Create tables.sql

-- creates the required tables --
*/

USE [PetShelter]
GO

CREATE TABLE Supplier (
supplierId INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
supplierName NCHAR(50) UNIQUE NOT NULL,
phone NCHAR(15) UNIQUE NOT NULL,
email NCHAR(50) UNIQUE NOT NULL
)
GO

CREATE TABLE Food (
foodId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
supplierId INT FOREIGN KEY REFERENCES Supplier(supplierId),
expiryDate DATE NOT NULL,
quantity INT NOT NULL CHECK (quantity>0),
foodType NCHAR(50) NOT NULL,
unit NCHAR(3) NOT NULL
)
GO

CREATE TABLE Animal (
animalId INT PRIMARY KEY NOT NULL IDENTITY(1,1),
catId INT NOT NULL,
animalName NCHAR(50) NOT NULL,
animalType NCHAR(50) NOT NULL DEFAULT 'Mammal'
)
GO

CREATE TABLE AnimalFood (
animalId INT FOREIGN KEY REFERENCES Animal(animalId),
foodId INT FOREIGN KEY REFERENCES Food(foodId)
)
GO

CREATE TABLE Pet (
petId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
animalId INT FOREIGN KEY REFERENCES Animal(animalId),
petType NCHAR(50) NOT NULL
)
GO

