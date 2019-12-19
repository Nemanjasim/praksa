 if exists (select * from dbo.sysobjects where id = object_id(N'[Transfers_GetList]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [Transfers_GetList]
go

	CREATE PROCEDURE [Transfers_GetList](
	    @TransferId                                         nvarchar(MAX)=null,   
		@TransferKind                                       varchar(max) =null, 
		@Instruction_CreditorAccount                        nvarchar(MAX)=null,
		@Instruction_DebtorAccount                          nvarchar(MAX)=null,
		@Instruction_InstructedAmount_AmountFrom                float        =null,
        @Instruction_InstructedAmount_AmountTo                float        =null,
		@Instruction_DebtorName                             nvarchar(MAX)=null,
		@Instruction_DebtorAddress_AddressLine              nvarchar(MAX)=null,
		@Instruction_DebtorAddress_Locality                 nvarchar(MAX)=null,
		@Instruction_DebtorAddress_Country                  nvarchar(MAX)=null,
		@Instruction_CreditorName                           nvarchar(MAX)=null,
		@Instruction_CreditorAddress_AddressLine            nvarchar(MAX)=null,
		@Instruction_CreditorAddress_Locality               nvarchar(MAX)=null,
		@Instruction_CreditorAddress_Country                nvarchar(MAX)=null,
		@Instruction_PaymentDescription                     nvarchar(MAX)=null,
		@Instruction_PurposeCode                            nvarchar(MAX)=null,
		@Instruction_Urgency                                varchar(max) =null, 
		@Instruction_InstrumentCode                         nvarchar(MAX)=null,
		@Instruction_DebtorReference                        nvarchar(MAX)=null,
		@Instruction_DebtorReferenceModel                   nvarchar(MAX)=null,
		@Instruction_CreditorReference                      nvarchar(MAX)=null,
		@Instruction_CreditorReferenceModel                 nvarchar(MAX)=null,
		@Instruction_ValueDateFrom                              datetime     =null,
		@Instruction_ValueDateTo                              datetime     =null
         ) AS                           
	BEGIN

    if object_id('tempdb.#Transfers')is null 
	begin
	   select 
	        
			Status								   ,
			TransferKind						   ,
			Instruction_CreditorAccount			   ,
			Instruction_DebtorAccount			   ,
			Instruction_InstructedAmount_Code	   ,
			Instruction_InstructedAmount_Amount	   ,
			Instruction_DebtorName				   ,
			Instruction_DebtorAddress_AddressLine  ,
			Instruction_DebtorAddress_Locality	   ,
			Instruction_DebtorAddress_Country	   ,
			Instruction_CreditorName			   ,
			Instruction_CreditorAddress_AddressLine,
			Instruction_CreditorAddress_Locality   ,
			Instruction_CreditorAddress_Country	   ,
			Instruction_PaymentDescription		   ,
			Instruction_PurposeCode				   ,
			Instruction_Urgency					   ,
			Instruction_InstrumentCode			   ,
			Instruction_DebtorReference			   ,
			Instruction_DebtorReferenceModel	   ,
			Instruction_CreditorReference		   ,
			Instruction_CreditorReferenceModel	   ,
			Instruction_ValueDate
	   into #Transfers
	   from Transfers
	   where 1>1
	end
    
--ovaj deo ispod prebaciti u dinamicki sql upit kako bi mogli da dodate pretragu po ulaznim parametrima
-------------------------------------------------------------------------------------------------------
   insert into #Transfers
   select 
   			Status								   ,
			TransferKind						   ,
			Instruction_CreditorAccount			   ,
			Instruction_DebtorAccount			   ,
			Instruction_InstructedAmount_Code	   ,
			Instruction_InstructedAmount_Amount	   ,
			Instruction_DebtorName				   ,
			Instruction_DebtorAddress_AddressLine  ,
			Instruction_DebtorAddress_Locality	   ,
			Instruction_DebtorAddress_Country	   ,
			Instruction_CreditorName			   ,
			Instruction_CreditorAddress_AddressLine,
			Instruction_CreditorAddress_Locality   ,
			Instruction_CreditorAddress_Country	   ,
			Instruction_PaymentDescription		   ,
			Instruction_PurposeCode				   ,
			Instruction_Urgency					   ,
			Instruction_InstrumentCode			   ,
			Instruction_DebtorReference			   ,
			Instruction_DebtorReferenceModel	   ,
			Instruction_CreditorReference		   ,
			Instruction_CreditorReferenceModel	   ,
			Instruction_ValueDate
   from Transfers
  -----------------------------------------------------------------------------------
   
   
   select * from #Transfers



END 
GO