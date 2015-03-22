package com.changh.sccms.action.order;

import com.changh.sccms.entity.Student;
import com.changh.sccms.service.OrderService;

public class LoadStudentAction {
	private int stuId;
	private Student stu;
	private OrderService orderService;
	public String execute()throws Exception
	{
		stu = orderService.LoadStu(stuId);
		return "success";
	}
	public int getStuId() {
		return stuId;
	}
	public void setStuId(int stuId) {
		this.stuId = stuId;
	}
	public Student getStu() {
		return stu;
	}
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
}
