package com.changh.sccms.action.send;

import com.changh.sccms.entity.Order;
import com.changh.sccms.entity.Send;
import com.changh.sccms.service.OrderService;
import com.changh.sccms.service.SendService;

public class SendDetailAction {
	private int sendId;
	private Order order;
	private Send send;
	private SendService sendService;
	private String action;
	
	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public int getSendId() {
		return sendId;
	}

	public void setSendId(int sendId) {
		this.sendId = sendId;
	}

	public Order getOrder() {
		return order;
	}

	public Send getSend() {
		return send;
	}

	public void setSendService(SendService sendService) {
		this.sendService = sendService;
	}

	public void setOrderService(OrderService orderService) {
	}

	public String execute()throws Exception
	{
		send = sendService.findById(sendId);
		order = send.getOrder();
		if(action!=null&&action.equals("addAddr"))
		{
			return "success2";
		}
		return "success";
	}
}
