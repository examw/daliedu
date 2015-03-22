package com.changh.eschool.action.member;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.Send;
import com.changh.eschool.entity.Student;
import com.changh.eschool.service.SendService;

public class AddAddressForSend extends BaseAction{
	private Send send;
	private boolean ok;
	private SendService sendService;
	
	public Send getSend() {
		return send;
	}

	public void setSend(Send send) {
		this.send = send;
	}

	public boolean isOk() {
		return ok;
	}

	public void setSendService(SendService sendService) {
		this.sendService = sendService;
	}

	public String execute()throws Exception
	{
		Student stu = (Student) session.get("student");
		ok = sendService.updateAddress(send,stu.getStuId());
		return "success";
	}
	
}
