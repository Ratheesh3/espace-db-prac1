-- ============================================
-- TASK 3c: PERMISSIONS
-- ============================================
USE ESpaceDB;

-- Grant full control to sa (redundant if sa is already sysadmin, but for the assignment)
GRANT CONTROL ON DATABASE::ESpaceDB TO sa WITH GRANT OPTION;

-- Grant SELECT permission to user1 on all tables
GRANT SELECT ON DATABASE::ESpaceDB TO user1;
