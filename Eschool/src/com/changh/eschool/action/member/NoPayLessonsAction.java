package com.changh.eschool.action.member;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.MyLesson;
import com.changh.eschool.entity.Student;
import com.changh.eschool.service.OrderService;
import com.changh.eschool.until.Constant;

public class NoPayLessonsAction extends BaseAction{
	private MyLesson myLesson;
	public MyLesson getMyLesson() {
		return myLesson;
	}
	public void setMyLesson(MyLesson myLesson) {
		this.myLesson = myLesson;
	}

	private OrderService orderService;

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	public String execute()throws Exception
	{
		Student  stu = (Student) session.get("student");
		if(stu!=null){
			myLesson = orderService.findMyLesson(stu.getStuId(),Constant.WAIT_PAY);
		}else{
			return "error";
		}
		
		return "success";
	}
}

