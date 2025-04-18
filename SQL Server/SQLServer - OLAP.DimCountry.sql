USE Interview
GO

----------------------------------
----- Country ISO-3166 codes -----
----------------------------------

DROP TABLE IF EXISTS OLAP.DimCountry
GO

CREATE TABLE OLAP.DimCountry
(	CountryKey INT NOT NULL IDENTITY(1, 1)
,	CountryCode CHAR(2) NOT NULL			-- Two-letter country code (ISO 3166-1 alpha-2)
,	CountryName VARCHAR(255) NOT NULL		-- English country name
,	ISO3 CHAR(3) NOT NULL					-- Three-letter country code (ISO 3166-1 alpha-3)
,	CountryNumber CHAR(3) NOT NULL			-- Three-digit country number (ISO 3166-1 numeric)
,	CountryFullName VARCHAR(255) NOT NULL	-- Full English country name
,	CONSTRAINT PK_DimCountryCode PRIMARY KEY (CountryKey)
)
GO

SET IDENTITY_INSERT OLAP.DimCountry ON;
GO

INSERT INTO OLAP.DimCountry (CountryKey, CountryCode, CountryName, ISO3, CountryNumber, CountryFullName)
VALUES (-1, 'UN', 'Unknown', 'UNK', '000', 'Unknown')
GO

SET IDENTITY_INSERT OLAP.DimCountry OFF;
GO

INSERT INTO OLAP.DimCountry
(
	CountryCode
,	CountryName
,	ISO3
,	CountryNumber
,	CountryFullName
)
VALUES
	('AF', 'Afghanistan', 'AFG', '004', 'Islamic Republic of Afghanistan')
