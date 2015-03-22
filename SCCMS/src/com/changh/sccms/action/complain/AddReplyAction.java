package com.changh.sccms.action.complain;

import com.changh.sccms.entity.Reply;
import com.changh.sccms.service.AskOrComplainService;

public class AddReplyAction {
	private Reply reply;
	private AskOrComplainService askOrComplainService;
	private boolean ok;
	
	public Reply getReply() {
		return reply;
	}

	public void setReply(Reply reply) {
		this.reply = reply;
	}

	public boolean isOk() {
		return ok;
	}

	public void setAskOrComplainService(AskOrComplainService askOrComplainService) {
		this.askOrComplainService = askOrComplainService;
	}

	public  String execute()throws Exception
	{
		askOrComplainService.addReply(reply);
		ok = true;
		return "success";
	}

}
