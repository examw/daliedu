package com.changh.sccms.action.order;

import com.changh.sccms.entity.Order;
import com.changh.sccms.service.OrderService;

public class LoadAction {
	private int id;
	private int search;
	private boolean isBookSendExist;
	
	public boolean getIsBookSendExist() {
		return isBookSendExist;
	}

	public void setIsBookSendExist(boolean isBookSendExist) {
		this.isBookSendExist = isBookSendExist;
	}

	public void setSearch(int search) {
		this.search = search;
	}

	public void setId(int id) {
		this.id = id;
	}
	private Order order;

	public Order getOrder() {
		return order;
	}
	private OrderService orderService;
	
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	public String execute() throws Exception
	{
		order = orderService.findById(id);
		isBookSendExist = orderService.findIsExistBookSend(id);
		if(search==1)
		{
			return "success1";
		}else if(search==2)
		{
			return "success2";
		}
		return "success";
	}
}
