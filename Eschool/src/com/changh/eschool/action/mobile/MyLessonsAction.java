package com.changh.eschool.action.mobile;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.MyLesson;
import com.changh.eschool.service.OrderService;
import com.changh.eschool.until.Constant;

public class MyLessonsAction  extends BaseAction{
	private int stuId;
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
		myLesson = orderService.findMyLesson(stuId,Constant.FINISH);
		if(myLesson.getClassPackages().size()==0&&myLesson.getGrade().size()==0)
		{
			myLesson = null;
		}
		return "success";
	}
	public int getStuId() {
		return stuId;
	}
	public void setStuId(int stuId) {
		this.stuId = stuId;
	}
	
}