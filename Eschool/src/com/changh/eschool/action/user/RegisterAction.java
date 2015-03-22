package com.changh.eschool.action.user;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.Student;
import com.changh.eschool.service.StudentService;

public class RegisterAction extends BaseAction{
	private Student stu;
	private String addr="/member/center";
	
	public String getAddr() {
		return addr;
	}
	private StudentService studentService;
	
	public Student getStu() {
		return stu;
	}
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
		//在save的时候没有办法赋正确的主键值给 stuId
		stu=studentService.findByUsername(stu.getStuUsername());
		session.put("student", stu);
		return "success";
	}
}
