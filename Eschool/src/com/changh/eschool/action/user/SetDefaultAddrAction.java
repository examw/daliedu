package com.changh.eschool.action.user;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.Student;
import com.changh.eschool.service.StudentService;

public class SetDefaultAddrAction extends BaseAction {
	private int aid;
	private boolean ok;
	private StudentService studentService;
	
	public int getAid() {
		return aid;
	}
	
	public boolean isOk() {
		return ok;
	}

	public void setAid(int aid) {
		this.aid = aid;
	}

	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}

	public String execute()throws Exception
	{
		Student stu = (Student)session.get("student");
		studentService.updateDefaultAddr(aid,stu.getStuId());
		ok = true;
		return "success";
	}
}
