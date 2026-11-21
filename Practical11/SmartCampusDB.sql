USE master;
GO

IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'SmartCampusDB')
BEGIN
    CREATE DATABASE SmartCampusDB;
END
GO

USE SmartCampusDB;
GO

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='ServiceRequests' AND xtype='U')
BEGIN
    CREATE TABLE ServiceRequests
    (
        RequestId INT IDENTITY(1,1) PRIMARY KEY,
        StudentName NVARCHAR(100) NOT NULL,
        Department NVARCHAR(100) NOT NULL,
        ServiceType NVARCHAR(50) NOT NULL,
        Description NVARCHAR(500) NOT NULL,
        Priority NVARCHAR(20) NOT NULL DEFAULT 'Medium',
        Status NVARCHAR(20) NOT NULL DEFAULT 'Pending',
        RequestDate DATETIME NOT NULL DEFAULT GETDATE()
    );

    INSERT INTO ServiceRequests
    (StudentName, Department, ServiceType, Description, Priority, Status)
    VALUES
    ('Sneha Joshi', 'Mechanical Engineering', 'Hostel', 'Water purifier on Block C second floor is leaking', 'High', 'Pending'),
    ('Karan Desai', 'Civil Engineering', 'Transport', 'Semester bus pass renewal request', 'Medium', 'Completed'),
    ('Ananya Nair', 'Electrical Engineering', 'Laboratory', 'MATLAB license expired on lab workstation 12', 'Medium', 'In Progress'),
    ('Vikram Rao', 'Mechanical Engineering', 'Maintenance', 'Air conditioner in drawing hall is not cooling', 'Low', 'Pending'),
    ('Ishita Kulkarni', 'Information Technology', 'Library', 'Request to issue reference book on cloud computing', 'High', 'In Progress');
END
GO
