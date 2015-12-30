create table [dbo].[orders]
(
	order_id int not null primary key identity(1,1),
	customer_id int not null,
	total_price money not null,
	constraint [fk_customers] foreign key (customer_id) references customers(customer_id)
)
go
create table order_details
(
	order_id int not null,
	line_item_number int not null,
	item_id int not null,
	cost money not null,
	constraint [fk_od_items] foreign key (item_id) references sales_items(item_id),
	constraint [fk_od_orders] foreign key (order_id) references orders(order_id),
	constraint [pk_order_details] primary key (order_id, line_item_number)

)
go