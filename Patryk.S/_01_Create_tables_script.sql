
--_01_Create_tables_script



IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'Extract')
BEGIN
    EXEC ('CREATE SCHEMA [Extract]')
END
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'Transform')
BEGIN
    EXEC ('CREATE SCHEMA [Transform]')
END
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'OLAP')
BEGIN
    EXEC ('CREATE SCHEMA [OLAP]')
END
GO


DROP TABLE IF EXISTS Extract.Customers
GO
CREATE TABLE Extract.Customers
(	[Index] INT NOT NULL IDENTITY(1,1)
,	CustomerID NVARCHAR(255) NULL
,	FirstName NVARCHAR(255) NULL
,	LastName NVARCHAR(255) NULL
,	Company NVARCHAR(255) NULL
,	City NVARCHAR(255) NULL
,	Country NVARCHAR(255) NULL
,	Phone1 NVARCHAR(255) NULL
,	Phone2 NVARCHAR(255) NULL
,	Email NVARCHAR(255) NULL
,	SubscriptionDate NVARCHAR(255) NULL
,	Website NVARCHAR(255) NULL
)
GO


DROP TABLE IF EXISTS Transform.Customers
GO
CREATE TABLE Transform.Customers
(	[Index] INT NOT NULL
,	CustomerID NVARCHAR(255) NULL
,	CustomerName NVARCHAR(4000) NULL
,	Company NVARCHAR(255) NULL
,	CountryKey INT NULL
,	Phone1 NVARCHAR(255) NULL
,	Phone2 NVARCHAR(255) NULL
,	Email NVARCHAR(255) NULL
,	EmailDomain NVARCHAR(255) NULL
,	SubscriptionDate INT
)
GO


DROP TABLE IF EXISTS OLAP.DimCustomers
GO
CREATE TABLE OLAP.DimCustomers
(	CustomerKey INT NOT NULL IDENTITY(1,1)
,	[Index] INT NOT NULL
,	CustomerID NVARCHAR(255) NULL
,	CustomerName NVARCHAR(4000) NULL
,	Company NVARCHAR(255) NULL
,	CountryKey INT NULL
,	Phone1 NVARCHAR(255) NULL
,	Phone2 NVARCHAR(255) NULL
,	Email NVARCHAR(255) NULL
,	EmailDomain NVARCHAR(255) NULL
,	SubscriptionDate INT
,	CONSTRAINT PK_DimCustomersCustomerKey PRIMARY KEY (CustomerKey)
)
GO


SET IDENTITY_INSERT OLAP.DimCustomers ON;
GO

INSERT INTO OLAP.DimCustomers ([CustomerKey], [Index], CustomerID, CustomerName, Company, CountryKey, Phone1, Phone2, Email, EmailDomain, SubscriptionDate)
VALUES (-1, -1, 'Unknown', 'Unknown', 'Unknown', -1, 'Unknown', 'Unknown', 'Unknown', 'Unknown', -1)
GO

SET IDENTITY_INSERT OLAP.DimCustomers OFF;
GO



---------------------- LOG table

DROP TABLE IF EXISTS dbo._tb_transform_data_log
GO
CREATE TABLE dbo._tb_transform_data_log
(	LogID INT NOT NULL IDENTITY(1,1)
,	ProcedureName	NVARCHAR(510) NULL
,	ActionType		NVARCHAR(20) NULL
,	DateInserted	DATETIME2
,	UserName		VARCHAR(100)
,	ErrorNumber		INT
,	ErrorState		INT
,	ErrorSeverity	INT
,	ErrorLine		INT
,	ErrorMessage	VARCHAR(MAX)
)
GO


