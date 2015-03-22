package com.changh.eschool.action.user;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.Student;
import com.changh.eschool.service.StudentService;

public class CommonRegisterAction  extends BaseAction{
	private String username;
	private String password;
	private String email;
	private boolean ok;
	private StudentService studentService;
	public void setUsername(String username) {
		this.username = username;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	public boolean isOk() {
		return ok;
	}
	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}
	public String execute()throws Exception
	{
		Student stu = new Student();
		stu.setStuUsername(username);
		stu.setStuPassword(password);
		stu.setStuEmail(email);
		ok = studentService.registerFromCart(stu);
		return "success";
	}
}
