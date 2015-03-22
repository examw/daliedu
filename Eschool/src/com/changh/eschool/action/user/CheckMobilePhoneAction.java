package com.changh.eschool.action.user;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.service.StudentService;

public class CheckMobilePhoneAction extends BaseAction{
	private String phone;
	private StudentService studentService;
	private boolean ok=false;
	
	public boolean isOk() {
		return ok;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}
	
	public String execute()throws Exception
	{
		if(studentService.findByMobilePhone(phone)!=null)
		{
			ok=true; //表示被占用
		} 
		return "success";
	}
}