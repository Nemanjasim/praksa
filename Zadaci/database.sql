CREATE DATABASE BANK
GO 
USE BANK
GO


if not exists (select * from dbo.sysobjects where id = object_id(N'[Transfers]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
begin
CREATE TABLE [dbo].[Transfers](
	
		TransferId                                        int identity(1,1), --  *Required,  Unique identifier of transfer assigned by bank
		Status                                             varchar(max), --  Transfer status For a list of possible values see [transfer-statuses](payment-classifications.html#transfer-statuses) enumeration. . Possible values for this property include: 'pending', 'scheduled', 'executed', 'rejected', 'canceled'.
		TransferKind                                       varchar(max), --  Type of the transfer For a list of possible values see [transfer-kinds](payment-classifications.html#transfer-kinds) enumeration. . Possible values for this property include: 'balance-transfer', 'credit-transfer', 'cross-border-transfer', 'nonresident-transfer', 'p2p-transfer', 'topup', 'bill-payment'.
		Instruction_CreditorAccount                        nvarchar(MAX), --  *Required,  Creditor account number <from: balance-transfer>
		Instruction_DebtorAccount                          nvarchar(MAX), --  *Required,  Debtor account number <from: balance-transfer>
		Instruction_InstructedAmount_Code                  nvarchar(MAX), --  Code of currency.
		Instruction_InstructedAmount_Amount                decimal(18, 2), --  Amount.
		Instruction_DebtorName                             nvarchar(MAX), --  *Required,  Name of the debtor <from: credit-transfer>
		Instruction_DebtorAddress_AddressLine              nvarchar(MAX), --  *Required,  Address line with street name and number
		Instruction_DebtorAddress_Locality                 nvarchar(MAX), --  *Required,  Populated place such as city, town or village
		Instruction_DebtorAddress_Country                  nvarchar(MAX), --  ISO3166 2 letter code of country. List of countries is maintained by [Reference API](reference-getstarted.html).
		Instruction_CreditorName                           nvarchar(MAX), --  *Required,  Name of the creditor <from: credit-transfer>
		Instruction_CreditorAddress_AddressLine            nvarchar(MAX), --  *Required,  Address line with street name and number
		Instruction_CreditorAddress_Locality               nvarchar(MAX), --  *Required,  Populated place such as city, town or village
		Instruction_CreditorAddress_Country                nvarchar(MAX), --  ISO3166 2 letter code of country. List of countries is maintained by [Reference API](reference-getstarted.html).
		Instruction_PaymentDescription                     nvarchar(MAX), --  *Required,  Payment description. <from: credit-transfer>
		Instruction_PurposeCode                            nvarchar(MAX), --  *Required,  Classification that explains purpose of transfer. List of purpose codes is maintained by [Reference API](reference-getstarted.html).  <from: credit-transfer>
		Instruction_Urgency                                varchar(max), --  *Required,  Urgency of transfer For a list of possible values see [transfer-urgencies](payment-classifications.html#transfer-urgencies) enumeration. . Possible values for this property include: 'ach', 'rtgs'. <from: credit-transfer>
		Instruction_InstrumentCode                         nvarchar(MAX), --  *Required,  Classifcation that explains kinds of instrument used acording to payment operational rules and regulations <from: credit-transfer>
		Instruction_DebtorReference                        nvarchar(MAX), --  Debtor reference such as purchase order <from: credit-transfer>
		Instruction_DebtorReferenceModel                   nvarchar(MAX), --  Optional debtor reference model that specifies check digit algorithm used to verify debtor reference <from: credit-transfer>
		Instruction_CreditorReference                      nvarchar(MAX), --  Creditor reference such as invoice or bill number <from: credit-transfer>
		Instruction_CreditorReferenceModel                 nvarchar(MAX), --  Optional debtor reference model that specifies check digit algorithm used to verify creditor reference <from: credit-transfer>
		Instruction_ValueDate                              datetime, --  *Required,  Date when transfer is expected to be executed <from: credit-transfer>
		
) ON [PRIMARY]


end
GO


if not exists (select * from dbo.sysobjects where id = object_id(N'[Clients]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
begin
CREATE TABLE [dbo].[Clients](
	      
		ClientID                         int identity(1,1), --  *Required,  For a list of possible values see [party-kinds](party-classifications.html#party-kinds) enumeration. . Possible values include: 'individual', 'organization'
		AccountNumber                    nvarchar(MAX),         --  Unique identifier of the party. Also known as customer number.
		AvailableBalance                 float,
		RegisteredName                   nvarchar(MAX)         , --  Legal name under which oganization is established <from: organization>
		AddressLine                      nvarchar(MAX) , --  *Required,  Address line with street name and number
		Locality                         nvarchar(MAX)  --  *Required,  Populated place such as city, town or village
		
) ON [PRIMARY]


end
GO

        
insert into Clients																					 
select '310000000000166180',100000.00,	'TestFirma1',	'TestFirma1 adresa',	'KRUŠEVAC            '   
insert into Clients  
select '310000000000587451',100000.00,	'TestFirma2',	'TestFirma2 adresa',	'BEOGRAD (ZEMUN)     '     
insert into Clients
select '310000000000070344',100000.00,	'TestFirma3',	'TestFirma3 adresa',	'ŠAJKAŠ              '     
insert into Clients
select '310000000000166665',100000.00,	'TestFirma4',	'TestFirma4 adresa',	'BEOGRAD (STARI GRAD)'     
insert into Clients
select '310000000000163852',100000.00,	'TestFirma5',	'TestFirma5 adresa',	'BEOGRAD (ZEMUN)     '     
insert into Clients
select '310000000020062917',100000.00,	'TestFirma6',	'TestFirma6 adresa',	'NOVI SAD            '     
insert into Clients
select '310000000020304544',100000.00,	'TestFirma7',	'TestFirma7 adresa',	'DONJE VIDOVO        '     
insert into Clients
select '310000000020844446',100000.00,	'TestFirma8',	'TestFirma8 adresa',	'KOŽETIN             '     
insert into Clients
select '310000000000928988',100000.00,	'TestFirma9',	'TestFirma9 adresa',	'BEOGRAD(N.BG)       '     
insert into Clients
select '310000000015078669',100000.00,	'TestFirma10',	'TestFirma10 adresa',	'SUBOTICA            '    
insert into Clients 
select '310000000000341847',100000.00,	'TestFirma11',	'TestFirma11 adresa',	'BEOGRAD (RAKOVICA)  '     
insert into Clients
select '310000000000342235',100000.00,	'TestFirma12',	'TestFirma12 adresa',	'KOCELJEVA           '     
insert into Clients
select '310000000000083051',100000.00,	'TestFirma13',	'TestFirma13 adresa',	'BEOGRAD (ÈUKARICA)  '     
insert into Clients
select '310000000000565820',100000.00,	'TestFirma14',	'TestFirma14 adresa',	'SUBOTICA            '     
insert into Clients
select '310000000001166735',100000.00,	'TestFirma15',	'TestFirma15 adresa',	'ZRENJANIN           '     
insert into Clients
select '310000000001168093',100000.00,	'TestFirma16',	'TestFirma16 adresa',	'SEONE               '     
insert into Clients
select '310000000000468335',100000.00,	'TestFirma17',	'TestFirma17 adresa',	'GUÈA (VAROŠICA)     '     
insert into Clients
select '310000000001137441',100000.00,	'TestFirma18',	'TestFirma18 adresa',	'PADINA              '     
insert into Clients
select '310000000001166444',100000.00,	'TestFirma19',	'TestFirma19 adresa',	'ZRENJANIN           '     
insert into Clients
select '310000000001170324',100000.00,	'TestFirma20', 	'TestFirma20 adresa',  	'SURDUK              '     
