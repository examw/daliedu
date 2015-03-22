package com.changh.eschool.action.member;

import java.util.Date;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.AskOrComplain;
import com.changh.eschool.entity.Student;
import com.changh.eschool.service.AskOrComplainService;

public class AddComplainAction extends BaseAction{
	private AskOrComplain ac;
	private AskOrComplainService  askOrComplainService;
	private boolean ok;
	public AskOrComplain getAc() {
		return ac;
	}

	public void setAc(AskOrComplain ac) {
		this.ac = ac;
	}

	public boolean isOk() {
		return ok;
	}

	public void setAskOrComplainService(AskOrComplainService askOrComplainService) {
		this.askOrComplainService = askOrComplainService;
	}

	public String execute()throws Exception
	{
		Student stu = (Student)session.get("student");
		ac.setStuId(stu.getStuId());
		ac.setAcAddTime(new Date());
		ac.setAcStatus(0);//Ã»½â¾ö
		askOrComplainService.save(ac); 
		ok=true;
		return "success";
	}
	
}	
