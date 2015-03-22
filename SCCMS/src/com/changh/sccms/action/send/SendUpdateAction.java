package com.changh.sccms.action.send;

import com.changh.sccms.entity.Send;
import com.changh.sccms.service.SendService;

public class SendUpdateAction {
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
	private boolean ok;

	public boolean isOk() {
		return ok;
	}
	public String execute() throws Exception
	{
		ok = sendService.update(send);
		return "success";
	}
}
