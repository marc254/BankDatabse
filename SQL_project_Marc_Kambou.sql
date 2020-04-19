create database Bank

use Bank


-- CREATING TABLES WITH ONLY PRIMARY KEY


	-- table employee

create table Employee (
	EmployeeID int primary key not null,
	EmployeeFirstName varchar(25) not null,
	EmployeeMiddleInitial char(1),
	EmployeeLastName varchar(25) not null,
	EmployeeIsManager bit
	)
insert into Employee values (001, 'Marc','A', 'Kambou',1)
insert into Employee values	(002, 'John','', 'Doe',0)
insert into Employee values	(003, 'Jane','', 'Smith',0)
insert into Employee values	(004, 'Max','', 'Maxwell',0)


	-- table user logins

create table UserLogins (
	UserLoginID int primary key not null,
	UserLogin char(15) not null,
	UserPassword varchar(20) not null
	)
insert into UserLogins values (1, 'abc123', 'password1')
insert into UserLogins values (2, 'abc456', 'password2')
insert into UserLogins values (3, 'cde123', 'password3')
insert into UserLogins values (4, 'cde456', 'password4')

	-- table user security questions

create table UserSecurityQuestions (
	UserSecurityQuestionID int primary key not null,
	UserSecurityQuestion varchar(50) not null
	)
insert into UserSecurityQuestions values (1, 'What is your first pet name?')
insert into UserSecurityQuestions values (2, 'What is your best friend name?')
insert into UserSecurityQuestions values (3, 'What was your first car color?')
insert into UserSecurityQuestions values (4, 'In which city were you born?')

	
	-- table account type

create table AccountType (
	AccountTypeID int primary key not null,
	AccountTypeDescription varchar(30) not null
	)
insert into AccountType values (1, 'Chequing')
insert into AccountType values (2, 'Savings')
insert into AccountType values (3, 'TFSA')
insert into AccountType values (4, 'RRSP')


	-- table Savings interest rates

create table SavingsInterestRates (
	InterestSavingsRateID int primary key not null,
	InterestRateValue float not null,
	InterestRateDescription varchar(20)
	)
insert into SavingsInterestRates values (1, 3.6, 'description 1')
insert into SavingsInterestRates values (2, 4.8, 'description 2')
insert into SavingsInterestRates values (3, 5.5, 'description 3')
insert into SavingsInterestRates values (4, 6.5, 'description 4')




	-- table account status type

create table AccountStatusType (
	AccountStatusTypeID int primary key not null,
	AccountStatusDescription varchar(30) not null
	)
insert into AccountStatusType values (1, 'Closed')
insert into AccountStatusType values (2, 'Open')


	-- table Transaction type

create table TransactionType (
	TransactionTypeID int primary key not null,
	TransactionTypeName varchar(10) not null,
	TransactionFeeAmount smallmoney not null
	)
insert into TransactionType values (1, 'Transfer', 500)
insert into TransactionType values (2, 'Bill', 80)
insert into TransactionType values (3, 'Car', 250)
insert into TransactionType values (4, 'Insurance', 300)

	-- table Login error log

create table LoginErrorLog (
	ErrorLogID int primary key not null,
	ErrorTime text not null
	)
insert into LoginErrorLog values (1, '2018/05/03')
insert into LoginErrorLog values (2, '2018/11/23')
insert into LoginErrorLog values (3, '2019/03/27')
insert into LoginErrorLog values (4, '2019/06/21')



	-- table failed transaction error type

create table FailedTransactionErrorType (
	FailedTransactionErrorTypeID int primary key not null,
	FailedTransactionDescription varchar(50) not null
	)
insert into FailedTransactionErrorType values (1, 'Error type 1')
insert into FailedTransactionErrorType values (2, 'Error type 2')
insert into FailedTransactionErrorType values (3, 'Error type 3')
insert into FailedTransactionErrorType values (4, 'Error type 4')



-- CREATING OTHER TABLES


	-- table Failed Transaction Log

create table FailedTransactionLog (
	FailedTransactionID int primary key not null,
	FailedTransactionErrorTypeID int references FailedTransactionErrorType(FailedTransactionErrorTypeID) not null,
	FailedTransactionErrorTime text not null,
	FailedTransactionXML text not null
	)
