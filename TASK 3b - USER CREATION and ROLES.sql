-- ============================================
-- TASK 3b: USER CREATION and ROLES
-- ============================================
USE ESpaceDB;

CREATE LOGIN user1 WITH PASSWORD = 'User1Pass!';

USE ESpaceDB;
CREATE USER user1 FOR LOGIN user1;

SELECT name, type_desc FROM sys.database_principals;