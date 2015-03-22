package com.changh.eschool.action.member;

import com.changh.eschool.entity.Reply;
import com.changh.eschool.service.AskOrComplainService;

public class LoadReplyAction {
	private int acId;
	private String msg;
	private AskOrComplainService askOrComplainService;
	public int getAcId() {
		return acId;
	}

	public void setAcId(int acId) {
		this.acId = acId;
	}

	public String getMsg() {
		return msg;
	}

	public void setAskOrComplainService(AskOrComplainService askOrComplainService) {
		this.askOrComplainService = askOrComplainService;
	}

	public String execute()throws Exception
	{
		Reply reply = askOrComplainService.findReplyByAcId(acId);
		if(reply==null) msg="ÔÝÎÞ»Ø¸´";
		else msg = reply.getReplyContent();
		return "success";
	}
}
