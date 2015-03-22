package com.changh.sccms.action.order;

public class WantInvoiceAction {
	private int orderId;
	
	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public String execute()
	{
		return "success";
	}
}
