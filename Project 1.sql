/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [firstname]
      ,[lastname]
      ,[phonenumber]
      ,[email]
      ,[alternative_email]
      ,[city]
      ,[state]
      ,[zipcode]
      ,[dateofbirth]
      ,[typeofphone]
  FROM [amina].[dbo].[registration]
  -- types of constraint
  -- not null, primary key, foreign key, check, index, null, default, unique
  --index makes it easy to look up databases or tables in a database
  --single column indexes, unique indexes, clustered index, composite index, non-clustered index
  --you can drop index 
  -- create clustered index IDX_name
  --to add column - use alter table table name ADD column name specify data type add constraint if any 
  create table automobile (
  Type_Of_Car Varchar (5) Not null,
  Zone_Car Char (4) Null,
  Mode_Number Int Not null);
  --To put the index key create nonclustered index put cluster name here eg IX_ModelNumber 
  --ON put table name eg automobile, open bracket put the column name close bracket
  -- Team B work
  --Task one create database Union_Bank
  create database Union_Bank;
  --Task 2 create two schemas Borrower and Loan
  Create schema Borrower
  Create schema Loan
  --Task 3 create 2 tables in Borrower schema - Borrower and Borrower Address
  create table borrower.borrower
  (BorrowerID INT Not null,
  BorrowerFirstName varchar (255) not null,
  BorrowerMiddleInitial Char (1) not null,
  BorrowerLastName varchar (255) not null,
  DoB datetime not null,
  Gender Char (1) null,
  TaxPayerID_SSN Varchar (9) not null,
  PhoneNumber Varchar (10) not null,
  Email Varchar (255) not null,
  Citizenship varchar (255) null,
  BeneficiaryName varchar (255) null,
  IsUScitizen bit null,
  CreateDate datetime not null);
  --Task 4 Create table 'borrowerAddress' under Borrower Schema
  create table borrower.BorrowerAddress
  (AddressID INT not null,
  BorrowerID INT not null,
  StreetAddress Varchar (255) not null,
  ZIP varchar (5) not null,
  CreateDate datetime not null);
  --Task 5 create tables under the default dbo schema
  create table Calendar (CalendarDate datetime null);
  create table [state]
  (StateID Char (2) not null,
  StateName Varchar (255) not null,
  CreateDate datetime not null);
  Create table US_ZipCodes (IsSurrogateKey INT not null,
  ZIP varchar (5) not null,
  Latitude float null,
  Longitude float null,
  City varchar (255) null,
  State_id char (2) null,
  [population] INT null,
  density decimal null,
  county_fips varchar (10) null,
  county_name varchar (255) null,
  county_names_all varchar (255) null,
  county_fips_all varchar (50) null,
  timezone varchar (255) null,
  CreateDate datetime not null);
  alter table US_Zipcodes
  Drop column State_id
  --Task 6 - create tables in Loan Schema
  Create table Loan.LoanSetupInformation 
  (IsSurrogateKey INT not null,
  LoanNumber Varchar (10) not null,
  PurchaseAmount Numeric (18,2) not null,
  PurchaseDate datetime not null,
  LoanTerm INT not null,
  BorrowerID INT not null,
  UnderwriterID INT not null,
  ProductID char (2) not null,
  InterestRate decimal (3,2) not null,
  PaymentFrequency INT not null,
  AppraisalValue numeric (18,2) not null,
  CreateDate datetime not null,
  LTV decimal (4,2) not null,
  FirstInterestPaymentDate datetime null,
  MaturityDate datetime not null);

  create table Loan.Loanperiodic
  (Issurrogatekey INT not null,
  Loannumber varchar (10) not null,
  Cycledate datetime not null,
  Extramonthlypayment numeric (18,2) not null,
  UnpaidPrincipalBalance numeric (18,2) not null,
  Beginningschedulebalance numeric (18,2) not null,
  Paidinstallment numeric (18,2) not null,
  Principalportion numeric (18,2) not null,
  Endschedulebalance numeric (18,2) not null,
  Actualendschedulebalance numeric (18,2) not null,
  Totalinterestaccrued numeric (18,2) not null,
  DEFAULTPenalty numeric (18,2) not null,
  Delinquencycode INT Not null,
  Createdate datetime Not null);
  Alter table loan.loanperiodic 
  add InterestPortion numeric (18 , 2)
  

  Create table Loan.LU_PaymentFrequency (PaymentFrequency INT not null,
  PaymentIsMadeEvery INT not null,
  PaymentFrequency_Description varchar (255) not null);
  Create table Loan.LU_Delinquency (DelinquencyCode INT not null,
  Delinquency varchar (255) not null);
  
  drop table LU_Delinquency;
  Create table Loan.Underwriter (UnderwriterID INT not null,
  UnderwriterFirstName Varchar (255) null,
  UnderwriterMiddleInitial Char (1) null,
  UnderwriterLastName varchar (255) not null,
  PhoneNumber varchar (14) null,
  Email varchar (255) not null,
  createDate datetime not null);
  --Task 7... Add all primary keys
 
 Alter table borrower.borrower add constraint borrower_borrowerID primary key (BorrowerID);
  Alter table Loan.LoanSetupinformation add constraint LoanSetupinformation_LoanNumber primary key (LoanNumber);
  Alter table Loan.LU_Delinquency add constraint LU_Delinquency_DelinquencyCode primary key (DelinquencyCode);
  Alter table Loan.LU_PaymentFrequency add constraint LU_PaymentFrequency_PaymentFrequency primary key (PaymentFrequency);
  Alter table [state] add constraint State_StateID primary key (StateID);
  Alter table Loan.underwriter add constraint Underwriter_UnderwriterID primary key (UnderwriterID);
  Alter table US_ZipCodes add constraint US_Zipcodes_ZIP primary key (ZIP);
  ALTER TABLE borrower.borroweraddress