insert into FailedTransactionLog values (1, 3, '2018/10/15', 'Error log 1')
insert into FailedTransactionLog values (5, 1, '2018/11/09', 'Error log 2')
insert into FailedTransactionLog values (3, 4, '2019/02/20', 'Error log 3')
insert into FailedTransactionLog values (4, 2, '2019/04/12', 'Error log 4')


	-- table Account

create table Account (
	AccountID int primary key not null,
	CurrentBalance int not null,
	AccountTypeID int references AccountType(AccountTypeID) not null,
	AccountStatusTypeID int references AccountStatusType(AccountStatusTypeID) not null,
	InterestSavingsRateID int references SavingsInterestRates(InterestSavingsRateID) not null
	)
insert into Account values (1, 6000, 1, 1, 4)
insert into Account values (2, 0, 3, 2, 3)
insert into Account values (3, 2500, 1, 1, 1)
insert into Account values (4, 1500, 1, 1, 2)
insert into Account values (5, 15000, 2, 1, 2)
insert into Account values (6, 12000, 2, 1, 2)
insert into Account values (7, 2225, 3, 1, 1)
insert into Account values (8, 4500, 4, 1, 3)
insert into Account values (9, 18250, 1, 1, 2)

	

	-- table OverDraftLog

create table OverDraftLog (
	AccountID int primary key references Account(AccountID) not null,
	OverDraftDate text not null,
	OverDraftAmount int not null,
	OverDraftTransactionXML text
	)
insert into OverDraftLog values (1, '2018/04/25', 200, 'transaction 1')
insert into OverDraftLog values (2, '2018/11/30', 85, 'transaction 2')
insert into OverDraftLog values (3, '2019/02/18', 158, 'transaction 3')
insert into OverDraftLog values (4, '2019/05/02', 250, 'transaction 4')


	-- table Customer

create table customer (
	CustomerID int primary key not null,
	-- AccountID int references Account(AccountID) not null,
	CustomerAddress1 varchar(30) not null,
	CustomerAddress2 varchar(30),
	CustomerFirstName varchar(30) not null,
	CustomerMiddleInitial char(1),
	CustomerLastName varchar(30) not null,
	City varchar(20) not null,
	State char(2) not null,
	ZipCode char(10) not null,
	EmailAddress varchar(40) not null,
	HomePhone char(10) not null,
	CellPhone char(10),
	WorkPhone char(10),
	SSN char(9),
	UserLoginID int references UserLogins(UserLoginID) not null
	)

Insert into customer values (
	1,
	
	'123 Main street',
	'',
	'John',
	'A',
	'Doe',
	'Cityville',
	'CA',
	'12333',
	'abc@abc.com',
	'1234562211',
	'',
	'',
	'123456789',
	1)
Insert into customer values (
	2,
	
	'45 factice street',
	'',
	'Jane',
	'',
	'Noname',
	'Libertyville',
	'NY',
	'22456',
	'cde@gmail.com',
	'5554446566',
	'',
	'',
	'555666111',
	2)
Insert into customer values (
	3,
	
	'1235 ontario street',
	'Unit 4',
	'Max',
	'R',
	'Ford',
	'Deauville',
	'AB',
	'13000',
	'max@max.com',
	'2224567788',
	'',
	'',
	'234567891',
	4)
Insert into customer values (
	4,
	
	'789 canada street',
	'Unit 78',
	'Robert',
	'',
	'Redford',
	'Robertville',
	'MA',
	'35456',
	'robert@robert.com',
	'7894561213',
	'',
	'',
	'555777888',
	3)

Insert into customer values (
	5,
	
	'869 ontario street',
	'',
	'Marc',
	'',
	'Morrison',
	'Cityville',
	'ON',
	'11222',
	'robert@robert.com',
	'2264451546',
	'',
	'',
	'555777888',
	3)

Insert into customer values (
	6,
	
	'86 Mississauga Road',
	'',
	'Christine',
	'N',
	'Johannson',
	'Mississauga',
	'ON',
	'11122',
	'christine@christine.com',
	'6472227879',
	'',
	'',
	'556789152',
	4)
