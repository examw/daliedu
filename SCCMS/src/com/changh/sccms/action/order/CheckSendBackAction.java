package com.changh.sccms.action.order;

import java.util.List;

import com.changh.sccms.entity.Send;
import com.changh.sccms.service.SendService;
import com.changh.sccms.until.Constant;

public class CheckSendBackAction {
	private int orderId;
	private boolean ok;
	public boolean isOk() {
		return ok;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	private SendService sendService;
	
	public void setSendService(SendService sendService) {
		this.sendService = sendService;
	}
	public String execute()throws Exception
	{
		List<Send> sendList = sendService.findByOrderId(orderId);
		for(Send send:sendList)
		{
			if(send.getSendStatus()==Constant.SENTBACK)
			{
				ok = true;
			}else
			{
				ok=false;
			}
		}
		return "success";
	}
}
