package com.changh.eschool.action.member;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.Student;
import com.changh.eschool.service.OrderService;

public class DeleteOrderAction extends BaseAction{
	private int orderId;
	private OrderService orderService;
	private boolean ok=false;
	
	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public boolean isOk() {
		return ok;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	public String execute()throws Exception
	{
		//并没有真正删除,只是取消了,将状态置为了 取消 状态
		Student stu = (Student) session.get("student");
		if(stu == null) return "fail";
		//把已经支付了的钱退还到学员的账户
		stu = orderService.cancelOrder(stu,orderId);
		session.put("student", stu);
		ok = true;
		return "success";
	}
}