Insert into customer values (
	7,
	
	'52 Quebec street',
	'',
	'Estelle',
	'',
	'Robinson',
	'Montreal',
	'QC',
	'11323',
	'estelle@estetlle.com',
	'5142227879',
	'',
	'',
	'556516152',
	2)
Insert into customer values (
	8,
	
	'19 fakestreet road',
	'',
	'Robin',
	'',
	'Robinson',
	'Ottawa',
	'ON',
	'11345',
	'robin@robin.com',
	'6132227879',
	'',
	'',
	'558656152',
	1)
Insert into customer values (
	9,
	
	'30 independance road',
	'',
	'Soledad',
	'R',
	'Matteson',
	'New York',
	'NY',
	'12565',
	'soledad@soledad.com',
	'2102242879',
	'',
	'',
	'554657123',
	3)



	-- table Customer-Account

create table [Customer-Account] (
	AccountID int references Account(AccountID) not null,
	CustomerID int references Customer(CustomerID) not null
	)
insert into [Customer-Account] values (1,7)
insert into [Customer-Account] values (2,1)
insert into [Customer-Account] values (3,2)
insert into [Customer-Account] values (4,9)
insert into [Customer-Account] values (5,6)
insert into [Customer-Account] values (6,8)
insert into [Customer-Account] values (7,3)
insert into [Customer-Account] values (8,4)
insert into [Customer-Account] values (9,5)


	-- table Login-Account

create table [Login-Account] (
	UserLoginID int references UserLogins(UserLoginID) not null,
	AccountID int references Account(AccountID) not null
	)
insert into [Login-Account] values (1,2)
insert into [Login-Account] values (2,4)
insert into [Login-Account] values (3,1)
insert into [Login-Account] values (4,3)




	-- table UserSecurityAnswers

create table UserSecurityAnswers (
	UserLoginID int primary key references UserLogins(UserLoginID) not null,
	UserSecurityAnswer varchar(25) not null,
	UserSecurityQuestionID int references UserSecurityQuestions(UserSecurityQuestionID) not null
	)
insert into UserSecurityAnswers values (1, 'Rookie', 1)
insert into UserSecurityAnswers values (2, 'Toronto', 4)
insert into UserSecurityAnswers values (3, 'Robert', 2)
insert into UserSecurityAnswers values (4, 'Blue', 3)



	-- table TransactionLog

create table TransactionLog (
	TransactionID int primary key not null,
	TransactionDate text not null,
	TransactionTypeID int references TransactionType(TransactionTypeID) not null,
	TransactionAmount int not null,
	NewBalance int not null,
	AccountID int references Account(AccountID) not null,
	CustomerID int references Customer(CustomerID) not null,
	EmployeeID int references Employee(EmployeeID) not null,
	UserLoginID int references UserLogins(UserLoginID) not null
	)
insert into TransactionLog values (1, '2018/04/25 10:45', 1, 250, 1500, 1, 2, 1, 1)
insert into TransactionLog values (2, '2018/10/01 9:32', 2, 100, 3150, 3, 1, 2, 4)
insert into TransactionLog values (3, '2019/01/31 13:25', 4, 450, 4225, 2, 4, 3, 2)
insert into TransactionLog values (4, '2019/05/11 18:22', 3, 125, 2550, 4, 3, 4, 3)





-- QUESTIONS 



-- Question 1: Create a view to get all customers with checking account from ON province.


create view CustomerONwithChequing as
select CustomerFirstName, CustomerLastName, State, CurrentBalance, AccountTypeDescription
from customer join [Customer-Account]
on customer.CustomerID = [Customer-Account].CustomerID 
join Account
on [Customer-Account].AccountID = Account.AccountID
join AccountType 
on Account.AccountTypeID = AccountType.AccountTypeID 
where state = 'ON' and AccountTypeDescription = 'Chequing'

select * from CustomerONwithChequing




-- Question 2: Create a view to get all customers with total account balance (including interest rate) greater than 5000



