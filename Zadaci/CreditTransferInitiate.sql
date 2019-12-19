 if exists (select * from dbo.sysobjects where id = object_id(N'CreditTransfers_Initiate') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [CreditTransfers_Initiate]
go

	CREATE PROCEDURE [CreditTransfers_Initiate](
	    @Identifier                                         nvarchar(MAX)   OUTPUT,   
		@TransferKind                                       varchar(max), 
		@Instruction_CreditorAccount                        nvarchar(MAX),
		@Instruction_DebtorAccount                          nvarchar(MAX),
		@Instruction_InstructedAmount_Code                  nvarchar(MAX),
		@Instruction_InstructedAmount_Amount                float,        
		@Instruction_DebtorName                             nvarchar(MAX),
		@Instruction_DebtorAddress_AddressLine              nvarchar(MAX),
		@Instruction_DebtorAddress_Locality                 nvarchar(MAX),
		@Instruction_DebtorAddress_Country                  nvarchar(MAX),
		@Instruction_CreditorName                           nvarchar(MAX),
		@Instruction_CreditorAddress_AddressLine            nvarchar(MAX),
		@Instruction_CreditorAddress_Locality               nvarchar(MAX),
		@Instruction_CreditorAddress_Country                nvarchar(MAX),
		@Instruction_PaymentDescription                     nvarchar(MAX),
		@Instruction_PurposeCode                            nvarchar(MAX),
		@Instruction_Urgency                                varchar(max), 
		@Instruction_InstrumentCode                         nvarchar(MAX),
		@Instruction_DebtorReference                        nvarchar(MAX),
		@Instruction_DebtorReferenceModel                   nvarchar(MAX),
		@Instruction_CreditorReference                      nvarchar(MAX),
		@Instruction_CreditorReferenceModel                 nvarchar(MAX),
		@Instruction_ValueDate                              datetime     
	                                  ) AS 
	BEGIN


   Insert into Transfers
   select 
   'Executed'                               ,     
  'credit-transfer'                            ,  
   @Instruction_CreditorAccount             ,  
   @Instruction_DebtorAccount               ,  
   @Instruction_InstructedAmount_Code       ,  
   @Instruction_InstructedAmount_Amount     ,  
   @Instruction_DebtorName                  ,  
   @Instruction_DebtorAddress_AddressLine   ,  
   @Instruction_DebtorAddress_Locality      ,  
   @Instruction_DebtorAddress_Country       ,  
   @Instruction_CreditorName                ,  
   @Instruction_CreditorAddress_AddressLine ,  
   @Instruction_CreditorAddress_Locality    ,  
   @Instruction_CreditorAddress_Country     ,  
   @Instruction_PaymentDescription          ,  
   @Instruction_PurposeCode                 ,  
   'ICT'                     ,  
   @Instruction_InstrumentCode              ,  
   @Instruction_DebtorReference             ,  
   @Instruction_DebtorReferenceModel        ,  
   @Instruction_CreditorReference           ,  
   @Instruction_CreditorReferenceModel      ,  
   @Instruction_ValueDate                      

		
  set @Identifier=(select max(TransferId) from Transfers)


END 
GO