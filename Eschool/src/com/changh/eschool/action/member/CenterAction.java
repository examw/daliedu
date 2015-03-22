package com.changh.eschool.action.member;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.Student;

public class CenterAction extends BaseAction{
	public String execute(){
		Student stu = (Student) session.get("student");
		if(stu!=null){
			return "success";
		}
		return "error";
	}
}
