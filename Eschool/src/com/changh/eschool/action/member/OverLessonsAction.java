package com.changh.eschool.action.member;

import java.util.List;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.Grade;
import com.changh.eschool.entity.Student;
import com.changh.eschool.service.OrderService;
import com.changh.eschool.until.Constant;

public class OverLessonsAction extends BaseAction {
	private List<Grade> gradeList;
	private OrderService orderService;
	
	public String execute(){
		Student stu = (Student) session.get("student");
		gradeList=orderService.findOverLesson(stu.getStuId(), Constant.FINISH);
		return "success";
	}

	public List<Grade> getGradeList() {
		return gradeList;
	}

	public void setGradeList(List<Grade> gradeList) {
		this.gradeList = gradeList;
	}

	public OrderService getOrderService() {
		return orderService;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	
}
