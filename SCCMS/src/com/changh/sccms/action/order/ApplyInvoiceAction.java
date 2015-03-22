package com.changh.sccms.action.order;

import com.changh.sccms.entity.Order;
import com.changh.sccms.entity.Send;
import com.changh.sccms.service.OrderService;

public class ApplyInvoiceAction {
	private String orderNo;
	private Send send;
	private int orderId;

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	private OrderService orderService;
	
	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public Send getSend() {
		return send;
	}

	public void setSend(Send send) {
		this.send = send;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	public String execute()throws Exception
	{
		Order order = orderService.updateForApplyInvoice(orderNo,send);
		if(order!=null){
			orderId = order.getOrderId();
			return "success";
		}
		return "error";
	}
}
