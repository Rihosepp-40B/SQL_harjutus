create database PudiPadi

use PudiPadi

create table LocalOffice
(
	Id int not null primary key,
	Name nvarchar(50) not null,
	Address nvarchar(50) not null,
	ContactPhone varchar(50) not null
)
go
create table Employee
(
	Id int not null primary key,
	Firstname nvarchar(50) not null,
	Lastname nvarchar(50) not null,
	JobPosition nvarchar(50) not null,
	Salary int not null,
	LocalOffice int not null foreign key references LocalOffice(Id)
)
go
create table Client
(
	Id int not null primary key,
	Firstname nvarchar(50) not null,
	Lastname nvarchar(50) not null,
	Phone varchar(50) not null,
	Email nvarchar(50) not null
)
go
create table Products
(
	Id int not null primary key,
	Name nvarchar(50) not null,
	Category nvarchar(50) not null,
	Price int not null,
	AmmountInStock int not null
)
go
create table Receipt
(
	Id int not null primary key,
	ClientID int not null foreign key references Client(Id),
)
go
create table Sales
(
	Date date not null,
	TotalSum int not null,
	EmployeeID int not null foreign key references Employee(Id),
	ClientID int not null foreign key references Client(Id),
	Products nvarchar(50) not null,
	ReceiptID int not null foreign key references Receipt(Id)
)
go
insert into LocalOffice (Id, Name, Address, ContactPhone)
values (1, 'Tallinn', 'Suur tn 1', '55667788'),
(2, 'Viljandi', 'Väike tn 1', '55667787'),
(3, 'Tartu', 'Keskmine tn 1', '55667786'),
(4, 'Pärnu', 'Vana tn 1', '55667785'),
(5, 'Kuressaare', 'Uus tn 1', '55667784')
go
insert into Employee (Id, Firstname, Lastname, JobPosition, Salary, LocalOffice)
values (1, 'Tiit', 'Tuvi', 'Sales', 2200, 3),
(2, 'Peep', 'Post', 'Sales manager', 3000, 5),
(3, 'Anna', 'Aavik', 'Sales', 2200, 1),
(4, 'Tiina', 'Taevas', 'Sales', 2200, 2),
(5, 'Kaarel', 'Kajakas', 'Senior sales', 2500, 4),
(6, 'Liina', 'Lumi', 'Sales', 2200, 5)
go
insert into Client (Id, Firstname, Lastname, Phone, Email)
values (1, 'Aadu', 'Tuvi', '56998877', 'A@T.com'),
(2, 'Rita', 'Ritsikas', '56998876', 'R@R.com'),
(3, 'Eeva', 'Vares', '56998875', 'E@V.com'),
(4, 'Karl', 'Saar', '56998874', 'K@S.com'),
(5, 'Sandra', 'Saar', '56998873', 'S@S.com')
go
insert into Products (Id, Name, Category, Price, AmmountInStock)
values (1, 'Märkmik A6', 'Office supply', 5, 2000),
(2, 'Märkmik A5', 'Office supply', 6, 1000),
(3, 'Printer', 'IT', 300, 10),
(4, 'Vesi 5l', 'Drinks', 4, 50),
(5, 'Monitor', 'IT', 100, 9)
go
insert into Receipt (Id, ClientId)
values (1, 2),
(2, 5),
(3, 4),
(4, 3),
(5, 1)
go
insert into Sales (Date, TotalSum, EmployeeID, ClientID, Products, ReceiptID)
values ('2026-06-09', 11, 1, 2, '1-1', 1),
('2026-06-09', 306, 2, 5, '2-3', 2),
('2026-06-09', 11, 3, 4, '1-1', 3),
('2026-06-09', 11, 4, 3, '1-1', 4),
('2026-06-09', 11, 5, 1, '1-1', 5)

select * from LocalOffice
select * from Employee
select * from Client
select * from Receipt
select * from Sales
select * from Products

create proc spEmployeeSalary
@EmployeeID int
as begin
	select Firstname, Lastname, Salary from Employee
	where Id = @EmployeeID
end

spEmployeeSalary 1

select Firstname, Lastname, JobPosition, ReceiptID
From Sales
left Join Employee On Employee.Id = EmployeeID


select ClientId, Firstname, Lastname, ReceiptID
From Sales
full join Client On Client.Id = ClientID

select Firstname, Lastname, JobPosition, Name as Office
From Employee
left Join LocalOffice On LocalOffice.Id = LocalOffice

