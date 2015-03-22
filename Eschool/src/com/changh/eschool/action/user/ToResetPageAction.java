package com.changh.eschool.action.user;

import java.net.URLDecoder;
import java.net.URLEncoder;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.Student;
import com.changh.eschool.service.StudentService;

public class ToResetPageAction  extends BaseAction{
	private String username;
	private String actionCode;
	private StudentService studentService;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getActionCode() {
		return actionCode;
	}
	public void setActionCode(String actionCode) {
		this.actionCode = actionCode;
	}
	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}
	public String execute()throws Exception
	{
		Student stu = studentService.findByUsername(username);
		if(stu!=null && stu.getStuPassword().equals(actionCode))
		{
			return "success";
		}
		return "fail";
	}
	
}
