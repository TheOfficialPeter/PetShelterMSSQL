USE PetShelter
GO

CREATE PROCEDURE sp_NewPetType @Type nchar(10) AS
INSERT INTO Pet (petType)
VALUES (@Type)
GO

CREATE PROCEDURE sp_UpdateStock @id int, @count int, @petType nchar(10) AS
IF (@count = 0) 
	UPDATE Pet SET petType = @petType
ELSE
	DELETE FROM Pet WHERE animalId = @id
GO

CREATE PROCEDURE sp_DeleteFoodType @foodType nchar(20) AS
DELETE FROM vw_ExpiredFoodDetails WHERE foodType = @foodType
GO



CREATE PROCEDURE sp_Report @supplierId INT AS
  
  DECLARE @id INT
  DECLARE @supplierName NCHAR(50)
  DECLARE @phone NCHAR(50)
  DECLARE @email NCHAR(50)
  DECLARE @foodId INT
  DECLARE @foodType NCHAR(50)
  DECLARE @totals INT
  DECLARE detailCursor CURSOR FOR
	SELECT vw_ExpiredFoodDetails.foodId, vw_ExpiredFoodDetails.foodType, Supplier.supplierId
	FROM vw_ExpiredFoodDetails, Supplier
	WHERE Supplier.supplierId = @supplierId

  SET  @totals = 0

  SELECT @supplierName = supplierName, @phone = phone, @email = email
  FROM Supplier
  WHERE @supplierId = supplierId
   
  SELECT @foodId = foodId, @foodType = foodType
  FROM Food
  WHERE @supplierId = supplierId

  PRINT 'EXPIRED PRODUCTS REPORT:'
  PRINT '---------------------------------'
  PRINT 'Generated:'
  PRINT CONVERT(NCHAR, GETDATE())
  PRINT ' '
  PRINT 'Company ID: ' + CAST(@supplierId AS NCHAR)
  PRINT 'Company Name: ' + @supplierName
  PRINT 'Contact Number: ' + @phone
  PRINT 'Email: ' + @email
  PRINT '---------------------------------'
  PRINT 'Food ID          Food Type'
  OPEN detailCursor
  FETCH FROM detailCursor INTO @foodId, @foodType, @id
  WHILE @@FETCH_STATUS = 0 --while there no errors: 0 mean no erros
  BEGIN --beggin printing
    PRINT CONVERT(VARCHAR, @foodId) + '                ' + @foodType
    SET @totals = @totals + 1
    FETCH FROM detailCursor INTO @foodId, @foodType, @id
  END --end BEGIN
  PRINT '---------------------------------'
  PRINT 'Total records: ' + CONVERT(VARCHAR, @totals) --print total
  PRINT ' '
  PRINT '---------------------------------'
  CLOSE detailCursor --close the cursor details
  DEALLOCATE detailCursor --Removes a cursor reference: releasing for another use