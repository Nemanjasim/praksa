

if exists (select * from dbo.sysobjects where id = object_id(N'[CreditTransfers_Validate]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [CreditTransfers_Validate]
go

create PROCEDURE [CreditTransfers_Validate](
		@ValidationStatus                                   bigint   OUTPUT,   --  Validation status: 0-FALSE  1-SUCCESS 
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

 set @ValidationStatus = 1
    if object_id('tempdb.#ValidationProblem')is null 
	begin
		 create table #ValidationProblem
		 (
			Tag nvarchar(max),
			Error nvarchar(max),
			Message nvarchar(max)
		)
     end

if @Instruction_InstructedAmount_Amount<=0
begin
 insert into #ValidationProblem
 select 'InstructedAmount-Amount',123,'iznos mora biti veci od nule'
end

 if exists (select 1 from #ValidationProblem)
 begin
  set @ValidationStatus = 0
       select 
			Tag,
			Error,
			Message
		from #ValidationProblem
 end
		

END 


