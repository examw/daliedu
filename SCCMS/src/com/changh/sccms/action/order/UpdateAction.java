package com.changh.sccms.action.order;

import java.util.HashMap;
import java.util.Map;

import com.changh.sccms.action.BaseAction;
import com.changh.sccms.entity.Order;
import com.changh.sccms.entity.Send;
import com.changh.sccms.entity.Trade;
import com.changh.sccms.service.OrderService;

public class UpdateAction extends BaseAction{
	private Order order;
	private Send send;
	private Trade trade;
	private Map<String,Object> data=new HashMap<String,Object>();
	
	public Trade getTrade() {
		return trade;
	}

	public void setTrade(Trade trade) {
		this.trade = trade;
	}

	public Send getSend() {
		return send;
	}

	public void setSend(Send send) {
		this.send = send;
	}

	public Map<String, Object> getData() {
		return data;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}
	private OrderService orderService;
	
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	public String execute() throws Exception
	{
		try{
			orderService.update(order,send,trade);
			data.put("ok", true);
			data.put("id", order.getOrderId());
		}catch(NullPointerException e)
		{
			e.printStackTrace();
			data.put("ok", false);
		}
		catch(Exception e)
		{
			throw e;
		}
		return "success";
	}
}
