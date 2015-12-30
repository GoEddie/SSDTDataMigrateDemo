

if object_id('order_details_migration') is not null
	begin

		insert into order_details(order_id, item_id, cost, line_item_number)
		select mig.order_id, mig.item_id, si.price, 1 from order_details_migration mig 
			inner join sales_items si on mig.item_id = si.item_id
			left outer join order_details od on mig.order_id = od.order_id and mig.item_id = od.item_id
		where od.order_id is null;


		delete from order_details_migration where order_id in (select order_id from order_details);
				
	end