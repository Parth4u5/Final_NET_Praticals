USE master;
GO

IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'PlacementDB')
BEGIN
    CREATE DATABASE PlacementDB;
END
GO

USE PlacementDB;
GO

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name = 'Students' AND xtype = 'U')
BEGIN
    CREATE TABLE Students
    (
        StudentId     INT            NOT NULL PRIMARY KEY,
        StudentName   NVARCHAR(100)  NOT NULL,
        Department    NVARCHAR(100)  NOT NULL,
        CGPA          DECIMAL(4, 2)  NOT NULL,
        IsPlaced      BIT            NOT NULL DEFAULT 0
    );

    INSERT INTO Students (StudentId, StudentName, Department, CGPA, IsPlaced) VALUES
    (1, 'Aarav Shah',  'Computer Engineering',               8.70, 1),
    (2, 'Diya Patel',  'Information Technology',             9.10, 1),
    (3, 'Rohan Mehta', 'Mechanical Engineering',             7.40, 0),
    (4, 'Ananya Iyer', 'Electronics & Telecommunication',    8.20, 1),
    (5, 'Kabir Singh', 'Civil Engineering',                  7.90, 0),
    (6, 'Meera Nair',  'Computer Engineering',               8.90, 1);
END
GO

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name = 'Placements' AND xtype = 'U')
BEGIN
    CREATE TABLE Placements
    (
        PlacementId  INT            IDENTITY(1, 1) PRIMARY KEY,
        StudentId    INT            NOT NULL,
        CompanyName  NVARCHAR(100)  NOT NULL,
        JobRole      NVARCHAR(100)  NOT NULL,
        PackageLPA   DECIMAL(5, 2)  NOT NULL,
        CONSTRAINT FK_Placements_Students FOREIGN KEY (StudentId) REFERENCES Students (StudentId)
    );

    INSERT INTO Placements (StudentId, CompanyName, JobRole, PackageLPA) VALUES
    (1, 'TCS',        'Software Engineer',           7.50),
    (2, 'Infosys',    'Systems Engineer',            9.00),
    (4, 'Wipro',      'Project Engineer',            6.50),
    (6, 'Accenture',  'Associate Software Engineer', 8.25);
END
GO