Create view TotalBalanceAmount as
select CustomerFirstName, CustomerLastName, CurrentBalance, InterestRateValue, (currentbalance + ((CurrentBalance*interestratevalue)/100)) as TotalBalance
from customer join [Customer-Account]
on customer.CustomerID = [Customer-Account].CustomerID
join Account 
on [Customer-Account].AccountID = Account.AccountID
join SavingsInterestRates
on Account.InterestSavingsRateID = SavingsInterestRates.InterestSavingsRateID


create view CustomerTotalBalancegreaterthan5000 as
Select * from TotalBalanceAmount
Where TotalBalance > 5000

select * from CustomerTotalBalancegreaterthan5000



-- Question 3: Create a view to get counts of checking and savings accounts by customer

Create view NumberOfCustomerWithCheckingOrSavings as
Select Count(Customer.CustomerId) NumberOfCustomer, AccountTypeDescription 
from customer join [Customer-Account]
on customer.CustomerID = [Customer-Account].CustomerID
join Account
on [Customer-Account].AccountID = Account.AccountID
Join AccountType
On Account.AccountTypeID = AccountType.AccountTypeID
where AccountType.AccountTypeID = 1 or AccountType.AccountTypeID = 2
Group by AccountTypeDescription


select * from NumberOfCustomerWithCheckingOrSavings



-- Question 4: Create a view to get any particular user’s login and password using AccountId


create view Userlogin
as
select [Login-Account].AccountID, UserLogin, UserPassword 
from UserLogins join [Login-Account]
on UserLogins.UserLoginID = [Login-Account].UserLoginID
join Account
on [Login-Account].AccountID = Account.AccountID

select * from Userlogin


-- Question 5: Create a view to get all customers’ overdraft amount

Create view OverdraftAmount as
select CustomerFirstName, CustomerLastName, OverDraftDate, OverDraftAmount
from Customer join [Customer-Account]
on customer.CustomerID = [Customer-Account].CustomerID
left join OverDraftLog
on [Customer-Account].AccountID = OverDraftLog.AccountID

select * from OverdraftAmount


-- Question 6: Create a stored procedure to add “User_” as a prefix to everyone’s login (username)

create procedure AlterUserLogin
as
Begin
 update UserLogins set UserLogin = 'User_' + UserLogin
end

execute AlterUserLogin

select * from UserLogins



-- Question 7: Create a stored procedure that accepts AccountId as a parameter and returns customer’s full name

create procedure CustomerFullName 
@AccountIdInput int
As
Begin
	Select [Customer-Account].AccountId, Customer.CustomerID, (Customer.CustomerFirstName + ' ' + Customer.CustomerLastName) as [Customer_FullName]
	from customer join [Customer-Account]
	on customer.CustomerID = [Customer-Account].CustomerID
	Where [Customer-Account].AccountID = @AccountIdInput
End

Execute CustomerFullName 8





-- Question 8: Create a stored procedure that takes a deposit as a parameter and updates CurrentBalance value for that particular account

create procedure CurrentBalanceProc
@AccountId int, @deposit int,
@Balance int output
As
Begin

	Select @Balance = CurrentBalance + @deposit
	from Customer join [Customer-Account]
	on customer.CustomerID = [Customer-Account].CustomerID
	join Account
	On [Customer-Account].AccountID = Account.AccountID
	
	where [Customer-Account].AccountID = @AccountId

End


declare @NewBalance int
execute CurrentBalanceProc 1,5000, @NewBalance output
Select @NewBalance


-- Question 9: Create a stored procedure that takes a withdrawal amount as a parameter and updates CurrentBalance value for that particular account


create procedure CurrentBalanceProc2
@AccountId2 int, @withdrawal int,
@Balance int output
As
Begin

	Select @Balance = CurrentBalance - @withdrawal
	from Customer join [Customer-Account]
	on customer.CustomerID = [Customer-Account].CustomerID
	join Account
	On [Customer-Account].AccountID = Account.AccountID
	
	where [Customer-Account].AccountID = @AccountId2

End


declare @NewBalance2 int
execute CurrentBalanceProc2 1,5000, @NewBalance2 output
Select @NewBalance2



--Question 10: Write a query to remove SSN column from Customer table

Alter table Customer
Drop column SSN

select * from customer