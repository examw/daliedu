package com.changh.sccms.action.order;

import com.changh.sccms.entity.Order;
import com.changh.sccms.entity.Send;
import com.changh.sccms.entity.Trade;
import com.changh.sccms.service.OrderService;

public class ManualPayAction {
	private Order order;
	private Send send;
	private Trade trade;
	private int isNeedSend;
	
	public int getIsNeedSend() {
		return isNeedSend;
	}
	public void setIsNeedSend(int isNeedSend) {
		this.isNeedSend = isNeedSend;
	}
	private OrderService orderService;
	
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public Send getSend() {
		return send;
	}
	public void setSend(Send send) {
		this.send = send;
	}
	public Trade getTrade() {
		return trade;
	}
	public void setTrade(Trade trade) {
		this.trade = trade;
	}
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	public String execute() throws Exception
	{
		if(isNeedSend==1)
		{	
			send = null;
		}
		boolean ok = orderService.updateForManualPay(order, send, trade);
		if(ok)	return "success";
		return "error";
	}
}	
