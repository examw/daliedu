package com.changh.eschool.action.user;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.Address;
import com.changh.eschool.service.StudentService;

public class LoadAddressAction  extends BaseAction{
	private int aid;
	private Address addr;
	private StudentService studentService;
	
	public int getAid() {
		return aid;
	}

	public void setAid(int aid) {
		this.aid = aid;
	}

	public Address getAddr() {
		return addr;
	}

	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}

	public String execute()throws Exception
	{
		addr = studentService.findAddr(aid);
		return "success";
	}
}
