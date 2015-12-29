create table [dbo].[orders]
(
	order_id int not null primary key identity(1,1),
	customer_id int not null,
	total_price money not null,
	item_id int not null,
	constraint [fk_customers] foreign key (customer_id) references customers(customer_id),
	constraint [fk_items] foreign key (item_id) references sales_items(item_id)
)

