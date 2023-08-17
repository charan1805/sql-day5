create database Assignement5DB
use Assignement5DB

drop database Assignement5DB

create schema Bank
create table Bank.Customer 
(CId int primary key,

CName nvarchar(50) not null,
CEmail nvarchar(100) not null unique,
Contact nvarchar(20) not null unique,
CPwd AS right(CName, 2) + convert(nvarchar(10),CId) + left(Contact, 2) persisted
)
insert into Bank.Customer (CId, CName, CEmail, Contact) values (1001, 'sreecharan', 'sreeyahoo@itc.com','12333490'),
(1002, 'charan', 'Mymail@m.com', '8414455674'),
(1003, 'Ramesh', 'RsMymail@m.com', '843214674')
select * from Bank.Customer

create table Bank.MailInfo 
( MailTo nvarchar(100),
MailDate date default getdate(),
MailMessage nvarchar(max)
)


drop trigger ToMailInfo
create trigger TOMailInfo
on Bank.Customer
after insert
as
begin
insert into Bank.MailInfo (MailTo, MailMessage)
select i.CEmail, 'Your net banking Password is : ' + i.CPwd + '. It is valid up to 2 days only. Update it.'
from inserted i;
end

select * from Bank.Customer

select * from Bank.MailInfo