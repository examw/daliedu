package com.changh.sccms.action.order;

import java.util.Date;
import java.util.List;

import com.changh.sccms.entity.Items;
import com.changh.sccms.entity.Order;
import com.changh.sccms.service.ItemsService;
import com.changh.sccms.service.OrderService;
import com.changh.sccms.until.Constant;

public class BeforePayAction {
	private int orderId;
	private boolean ok;
	private OrderService orderService;
	private ItemsService itemsService;
	
	public void setItemsService(ItemsService itemsService) {
		this.itemsService = itemsService;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public boolean isOk() {
		return ok;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	public String execute()throws Exception
	{
		//Order order = orderService.findById(orderId);
		List<Items> list = itemsService.getItemsByOrderId(orderId);
		if(isOverdue(list))
		{
			Order order = orderService.findById(orderId);
			order.setOrderStatus(Constant.OVERTIME);
			orderService.update(order);
			ok = false;
		}else
			ok = true;
		return "success";
	}
	private boolean isOverdue(List<Items> list)
	{
		for(Items item:list)
		{
			if(item.getItemOverTime().compareTo(new Date())<0)//过期时间在今天之前表示已经过期
			{
				return true;
			}
		}
		return false;
	}
}
