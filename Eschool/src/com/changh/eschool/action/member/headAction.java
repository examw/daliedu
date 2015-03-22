package com.changh.eschool.action.member;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.Student;

//判断session中是否有student,获得学生对象
public class headAction extends BaseAction{
	private Student stu;

	public  String execute(){
		stu=(Student)session.get("student");
		return "success";
	}
	public Student getStu() {
		return stu;
	}
	public void setStu(Student stu) {
		this.stu = stu;
	}
}
