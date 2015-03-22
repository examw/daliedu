package com.changh.sccms.action.send;

import com.changh.sccms.entity.Send;
import com.changh.sccms.service.SendService;

public class SendLoadAction {
	private int sendId;
	
	public int getSendId() {
		return sendId;
	}

	public void setSendId(int sendId) {
		this.sendId = sendId;
	}
	private Send send;

	public Send getSend() {
		return send;
	}

	public void setSend(Send send) {
		this.send = send;
	}
	private SendService sendService;
	
	public void setSendService(SendService sendService) {
		this.sendService = sendService;
	}

	public String execute()throws Exception
	{
		send=sendService.findById(sendId);
		return "success";
	}
}
