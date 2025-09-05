📘 E-Space Database Project (CIS5004 – PRAC1)

📖 Project Overview
This project implements a relational database for E-Space Solutions as part of the CIS5004 – Database Systems module.
It covers the full database development lifecycle:

1.Conceptual modeling with ER diagram

2.Logical design with relational schema mapping & normalization (1NF–3NF)

3.Physical implementation in Microsoft SQL Server

4.User management & permissions (DCL)

5.Demonstration of transactions with ROLLBACK

6.Querying the database with multi-table SQL joins

🗂 Repository Contents
TASK 3a - DATABSE & TABLE CREATION.sql -> SQL script to create the database, tables, constraints, and insert 5 sample records per table.

TASK 3b - USER CREATION and ROLES.sql -> SQL script to create user1, assign roles.

TASK 3c - PERMISSIONS.sql -> SQL script to set permissions.

TASK 3d - ROLLBACK DEMONSTRATION.sql -> SQL script to demonstrate ROLLBACK.

TASK 4 - Queries.sql -> Three sample SQL queries (Task 4).

ERD.jpg -> Conceptual Chen ER diagram.

map.jpg -> Map of ER Model to Relational Schema

⚙️ Installation & Setup Instructions
Open SSMS (SQL Server Management Studio) and log in as sa (system administrator).

Use your own local sa password (not provided here for security).

Run the script:
TASK 3a - DATABSE & TABLE CREATION.sql
This will create the database ESpaceDB, all tables, and populate them with 5 sample rows each.

Run:
TASK 3b - USER CREATION and ROLES.sql
This creates user1 and assign roles.

Run:
TASK 3c - PERMISSIONS.sql
This will sets permissions.

Test rollback with:
TASK 3d - ROLLBACK DEMONSTRATION.sql
Observe DELETE under user1 fails, and rollback under sa restores data.

Run:
TASK 4 - Queries.sql
to execute the 3 sample queries (Task 4).

👥 Users & Roles
sa → System administrator.

Use your own SQL Server sa password when logging in.

Has full control of ESpaceDB with WITH GRANT OPTION.

user1 → Test account created for assignment.
Username: user1

Password: User1Pass!

Permissions: SELECT only (cannot INSERT, UPDATE, or DELETE).

🧪 Demonstrations
Data Control Language (DCL): Permissions enforced with GRANT.

Transaction Control: BEGIN TRAN + DELETE + ROLLBACK shows how unintended changes are reverted.

Queries: 3 multi-table joins demonstrate complex retrievals.

📌 Notes
Minimum 5 sample rows per table included.

All tables normalized to 3NF/BCNF.

Referential integrity enforced with primary & foreign keys.

Repository link submitted in final Doc report as per assignment brief.
