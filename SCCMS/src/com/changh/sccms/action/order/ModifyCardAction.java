package com.changh.sccms.action.order;

import com.changh.sccms.service.StudentService;
import com.changh.sccms.until.Constant;

public class ModifyCardAction {
	private double money;
	private int stuId;
	private int orderId;
	private String content;
	private StudentService studentService;
	
	public double getMoney() {
		return money;
	}

	public void setMoney(double money) {
		this.money = money;
	}

	public int getStuId() {
		return stuId;
	}

	public void setStuId(int stuId) {
		this.stuId = stuId;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}

	public String execute()throws Exception
	{
		if(studentService.updateAccount(stuId, money, content))
		{
			if(orderId!=0)
			{
				return "success";
			}else
				return "success1";
		}else
		{
			return "error";
		}
		
	}
}
