/*
create views.sql

-- Create the required views --
*/

USE PetShelter
GO

CREATE VIEW [vw_ManufacturerDetails] AS
SELECT Supplier.supplierId, MAX(Supplier.supplierName) AS supplierName, MAX(Supplier.email) AS email, MAX(Supplier.phone) AS phone, MAX(Food.foodType) AS foodType, MAX(Food.quantity) AS quantity
FROM Supplier
LEFT JOIN Food ON Supplier.supplierId = Food.supplierId
GROUP BY Supplier.supplierId
GO

CREATE VIEW [vw_PetsPerType] AS
SELECT Animal.animalType, COUNT(Animal.animalId) AS animalCount
FROM Animal
GROUP BY Animal.animalType
GO

CREATE VIEW [vw_ExpiredFoodDetails] AS
SELECT Supplier.supplierName, Supplier.phone, Food.foodId, Food.foodType, Food.expiryDate, Food.quantity, Food.unit
FROM Supplier
LEFT JOIN Food ON Supplier.supplierId = Food.foodId
WHERE CONVERT(date, Food.expiryDate) < GETDATE()
GO

CREATE VIEW [vw_LowestFoods] AS
SELECT Animal.catId, MAX(Animal.animalType) AS animalType, COUNT(Animal.animalId) AS animalCount
FROM Animal
GROUP BY Animal.animalType
GO	