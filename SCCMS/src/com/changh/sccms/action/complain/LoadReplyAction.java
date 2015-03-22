package com.changh.sccms.action.complain;

import java.util.List;

import com.changh.sccms.entity.Reply;
import com.changh.sccms.service.AskOrComplainService;

public class LoadReplyAction {
	private int acId;
	private List<Reply> reply;
	private AskOrComplainService askOrComplainService;
	
	public int getAcId() {
		return acId;
	}

	public void setAcId(int acId) {
		this.acId = acId;
	}

	public List<Reply> getReply() {
		return reply;
	}

	public void setAskOrComplainService(AskOrComplainService askOrComplainService) {
		this.askOrComplainService = askOrComplainService;
	}

	public String execute()throws Exception
	{
		reply = askOrComplainService.findReplyByAcId(acId);
		return "success";
	}
}	
