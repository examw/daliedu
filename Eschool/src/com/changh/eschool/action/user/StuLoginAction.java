package com.changh.eschool.action.user;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.Student;
import com.changh.eschool.service.StudentService;

public class StuLoginAction extends BaseAction{
	private String username;
	private String password;
	private boolean ok;
	
	public boolean isOk() {
		return ok;
	}
	private StudentService studentService;
	
	public void setUsername(String username) {
		this.username = username;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}
	public String execute()throws Exception
	{
		Student stu = studentService.login(username, password);
		if(stu!=null)
		{
			session.put("student",stu);
			return "success";
		}else
		{
			return "false";
		}
		
	}
}
