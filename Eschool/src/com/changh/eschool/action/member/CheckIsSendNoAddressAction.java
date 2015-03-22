package com.changh.eschool.action.member;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.Send;
import com.changh.eschool.entity.Student;
import com.changh.eschool.service.OrderService;

public class CheckIsSendNoAddressAction extends BaseAction{
	private Send send;
	private OrderService orderService;
	
	public Send getSend() {
		return send;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	public String execute() throws Exception
	{
		Student stu = (Student) session.get("student");
		send = orderService.findSendNoAddress(stu.getStuId());
		return "success";
	}
	
}
