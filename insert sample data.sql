/*
insert sample data.sql

-- insert the required rows --
*/

USE PetShelter
GO

-- Supplier
INSERT INTO Supplier (supplierName, email, phone)
VALUES ('Montego Pet Food', 'montegofoods@gmail.com', '083 935 4320')
GO

INSERT INTO Supplier (supplierName, email, phone)
VALUES ('Quick Foods', 'quickfoods@gmail.com', '082 455 4570')
GO

INSERT INTO Supplier (supplierName, email, phone)
VALUES ('Phangela Pet Nutrition', 'info@quan.co.za', '082 949 0056')
GO

INSERT INTO Supplier (supplierName, email, phone)
VALUES ('Natural Born Pets', 'admin@naturalbornpets.co.za', '082 959 0054')
GO


-- Food
INSERT INTO Food (supplierId, expiryDate, foodType, quantity, unit)
VALUES (1, '2022-04-10', 'Dog Food', 10, 'KG')
GO

INSERT INTO Food (supplierId, expiryDate, foodType, quantity, unit)
VALUES (3, '2024-02-01', 'Bird Food', 5, 'KG')
GO

INSERT INTO Food (supplierId, expiryDate, foodType, quantity, unit)
VALUES (2, '2022-02-10', 'Cat Food', 10, 'KG')
GO

INSERT INTO Food (supplierId, expiryDate, foodType, quantity, unit)
VALUES (4, '2024-07-01', 'Seeds', 7, 'KG')
GO

INSERT INTO Food (supplierId, expiryDate, foodType, quantity, unit)
VALUES (2, '2023-02-01', 'Cat Food', 10, 'KG')
GO

INSERT INTO Food (supplierId, expiryDate, foodType, quantity, unit)
VALUES (1, '2023-05-01', 'Dog Food', 5, 'KG')
GO

INSERT INTO Food (supplierId, expiryDate, foodType, quantity, unit)
VALUES (1, '2023-07-20', 'Dog Food', 10, 'KG')
GO

-- Animal
INSERT INTO Animal (catId, animalName, animalType)
VALUES (1, 'Muffin', 'Mammal')
GO

INSERT INTO Animal (catId, animalName, animalType)
VALUES (2, 'George', 'Bird')
GO

INSERT INTO Animal (catId, animalName, animalType)
VALUES (2, 'Luna', 'Bird')
GO

INSERT INTO Animal (catId, animalName, animalType)
VALUES (1, 'Bailey', 'Mammal')
GO

-- Animal Food
INSERT INTO AnimalFood (animalId, foodId)
VALUES (1, 1)
GO

INSERT INTO AnimalFood (animalId, foodId)
VALUES (2, 2)
GO

INSERT INTO AnimalFood (animalId, foodId)
VALUES (2, 4)
GO

INSERT INTO AnimalFood (animalId, foodId)
VALUES (1, 3)
GO

-- Pet
INSERT INTO Pet (animalId, petType)
VALUES (1, 'Dog')
GO

INSERT INTO Pet (animalId, petType)
VALUES (2, 'Parrot')
GO

INSERT INTO Pet (animalId, petType)
VALUES (4, 'Cat')
GO

INSERT INTO Pet (animalId, petType)
VALUES (3, 'Dove')
GO