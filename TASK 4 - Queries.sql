USE ESpaceDB;

-- ============================================
-- QUERY 1: Colonists and their Dependents
-- LEFT JOIN is used so colonists without dependents still appear
-- ============================================

SELECT 
    c.FirstName + ' ' + ISNULL(c.MiddleName + ' ', '') + c.SirName AS ColonistName,
    d.Name AS DependentName,
    d.RelationshipToColonist
FROM Colonist c
LEFT JOIN Dependent d
    ON c.MCID = d.MCID
ORDER BY c.MCID;


-- ============================================
-- QUERY 2: Colonists with their Trip and E-Jet Details
-- INNER JOINs used to get trips and Jet information
-- ============================================

SELECT 
    c.FirstName + ' ' + ISNULL(c.MiddleName + ' ', '') + c.SirName AS ColonistName,
    t.TripID,
    t.LaunchDate,
    t.ReturnDate,
    e.JetCode,
    e.JetType,
    e.PassengerSeats
FROM Colonist c
INNER JOIN Takes tk
    ON c.MCID = tk.MCID
INNER JOIN Trip t
    ON tk.TripID = t.TripID
INNER JOIN EJet e
    ON t.JetCode = e.JetCode
ORDER BY t.LaunchDate;


-- ============================================
-- QUERY 3: Colonists and their Jobs
-- Lists colonists with all jobs they are assigned
-- ============================================

SELECT 
    c.FirstName + ' ' + ISNULL(c.MiddleName + ' ', '') + c.SirName AS ColonistName,
    j.JobName,
    j.JobDescription
FROM Colonist c
INNER JOIN Works w
    ON c.MCID = w.MCID
INNER JOIN Job j
    ON w.JobID = j.JobID
ORDER BY c.MCID;