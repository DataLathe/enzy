-- Create the main object table
CREATE TABLE
    object028 (
        id VARCHAR(50) PRIMARY KEY,
        companyId INT NOT NULL
    );

-- Create date table
CREATE TABLE
    object028_date000 (
        id INT AUTO_INCREMENT PRIMARY KEY,
        companyId INT NOT NULL,
        objectId VARCHAR(50) NOT NULL,
        dateValue DATE,
    );

-- Create text tables for different fields
CREATE TABLE
    object028_text009 (
        id INT AUTO_INCREMENT PRIMARY KEY,
        companyId INT NOT NULL,
        objectId VARCHAR(50) NOT NULL,
        value VARCHAR(255),
    );

CREATE TABLE
    object028_text010 (
        id INT AUTO_INCREMENT PRIMARY KEY,
        companyId INT NOT NULL,
        objectId VARCHAR(50) NOT NULL,
        value VARCHAR(255),
    );

CREATE TABLE
    object028_text011 (
        id INT AUTO_INCREMENT PRIMARY KEY,
        companyId INT NOT NULL,
        objectId VARCHAR(50) NOT NULL,
        value VARCHAR(255),
    );

CREATE TABLE
    object028_text013 (
        id INT AUTO_INCREMENT PRIMARY KEY,
        companyId INT NOT NULL,
        objectId VARCHAR(50) NOT NULL,
        value VARCHAR(255),
    );

CREATE TABLE
    object028_text014 (
        id INT AUTO_INCREMENT PRIMARY KEY,
        companyId INT NOT NULL,
        objectId VARCHAR(50) NOT NULL,
        value VARCHAR(255),
    );

CREATE TABLE
    object028_text015 (
        id INT AUTO_INCREMENT PRIMARY KEY,
        companyId INT NOT NULL,
        objectId VARCHAR(50) NOT NULL,
        value VARCHAR(255),
    );

-- Create indexes for better performance
CREATE INDEX idx_object028_companyid ON object028 (companyId);

CREATE INDEX idx_object028_date000_companyid ON object028_date000 (companyId);

CREATE INDEX idx_object028_text009_companyid ON object028_text009 (companyId);

CREATE INDEX idx_object028_text010_companyid ON object028_text010 (companyId);

CREATE INDEX idx_object028_text011_companyid ON object028_text011 (companyId);

CREATE INDEX idx_object028_text013_companyid ON object028_text013 (companyId);

CREATE INDEX idx_object028_text014_companyid ON object028_text014 (companyId);

CREATE INDEX idx_object028_text015_companyid ON object028_text015 (companyId);