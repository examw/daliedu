package com.changh.sccms.action.order;

import com.changh.sccms.entity.Order;
import com.changh.sccms.service.OrderService;

public class ModifyPriceAction {
	private double realMoney;
	private String orderNo;
	private int orderId;
	private OrderService orderService;
	
	public double getRealMoney() {
		return realMoney;
	}

	public void setRealMoney(double realMoney) {
		this.realMoney = realMoney;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	public String execute()throws Exception
	{
		Order order = orderService.updatePrice(orderNo, realMoney);
		if(order!=null)
		{
			orderId = order.getOrderId();
			return "success";
		}
		return "error";
	}
}