ADD CONSTRAINT [Pk_borrowerAddress_AddressID_Borrowerid] PRIMARY KEY([AddressId], [Borrowerid]);
ALTER TABLE loan.loanperiodic
ADD CONSTRAINT [Pk_loanperiodic_LoanNumber_CycleDate] PRIMARY KEY([LoanNumber], [CycleDate]);



  --Task 8.. Add all check constraints
 
  

  ALTER TABLE borrower.borrower
ADD CONSTRAINT Chk_borrower_Dob CHECK(Dob <= DATEADD(year, -18, GETDATE()));

Alter table borrower.borrower add constraint Chk_borrower_email Check (email like '%@%');
Alter table loan.underwriter add constraint Chk_underwriter_email check (email like '%@%');
Alter table Borrower.borrower add constraint chk_borrower_PhoneNumber check (phonenumber <>10)
ALTER TABLE Sales.Customer
ADD CONSTRAINT Chk_Customer_Phone CHECK(LEN(phone) = 12);

ALTER TABLE borrower.borrower
ADD CONSTRAINT Chk_borrower_PhoneNumber CHECK(LEN(phoneNumber) = 10);

Alter Table borrower.borrower
Add constraint chk_borrower_SSN check (len(TaxpayerID_ssn) =9);

Alter table loan.loanSetupInformation
Add constraint chk_loansetupinformation_loanTerm check (LoanTerm in ('35' , '30', '15' , '10'));

Alter table loan.loanSetupInformation
Add constraint chk_loansetupinformation_interestRate check (InterestRate in ('<=0.01' , '>=0.30'));

Alter table loan.loanperiodic 
Add constraint chk_loanperiodic_interestportion_pricipalportion_paidinstallment check (interestportion+ principalportion = Paidinstallment);

--task 8 Add all default keys
alter table borrower.borrower
add constraint default_borrower_createdate DEFAULT (getdate()) FOR [createdate];

alter table borrower.borrowerAddress
add constraint default_borrowerAddress_createdate DEFAULT (getdate()) FOR [createdate];

alter table Loan.LoanPeriodic
add constraint default_LoanPeriodic_createdate DEFAULT (getdate()) FOR createdate;

alter table loan.loanperiodic
add constraint default_loanperiodic_extramonthlypayment DEFAULT (0) FOR extramonthlypayment;

alter table Loan.LoanSetupInformation
add constraint default_LoanSetupInformation_createdate DEFAULT (getdate()) FOR createdate;

alter table Loan.Underwriter
add constraint default_Underwriter_createdate DEFAULT (getdate()) FOR createdate;

alter table US_zipcodes
add constraint default_USZipCodes_createdate DEFAULT (getdate()) FOR createdate;

--Task... Unique constraint
alter table [State]
add constraint Unique_State_StateName UNIQUE(StateName);

Alter table borrower.borroweraddress 
add constraint FK_borrowerAddress_BorrowerID Foreign key (borrowerID) references  borrower.borrower(BorrowerID);

Alter table borrower.borroweraddress 
add constraint FK_borrowerAddress_Zip Foreign key (ZIP) references  US_ZipCodes(ZIP);

Alter table borrower.borroweraddress 
add constraint FK_borrowerAddress_Zip Foreign key (ZIP) references  US_ZipCodes(ZIP);

Alter table loan.loanperiodic
add constraint FK_loanperiodic_LoanNumber Foreign key (LoanNumber) references  Loan.LoanSetupInformation(LoanNumber);

Alter table loan.loanperiodic
add constraint FK_loanperiodic_DelinquencyCode Foreign key (DelinquencyCode) references  Loan.LU_Delinquency(DelinquencyCode);

Alter table loan.loanSetupInformation
add constraint FK_loansetupinformation_PaymentFrequency Foreign key (PaymentFrequency) references  Loan.LU_PaymentFrequency(PaymentFrequency);

Alter table loan.loanSetupInformation
add constraint FK_loanperiodic_UnderwriterID Foreign key (UnderwriterID) references  Loan.Underwriter(UnderwriterID);

Alter table US_ZipCodes
add constraint FK_US_ZipCodes_StateID Foreign key (StateID) references  [State] (StateID);