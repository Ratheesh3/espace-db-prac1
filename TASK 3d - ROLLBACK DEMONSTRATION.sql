
-- ============================================
-- TASK 3d: ROLLBACK DEMONSTRATION
-- ============================================
USE ESpaceDB;

EXECUTE AS USER = 'user1';
--Trying to delete a record
BEGIN TRY
    BEGIN TRANSACTION; 
    DELETE FROM Dependent WHERE MCID = 3;
    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    PRINT 'Error occurred: ' + ERROR_MESSAGE();
    ROLLBACK TRANSACTION;
END CATCH

REVERT;

--Trying to delete a record as sa
USE ESpaceDB;

BEGIN TRANSACTION; 

-- Deleting dependents of the colonist
DELETE FROM Dependent WHERE MCID = 3;

-- Checking if it is deleted
SELECT * FROM Dependent WHERE MCID = 3;

BEGIN TRANSACTION; 

-- Rollbacking to restore the row
ROLLBACK TRANSACTION;

-- Verifying it is back
SELECT * FROM Dependent WHERE MCID = 3;