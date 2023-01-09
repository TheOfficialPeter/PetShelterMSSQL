USE PetShelter
GO 

CREATE INDEX idx_supplierid ON Supplier (supplierId)
GO

CREATE INDEX idx_foodid ON Food (foodId)
GO
 
CREATE INDEX idx_animalid ON Animal (animalId)
GO
 
CREATE INDEX idx_petid ON Pet (petId)
GO
