package com.changh.eschool.action.order;

import com.changh.eschool.service.OrderService;

public class CancelOrderAction {
	private int orderId;

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	private OrderService orderService;

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	public String execute()throws Exception
	{
		//用户点取消是删了呢 还是把状态置为取消
		return "success";
	}
}
