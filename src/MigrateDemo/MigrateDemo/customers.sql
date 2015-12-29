create table [dbo].[customers]
(
	customer_id int not null primary key identity(1,1),
	name varchar(23) not null
)
