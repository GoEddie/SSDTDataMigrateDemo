if exists(select * from sys.columns where name = 'item_id' and object_id = object_id('orders'))
begin

	if object_id('order_details_migration') is null
	begin
		
		create table order_details_migration
		(
			order_id int not null,
			item_id int not null
		);

	end

	insert into order_details_migration(order_id, item_id)
	select o.order_id, o.item_id from orders o left outer join order_details_migration mig on o.order_id = mig.order_id where mig.order_id is null;


end;