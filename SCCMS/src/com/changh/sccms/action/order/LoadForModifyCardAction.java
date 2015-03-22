package com.changh.sccms.action.order;

import java.util.List;

import com.changh.sccms.entity.Student;
import com.changh.sccms.entity.Trade;
import com.changh.sccms.service.StudentService;

public class LoadForModifyCardAction {
	private int orderId;
	private int stuId;
	private Student stu;
	private StudentService studentService;
	
	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getStuId() {
		return stuId;
	}

	public void setStuId(int stuId) {
		this.stuId = stuId;
	}

	public StudentService getStudentService() {
		return studentService;
	}

	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}

	public Student getStu() {
		return stu;
	}

	public String execute()throws Exception
	{
		stu = studentService.findById(stuId);
		return "success";
	}
}
