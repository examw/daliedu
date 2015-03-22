package com.changh.eschool.action.cart;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.Student;
import com.changh.eschool.service.StudentService;
import com.changh.eschool.until.Escape;

public class LoginFromCartAction extends BaseAction{
	private String username;
	private String password;
	private String trueName;
	private String mobile;
	private boolean ok;
	
	public boolean isOk() {
		return ok;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setTrueName(String trueName) {
		this.trueName = Escape.unescape(trueName);
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}
	private StudentService studentService;
	public String execute()throws Exception
	{
		//登录成功
		Student stu = studentService.login(username, password);
		if(stu!=null)
		{
			session.put("student", stu);
			ok=true;
			if(!trueName.equals(stu.getStuName())||!mobile.equals(stu.getStuMobile()))
			{
				//更新学生信息
				stu.setStuName(trueName);
				stu.setStuMobile(mobile);
				studentService.updateStudent(stu);
			}
		}else
		{
			ok=false;
		}
		return "success";
	}
}
