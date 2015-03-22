package com.changh.eschool.action.user;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.Student;
import com.changh.eschool.until.StringUtil;

public class StuNameAction extends BaseAction {
	private String username;
	private String name;
	public String execute(){
		Student stu = (Student) session.get("student");
		if(stu!=null){
			if(!StringUtil.isEmpty(stu.getStuMobile())){
				username = stu.getStuUsername()+stu.getStuMobile();
			}else if(!StringUtil.isEmpty(stu.getStuPhone())){
				username = stu.getStuUsername()+stu.getStuPhone();
			}
			
		}else{
			username="guest";
		}
		return "success";
	}
	
	public String getNameAction(){
		Student stu = (Student) session.get("student");
		if(stu!=null){
			name = stu.getStuUsername();
		}
		return "success";
	}
	public String getName() {
		return name;
	}

	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
