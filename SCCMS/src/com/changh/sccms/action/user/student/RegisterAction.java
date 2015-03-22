package com.changh.sccms.action.user.student;

import com.changh.sccms.action.BaseAction;
import com.changh.sccms.entity.Student;
import com.changh.sccms.service.StudentService;

public class RegisterAction extends BaseAction{
	private Student stu;
	private StudentService studentService;
	public void setStu(Student stu) {
		this.stu = stu;
	}
	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}
	public String execute()throws Exception
	{
		//加入库
		studentService.addStudent(stu);
		
		//绑session，表示一次登录
		session.put("student", stu);
		return "success";
	}
}
