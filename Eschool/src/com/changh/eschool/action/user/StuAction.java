package com.changh.eschool.action.user;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.Student;

public class StuAction extends BaseAction{
	private boolean data=false;
	public String execute(){
		Student stu = (Student) session.get("student");
		if(stu==null){
			data=false;
		}else{
			data=true;
		}
		return "success";
	}
	public boolean isData() {
		return data;
	}
	public void setData(boolean data) {
		this.data = data;
	}
	
}
