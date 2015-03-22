package com.changh.sccms.action.user.student;

import com.changh.sccms.service.StudentService;

public class CheckEmailAction {
	private String email;
	private StudentService studentService;
	private boolean ok=false;
	
	public boolean isOk() {
		return ok;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}
	
	public String execute()throws Exception
	{
		if(studentService.findByEmail(email)!=null)
		{
			ok=true; //表示被占用
		} 
		return "success";
	}
}
