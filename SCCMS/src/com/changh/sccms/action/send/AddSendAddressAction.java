package com.changh.sccms.action.send;

import com.changh.sccms.entity.Send;
import com.changh.sccms.service.SendService;

public class AddSendAddressAction {
	private Send send;
	private SendService sendService;
	public String execute()throws Exception
	{
		sendService.update(send);
		return "success";
	}
}
