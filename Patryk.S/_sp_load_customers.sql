
CREATE OR ALTER PROCEDURE dbo._sp_load_customers
AS 
BEGIN 

--Author: Patryk Skiba
--Date: 2025-02-23
--Description: Load the data from Transform.Customers into OLAP.DimCustomers
--Changes:	
	-- date / who / comment


---------Declare params / logging

	--Logging Start
	INSERT INTO dbo._tb_transform_data_log ( ProcedureName, ActionType, DateInserted, UserName, ErrorNumber, ErrorState, ErrorSeverity, ErrorLine, ErrorMessage)
	VALUES ('_sp_load_customers', 'START', GETUTCDATE(), SUSER_SNAME(), NULL, NULL, NULL, NULL, NULL)


---------procedure logic
	BEGIN TRY
	   
		MERGE OLAP.DimCustomers TARGET
		USING Transform.Customers SOURCE
			ON (TARGET.CustomerID = SOURCE.CustomerID)
		WHEN NOT MATCHED BY TARGET 
		THEN INSERT ([Index], CustomerID, CustomerName, Company, CountryKey, Phone1, Phone2, Email, EmailDomain, SubscriptionDate)
			VALUES (SOURCE.[Index], SOURCE.CustomerID, SOURCE.CustomerName, SOURCE.Company, SOURCE.CountryKey, SOURCE.Phone1, SOURCE.Phone2, SOURCE.Email, SOURCE.EmailDomain, SOURCE.SubscriptionDate)

		WHEN MATCHED AND 
			HASHBYTES('SHA2_256', CONCAT(TARGET.CustomerName, TARGET.Company, TARGET.CountryKey, TARGET.Phone1, TARGET.Phone2, TARGET.Email, TARGET.EmailDomain, TARGET.SubscriptionDate)) <>
			HASHBYTES('SHA2_256', CONCAT(SOURCE.CustomerName, SOURCE.Company, SOURCE.CountryKey, SOURCE.Phone1, SOURCE.Phone2, SOURCE.Email, SOURCE.EmailDomain, SOURCE.SubscriptionDate))
		THEN UPDATE 
			SET TARGET.CustomerName = SOURCE.CustomerName
			, TARGET.Company = SOURCE.Company
			, TARGET.CountryKey = SOURCE.CountryKey
			, TARGET.Phone1 = SOURCE.Phone1
			, TARGET.Phone2 = SOURCE.Phone2
			, TARGET.Email = SOURCE.Email
			, TARGET.EmailDomain = SOURCE.EmailDomain
			, TARGET.SubscriptionDate = SOURCE.SubscriptionDate
	;


	--Logging End
	INSERT INTO dbo._tb_transform_data_log ( ProcedureName, ActionType, DateInserted, UserName, ErrorNumber, ErrorState, ErrorSeverity, ErrorLine, ErrorMessage)
	VALUES ('_sp_load_customers', 'END', GETUTCDATE(), SUSER_SNAME(), NULL, NULL, NULL, NULL, NULL)

	END TRY
	BEGIN CATCH

	
	--Logging Error
	INSERT INTO dbo._tb_transform_data_log ( ProcedureName, ActionType, DateInserted, UserName, ErrorNumber, ErrorState, ErrorSeverity, ErrorLine, ErrorMessage)
	VALUES ('_sp_load_customers', 'ERROR', GETUTCDATE(), SUSER_SNAME(), ERROR_NUMBER(), ERROR_STATE(), ERROR_SEVERITY(), ERROR_LINE(), ERROR_MESSAGE())

	END CATCH

END;
GO
