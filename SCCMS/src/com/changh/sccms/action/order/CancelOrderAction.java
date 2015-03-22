package com.changh.sccms.action.order;

import com.changh.sccms.service.OrderService;

public class CancelOrderAction {
	private int orderId;
	private int mode;
	private double cash;
	private double card;
	private String content;
	public int getMode() {
		return mode;
	}

	public void setMode(int mode) {
		this.mode = mode;
	}

	public double getCash() {
		return cash;
	}

	public void setCash(double cash) {
		this.cash = cash;
	}

	public double getCard() {
		return card;
	}

	public void setCard(double card) {
		this.card = card;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	private boolean ok;

	public boolean isOk() {
		return ok;
	}
	private OrderService orderService;

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	public String execute()throws Exception
	{
		try
		{
			orderService.cancelOrder(orderId,mode,card,cash,content);
			ok=true;
		}catch(Exception e)
		{
			throw e;
		}
		return "success";
	}
}	
