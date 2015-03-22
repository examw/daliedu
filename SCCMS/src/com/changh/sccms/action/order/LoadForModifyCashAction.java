package com.changh.sccms.action.order;

import java.util.List;

import com.changh.sccms.entity.Student;
import com.changh.sccms.entity.Trade;
import com.changh.sccms.service.StudentService;

public class LoadForModifyCashAction {
	private int orderId;
	private int stuId;
	private Student stu;
	private List<Trade> tradeList;
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

	public List<Trade> getTradeList() {
		return tradeList;
	}

	public void setTradeList(List<Trade> tradeList) {
		this.tradeList = tradeList;
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
