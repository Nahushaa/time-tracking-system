CREATE DATABASE TimeTrackingSystemdb;

USE TimeTrackingSystemdb;

CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Role ENUM('Admin', 'User') NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE TimeLogs (
    TimeLogID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    TaskDescription TEXT NOT NULL,
    StartTime DATETIME NOT NULL,
    EndTime DATETIME NOT NULL,
    TotalHours DECIMAL(5, 2) GENERATED ALWAYS AS (TIMESTAMPDIFF(MINUTE, StartTime, EndTime) / 60) STORED,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE ProductivityMetrics (
    MetricID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    Date DATE NOT NULL,
    ProductivityScore DECIMAL(5, 2),
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE SystemConfiguration (
    ConfigID INT AUTO_INCREMENT PRIMARY KEY,
    WorkHoursPerDay DECIMAL(4, 2) DEFAULT 8.00,
    BreakTimePerDay DECIMAL(4, 2) DEFAULT 1.00,
    UpdatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Reports (
    ReportID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    ReportName VARCHAR(100),
    GeneratedOn TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ReportData TEXT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

desc Users;
desc TimeLogs;
desc ProductivityMetrics;
desc SystemConfiguration;
desc Reports;
