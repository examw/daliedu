package com.changh.eschool.action.order;

import java.util.List;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.Items;
import com.changh.eschool.service.OrderService;

public class ItemsListAction extends BaseAction{
	private List<Items> list;
	private int orderId;
	
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public List<Items> getList() {
		return list;
	}
	private OrderService orderService;

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	public String execute()throws Exception
	{
		if(session.get("student")==null)
		{
			list = null;
		}else
		{
			list = orderService.findItemsByOrderId(orderId);
		}
		return "success";
	}
}