,	('AX', '�land Islands', 'ALA', '248', '�land Islands')
,	('AL', 'Albania', 'ALB', '008', 'Republic of Albania')
,	('DZ', 'Algeria', 'DZA', '012', 'People''s Democratic Republic of Algeria')
,	('AS', 'American Samoa', 'ASM', '016', 'American Samoa')
,	('AD', 'Andorra', 'AND', '020', 'Principality of Andorra')
,	('AO', 'Angola', 'AGO', '024', 'Republic of Angola')
,	('AI', 'Anguilla', 'AIA', '660', 'Anguilla')
,	('AQ', 'Antarctica', 'ATA', '010', 'Antarctica (the territory South of 60 deg S)')
,	('AG', 'Antigua and Barbuda', 'ATG', '028', 'Antigua and Barbuda')
,	('AR', 'Argentina', 'ARG', '032', 'Argentine Republic')
,	('AM', 'Armenia', 'ARM', '051', 'Republic of Armenia')
,	('AW', 'Aruba', 'ABW', '533', 'Aruba')
,	('AU', 'Australia', 'AUS', '036', 'Commonwealth of Australia')
,	('AT', 'Austria', 'AUT', '040', 'Republic of Austria')
,	('AZ', 'Azerbaijan', 'AZE', '031', 'Republic of Azerbaijan')
,	('BS', 'Bahamas', 'BHS', '044', 'Commonwealth of the Bahamas')
,	('BH', 'Bahrain', 'BHR', '048', 'Kingdom of Bahrain')
,	('BD', 'Bangladesh', 'BGD', '050', 'People''s Republic of Bangladesh')
,	('BB', 'Barbados', 'BRB', '052', 'Barbados')
,	('BY', 'Belarus', 'BLR', '112', 'Republic of Belarus')
,	('BE', 'Belgium', 'BEL', '056', 'Kingdom of Belgium')
,	('BZ', 'Belize', 'BLZ', '084', 'Belize')
,	('BJ', 'Benin', 'BEN', '204', 'Republic of Benin')
,	('BM', 'Bermuda', 'BMU', '060', 'Bermuda')
,	('BT', 'Bhutan', 'BTN', '064', 'Kingdom of Bhutan')
,	('BO', 'Bolivia', 'BOL', '068', 'Plurinational State of Bolivia')
,	('BQ', 'Bonaire, Sint Eustatius and Saba', 'BES', '535', 'Bonaire, Sint Eustatius and Saba')
,	('BA', 'Bosnia and Herzegovina', 'BIH', '070', 'Bosnia and Herzegovina')
,	('BW', 'Botswana', 'BWA', '072', 'Republic of Botswana')
,	('BV', 'Bouvet Island (Bouvet�ya)', 'BVT', '074', 'Bouvet Island (Bouvet�ya)')
,	('BR', 'Brazil', 'BRA', '076', 'Federative Republic of Brazil')
,	('IO', 'British Indian Ocean Territory (Chagos Archipelago)', 'IOT', '086', 'British Indian Ocean Territory (Chagos Archipelago)')
,	('VG', 'British Virgin Islands', 'VGB', '092', 'British Virgin Islands')
,	('BN', 'Brunei Darussalam', 'BRN', '096', 'Brunei Darussalam')
,	('BG', 'Bulgaria', 'BGR', '100', 'Republic of Bulgaria')
,	('BF', 'Burkina Faso', 'BFA', '854', 'Burkina Faso')
,	('BI', 'Burundi', 'BDI', '108', 'Republic of Burundi')
,	('KH', 'Cambodia', 'KHM', '116', 'Kingdom of Cambodia')
,	('CM', 'Cameroon', 'CMR', '120', 'Republic of Cameroon')
,	('CA', 'Canada', 'CAN', '124', 'Canada')
,	('CV', 'Cabo Verde', 'CPV', '132', 'Republic of Cabo Verde')
,	('KY', 'Cayman Islands', 'CYM', '136', 'Cayman Islands')
,	('CF', 'Central African Republic', 'CAF', '140', 'Central African Republic')
,	('TD', 'Chad', 'TCD', '148', 'Republic of Chad')
,	('CL', 'Chile', 'CHL', '152', 'Republic of Chile')
,	('CN', 'China', 'CHN', '156', 'People''s Republic of China')
,	('CX', 'Christmas Island', 'CXR', '162', 'Christmas Island')
,	('CC', 'Cocos (Keeling) Islands', 'CCK', '166', 'Cocos (Keeling) Islands')
,	('CO', 'Colombia', 'COL', '170', 'Republic of Colombia')
,	('KM', 'Comoros', 'COM', '174', 'Union of the Comoros')
,	('CD', 'Congo', 'COD', '180', 'Democratic Republic of the Congo')
,	('CG', 'Congo', 'COG', '178', 'Republic of the Congo')
,	('CK', 'Cook Islands', 'COK', '184', 'Cook Islands')
,	('CR', 'Costa Rica', 'CRI', '188', 'Republic of Costa Rica')
,	('CI', 'Cote d''Ivoire', 'CIV', '384', 'Republic of Cote d''Ivoire')
,	('HR', 'Croatia', 'HRV', '191', 'Republic of Croatia')
,	('CU', 'Cuba', 'CUB', '192', 'Republic of Cuba')
,	('CW', 'Cura�ao', 'CUW', '531', 'Cura�ao')
,	('CY', 'Cyprus', 'CYP', '196', 'Republic of Cyprus')
,	('CZ', 'Czechia', 'CZE', '203', 'Czech Republic')
,	('DK', 'Denmark', 'DNK', '208', 'Kingdom of Denmark')
,	('DJ', 'Djibouti', 'DJI', '262', 'Republic of Djibouti')
,	('DM', 'Dominica', 'DMA', '212', 'Commonwealth of Dominica')
,	('DO', 'Dominican Republic', 'DOM', '214', 'Dominican Republic')
,	('EC', 'Ecuador', 'ECU', '218', 'Republic of Ecuador')
,	('EG', 'Egypt', 'EGY', '818', 'Arab Republic of Egypt')
,	('SV', 'El Salvador', 'SLV', '222', 'Republic of El Salvador')
,	('GQ', 'Equatorial Guinea', 'GNQ', '226', 'Republic of Equatorial Guinea')
,	('ER', 'Eritrea', 'ERI', '232', 'State of Eritrea')
,	('EE', 'Estonia', 'EST', '233', 'Republic of Estonia')
,	('ET', 'Ethiopia', 'ETH', '231', 'Federal Democratic Republic of Ethiopia')
,	('FO', 'Faroe Islands', 'FRO', '234', 'Faroe Islands')
,	('FK', 'Falkland Islands (Malvinas)', 'FLK', '238', 'Falkland Islands (Malvinas)')
,	('FJ', 'Fiji', 'FJI', '242', 'Republic of Fiji')
,	('FI', 'Finland', 'FIN', '246', 'Republic of Finland')
,	('FR', 'France', 'FRA', '250', 'French Republic')
,	('GF', 'French Guiana', 'GUF', '254', 'French Guiana')
,	('PF', 'French Polynesia', 'PYF', '258', 'French Polynesia')
,	('TF', 'French Southern Territories', 'ATF', '260', 'French Southern Territories')
,	('GA', 'Gabon', 'GAB', '266', 'Gabonese Republic')
,	('GM', 'Gambia', 'GMB', '270', 'Republic of the Gambia')
,	('GE', 'Georgia', 'GEO', '268', 'Georgia')
,	('DE', 'Germany', 'DEU', '276', 'Federal Republic of Germany')
,	('GH', 'Ghana', 'GHA', '288', 'Republic of Ghana')
,	('GI', 'Gibraltar', 'GIB', '292', 'Gibraltar')
,	('GR', 'Greece', 'GRC', '300', 'Hellenic Republic of Greece')
,	('GL', 'Greenland', 'GRL', '304', 'Greenland')
,	('GD', 'Grenada', 'GRD', '308', 'Grenada')
,	('GP', 'Guadeloupe', 'GLP', '312', 'Guadeloupe')
,	('GU', 'Guam', 'GUM', '316', 'Guam')
,	('GT', 'Guatemala', 'GTM', '320', 'Republic of Guatemala')
,	('GG', 'Guernsey', 'GGY', '831', 'Bailiwick of Guernsey')
,	('GN', 'Guinea', 'GIN', '324', 'Republic of Guinea')
,	('GW', 'Guinea-Bissau', 'GNB', '624', 'Republic of Guinea-Bissau')
,	('GY', 'Guyana', 'GUY', '328', 'Co-operative Republic of Guyana')
,	('HT', 'Haiti', 'HTI', '332', 'Republic of Haiti')
,	('HM', 'Heard Island and McDonald Islands', 'HMD', '334', 'Heard Island and McDonald Islands')
,	('VA', 'Holy See (Vatican City State)', 'VAT', '336', 'Holy See (Vatican City State)')
,	('HN', 'Honduras', 'HND', '340', 'Republic of Honduras')
,	('HK', 'Hong Kong', 'HKG', '344', 'Hong Kong Special Administrative Region of China')
,	('HU', 'Hungary', 'HUN', '348', 'Hungary')
,	('IS', 'Iceland', 'ISL', '352', 'Iceland')
,	('IN', 'India', 'IND', '356', 'Republic of India')
,	('ID', 'Indonesia', 'IDN', '360', 'Republic of Indonesia')
,	('IR', 'Iran', 'IRN', '364', 'Islamic Republic of Iran')
,	('IQ', 'Iraq', 'IRQ', '368', 'Republic of Iraq')
,	('IE', 'Ireland', 'IRL', '372', 'Ireland')
,	('IM', 'Isle of Man', 'IMN', '833', 'Isle of Man')
,	('IL', 'Israel', 'ISR', '376', 'State of Israel')
,	('IT', 'Italy', 'ITA', '380', 'Republic of Italy')
,	('JM', 'Jamaica', 'JAM', '388', 'Jamaica')
,	('JP', 'Japan', 'JPN', '392', 'Japan')
,	('JE', 'Jersey', 'JEY', '832', 'Bailiwick of Jersey')
,	('JO', 'Jordan', 'JOR', '400', 'Hashemite Kingdom of Jordan')
,	('KZ', 'Kazakhstan', 'KAZ', '398', 'Republic of Kazakhstan')
,	('KE', 'Kenya', 'KEN', '404', 'Republic of Kenya')
,	('KI', 'Kiribati', 'KIR', '296', 'Republic of Kiribati')
,	('KP', 'Korea', 'PRK', '408', 'Democratic People''s Republic of Korea')
,	('KR', 'Korea', 'KOR', '410', 'Republic of Korea')
,	('KW', 'Kuwait', 'KWT', '414', 'State of Kuwait')
,	('KG', 'Kyrgyz Republic', 'KGZ', '417', 'Kyrgyz Republic')
,	('LA', 'Lao People''s Democratic Republic', 'LAO', '418', 'Lao People''s Democratic Republic')
,	('LV', 'Latvia', 'LVA', '428', 'Republic of Latvia')
,	('LB', 'Lebanon', 'LBN', '422', 'Lebanese Republic')
,	('LS', 'Lesotho', 'LSO', '426', 'Kingdom of Lesotho')
,	('LR', 'Liberia', 'LBR', '430', 'Republic of Liberia')
,	('LY', 'Libya', 'LBY', '434', 'State of Libya')
,	('LI', 'Liechtenstein', 'LIE', '438', 'Principality of Liechtenstein')
,	('LT', 'Lithuania', 'LTU', '440', 'Republic of Lithuania')
,	('LU', 'Luxembourg', 'LUX', '442', 'Grand Duchy of Luxembourg')
,	('MO', 'Macao', 'MAC', '446', 'Macao Special Administrative Region of China')
,	('MG', 'Madagascar', 'MDG', '450', 'Republic of Madagascar')
,	('MW', 'Malawi', 'MWI', '454', 'Republic of Malawi')
,	('MY', 'Malaysia', 'MYS', '458', 'Malaysia')
,	('MV', 'Maldives', 'MDV', '462', 'Republic of Maldives')
,	('ML', 'Mali', 'MLI', '466', 'Republic of Mali')
,	('MT', 'Malta', 'MLT', '470', 'Republic of Malta')
,	('MH', 'Marshall Islands', 'MHL', '584', 'Republic of the Marshall Islands')
,	('MQ', 'Martinique', 'MTQ', '474', 'Martinique')
,	('MR', 'Mauritania', 'MRT', '478', 'Islamic Republic of Mauritania')
,	('MU', 'Mauritius', 'MUS', '480', 'Republic of Mauritius')
,	('YT', 'Mayotte', 'MYT', '175', 'Mayotte')
,	('MX', 'Mexico', 'MEX', '484', 'United Mexican States')
,	('FM', 'Micronesia', 'FSM', '583', 'Federated States of Micronesia')
,	('MD', 'Moldova', 'MDA', '498', 'Republic of Moldova')
,	('MC', 'Monaco', 'MCO', '492', 'Principality of Monaco')
,	('MN', 'Mongolia', 'MNG', '496', 'Mongolia')
,	('ME', 'Montenegro', 'MNE', '499', 'Montenegro')
,	('MS', 'Montserrat', 'MSR', '500', 'Montserrat')
,	('MA', 'Morocco', 'MAR', '504', 'Kingdom of Morocco')
,	('MZ', 'Mozambique', 'MOZ', '508', 'Republic of Mozambique')
,	('MM', 'Myanmar', 'MMR', '104', 'Republic of the Union of Myanmar')
,	('NA', 'Namibia', 'NAM', '516', 'Republic of Namibia')
,	('NR', 'Nauru', 'NRU', '520', 'Republic of Nauru')
,	('NP', 'Nepal', 'NPL', '524', 'Nepal')
,	('NL', 'Netherlands', 'NLD', '528', 'Kingdom of the Netherlands')
,	('NC', 'New Caledonia', 'NCL', '540', 'New Caledonia')
,	('NZ', 'New Zealand', 'NZL', '554', 'New Zealand')
,	('NI', 'Nicaragua', 'NIC', '558', 'Republic of Nicaragua')
,	('NE', 'Niger', 'NER', '562', 'Republic of Niger')
,	('NG', 'Nigeria', 'NGA', '566', 'Federal Republic of Nigeria')
,	('NU', 'Niue', 'NIU', '570', 'Niue')
,	('NF', 'Norfolk Island', 'NFK', '574', 'Norfolk Island')
,	('MK', 'North Macedonia', 'MKD', '807', 'Republic of North Macedonia')
,	('MP', 'Northern Mariana Islands', 'MNP', '580', 'Commonwealth of the Northern Mariana Islands')
,	('NO', 'Norway', 'NOR', '578', 'Kingdom of Norway')
,	('OM', 'Oman', 'OMN', '512', 'Sultanate of Oman')
,	('PK', 'Pakistan', 'PAK', '586', 'Islamic Republic of Pakistan')
,	('PW', 'Palau', 'PLW', '585', 'Republic of Palau')
,	('PS', 'Palestine', 'PSE', '275', 'State of Palestine')
,	('PA', 'Panama', 'PAN', '591', 'Republic of Panama')
,	('PG', 'Papua New Guinea', 'PNG', '598', 'Independent State of Papua New Guinea')
,	('PY', 'Paraguay', 'PRY', '600', 'Republic of Paraguay')
,	('PE', 'Peru', 'PER', '604', 'Republic of Peru')
,	('PH', 'Philippines', 'PHL', '608', 'Republic of the Philippines')
,	('PN', 'Pitcairn Islands', 'PCN', '612', 'Pitcairn Islands')
,	('PL', 'Poland', 'POL', '616', 'Republic of Poland')
,	('PT', 'Portugal', 'PRT', '620', 'Portuguese Republic')
,	('PR', 'Puerto Rico', 'PRI', '630', 'Commonwealth of Puerto Rico')
,	('QA', 'Qatar', 'QAT', '634', 'State of Qatar')
,	('RE', 'R�union', 'REU', '638', 'R�union')
,	('RO', 'Romania', 'ROU', '642', 'Romania')
,	('RU', 'Russian Federation', 'RUS', '643', 'Russian Federation')
,	('RW', 'Rwanda', 'RWA', '646', 'Republic of Rwanda')
,	('BL', 'Saint Barth�lemy', 'BLM', '652', 'Saint Barth�lemy')
,	('SH', 'Saint Helena, Ascension and Tristan da Cunha', 'SHN', '654', 'Saint Helena, Ascension and Tristan da Cunha')
,	('KN', 'Saint Kitts and Nevis', 'KNA', '659', 'Federation of Saint Kitts and Nevis')
,	('LC', 'Saint Lucia', 'LCA', '662', 'Saint Lucia')
,	('MF', 'Saint Martin', 'MAF', '663', 'Saint Martin (French part)')
,	('PM', 'Saint Pierre and Miquelon', 'SPM', '666', 'Saint Pierre and Miquelon')
,	('VC', 'Saint Vincent and the Grenadines', 'VCT', '670', 'Saint Vincent and the Grenadines')
,	('WS', 'Samoa', 'WSM', '882', 'Independent State of Samoa')
,	('SM', 'San Marino', 'SMR', '674', 'Republic of San Marino')
,	('ST', 'Sao Tome and Principe', 'STP', '678', 'Democratic Republic of Sao Tome and Principe')
,	('SA', 'Saudi Arabia', 'SAU', '682', 'Kingdom of Saudi Arabia')
,	('SN', 'Senegal', 'SEN', '686', 'Republic of Senegal')
,	('RS', 'Serbia', 'SRB', '688', 'Republic of Serbia')
,	('SC', 'Seychelles', 'SYC', '690', 'Republic of Seychelles')
,	('SL', 'Sierra Leone', 'SLE', '694', 'Republic of Sierra Leone')
,	('SG', 'Singapore', 'SGP', '702', 'Republic of Singapore')
,	('SX', 'Sint Maarten (Dutch part)', 'SXM', '534', 'Sint Maarten (Dutch part)')
,	('SK', 'Slovakia (Slovak Republic)', 'SVK', '703', 'Slovakia (Slovak Republic)')
,	('SI', 'Slovenia', 'SVN', '705', 'Republic of Slovenia')
,	('SB', 'Solomon Islands', 'SLB', '090', 'Solomon Islands')
,	('SO', 'Somalia', 'SOM', '706', 'Federal Republic of Somalia')
,	('ZA', 'South Africa', 'ZAF', '710', 'Republic of South Africa')
,	('GS', 'South Georgia and the South Sandwich Islands', 'SGS', '239', 'South Georgia and the South Sandwich Islands')
,	('SS', 'South Sudan', 'SSD', '728', 'Republic of South Sudan')
,	('ES', 'Spain', 'ESP', '724', 'Kingdom of Spain')
,	('LK', 'Sri Lanka', 'LKA', '144', 'Democratic Socialist Republic of Sri Lanka')
,	('SD', 'Sudan', 'SDN', '729', 'Republic of Sudan')
,	('SR', 'Suriname', 'SUR', '740', 'Republic of Suriname')
,	('SJ', 'Svalbard & Jan Mayen Islands', 'SJM', '744', 'Svalbard & Jan Mayen Islands')
,	('SZ', 'Eswatini', 'SWZ', '748', 'Kingdom of Eswatini')
,	('SE', 'Sweden', 'SWE', '752', 'Kingdom of Sweden')
,	('CH', 'Switzerland', 'CHE', '756', 'Swiss Confederation')
,	('SY', 'Syrian Arab Republic', 'SYR', '760', 'Syrian Arab Republic')
,	('TW', 'Taiwan', 'TWN', '158', 'Taiwan, Province of China')
,	('TJ', 'Tajikistan', 'TJK', '762', 'Republic of Tajikistan')
,	('TZ', 'Tanzania', 'TZA', '834', 'United Republic of Tanzania')
,	('TH', 'Thailand', 'THA', '764', 'Kingdom of Thailand')
,	('TL', 'Timor-Leste', 'TLS', '626', 'Democratic Republic of Timor-Leste')
,	('TG', 'Togo', 'TGO', '768', 'Togolese Republic')
,	('TK', 'Tokelau', 'TKL', '772', 'Tokelau')
,	('TO', 'Tonga', 'TON', '776', 'Kingdom of Tonga')
,	('TT', 'Trinidad and Tobago', 'TTO', '780', 'Republic of Trinidad and Tobago')
,	('TN', 'Tunisia', 'TUN', '788', 'Tunisian Republic')
,	('TR', 'T�rkiye', 'TUR', '792', 'Republic of T�rkiye')
,	('TM', 'Turkmenistan', 'TKM', '795', 'Turkmenistan')
,	('TC', 'Turks and Caicos Islands', 'TCA', '796', 'Turks and Caicos Islands')
,	('TV', 'Tuvalu', 'TUV', '798', 'Tuvalu')
,	('UG', 'Uganda', 'UGA', '800', 'Republic of Uganda')
,	('UA', 'Ukraine', 'UKR', '804', 'Ukraine')
,	('AE', 'United Arab Emirates', 'ARE', '784', 'United Arab Emirates')
,	('GB', 'United Kingdom of Great Britain and Northern Ireland', 'GBR', '826', 'United Kingdom of Great Britain & Northern Ireland')
,	('US', 'United States of America', 'USA', '840', 'United States of America')
,	('UM', 'United States Minor Outlying Islands', 'UMI', '581', 'United States Minor Outlying Islands')
,	('VI', 'United States Virgin Islands', 'VIR', '850', 'United States Virgin Islands')
,	('UY', 'Uruguay', 'URY', '858', 'Eastern Republic of Uruguay')
,	('UZ', 'Uzbekistan', 'UZB', '860', 'Republic of Uzbekistan')
,	('VU', 'Vanuatu', 'VUT', '548', 'Republic of Vanuatu')
,	('VE', 'Venezuela', 'VEN', '862', 'Bolivarian Republic of Venezuela')
,	('VN', 'Vietnam', 'VNM', '704', 'Socialist Republic of Vietnam')
,	('WF', 'Wallis and Futuna', 'WLF', '876', 'Wallis and Futuna')
,	('EH', 'Western Sahara', 'ESH', '732', 'Western Sahara')
,	('YE', 'Yemen', 'YEM', '887', 'Yemen')
,	('ZM', 'Zambia', 'ZMB', '894', 'Republic of Zambia')
,	('ZW', 'Zimbabwe', 'ZWE', '716', 'Republic of Zimbabwe')
GO

SELECT * FROM OLAP.DimCountry