

CREATE OR ALTER PROCEDURE dbo._sp_transform_customers 
AS 
BEGIN 

--Author: Patryk Skiba
--Date: 2025-02-23
--Description: Transforming data from ExtractCustomer to Transform.Customers table
--Changes:	
	-- date / who / comment


---------Declare params / logging

	--Logging Start
	INSERT INTO dbo._tb_transform_data_log ( ProcedureName, ActionType, DateInserted, UserName, ErrorNumber, ErrorState, ErrorSeverity, ErrorLine, ErrorMessage)
	VALUES ('_sp_transform_customers', 'START', GETUTCDATE(), SUSER_SNAME(), NULL, NULL, NULL, NULL, NULL)


---------procedure logic
	BEGIN TRY

	IF EXISTS (SELECT * FROM Extract.Customers)
		BEGIN

		--Clear Transform.Customers
		--This part should be omitted when the data from Extract.Customers is only adding new rows instead of providing the whole set of customers each load.
		TRUNCATE TABLE Transform.Customers


		--Insert data from Extract.Customers to Transform.Customers
		INSERT INTO Transform.Customers([Index], CustomerID, CustomerName, Company, CountryKey, Phone1, Phone2, Email, EmailDomain, SubscriptionDate)
		SELECT 
		[Index]
		, ISNULL(NULLIF(CustomerID,''),'Unknown') AS CustomerID
		, CONCAT(FirstName, ' ', LastName) AS CustomerName		--no need for 'Unknown' because of where condition
		, ISNULL(NULLIF(Company,''),'Unknown') AS Company
		, ISNULL(CountryKey,-1) AS CountryKey
		, ISNULL(NULLIF(CASE WHEN phone1 LIKE '[0-9,+,(]%' THEN Phone1 ELSE 'Unknown' END,''),'Unknown') AS Phone1
		, ISNULL(NULLIF(CASE WHEN Phone2 LIKE '[0-9,+,(]%' THEN Phone2 ELSE 'Unknown' END,''),'Unknown') AS Phone2
		, ISNULL(NULLIF(Email,''),'Unknown') AS Email
		, ISNULL(NULLIF(SUBSTRING(Email, CHARINDEX('@', Email) + 1, LEN(Email) + 1 - CHARINDEX('@', Email)),''),'Unknown') AS EmailDomain
		, ISNULL(NULLIF(TRY_CAST(CONVERT(NVARCHAR,CONVERT(DATE,SubscriptionDate,103),112) AS INT),''),-1) AS SubscriptionDate
		FROM Extract.Customers ec
			LEFT JOIN OLAP.DimCountry odc
				ON ec.Country = odc.CountryName
		WHERE 1=1
		AND NOT (ISNULL(FirstName,'') = '' AND ISNULL(LastName,'') = '')
				

		--Cleanup // When the load is just delta load - this part should be changed to Delete so the Identity column is not duplicated in Transform.Customers
		TRUNCATE TABLE Extract.Customers
		--DELETE FROM Extract.Customers

		END

	--Logging End
	INSERT INTO dbo._tb_transform_data_log ( ProcedureName, ActionType, DateInserted, UserName, ErrorNumber, ErrorState, ErrorSeverity, ErrorLine, ErrorMessage)
	VALUES ('_sp_transform_customers', 'END', GETUTCDATE(), SUSER_SNAME(), NULL, NULL, NULL, NULL, NULL)

	END TRY
	BEGIN CATCH

	
	--Logging Error
	INSERT INTO dbo._tb_transform_data_log ( ProcedureName, ActionType, DateInserted, UserName, ErrorNumber, ErrorState, ErrorSeverity, ErrorLine, ErrorMessage)
	VALUES ('_sp_transform_customers', 'ERROR', GETUTCDATE(), SUSER_SNAME(), ERROR_NUMBER(), ERROR_STATE(), ERROR_SEVERITY(), ERROR_LINE(), ERROR_MESSAGE())

	END CATCH

END;
GO



