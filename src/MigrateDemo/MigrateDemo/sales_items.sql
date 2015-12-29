create table [dbo].[sales_items]
(
	item_id int not null primary key identity(1,1),
	price money not null,
	description varchar(34),
	long_description varchar(58) not null,
	longer_description varchar(max) null
)
