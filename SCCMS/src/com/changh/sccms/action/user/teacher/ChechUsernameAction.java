package com.changh.sccms.action.user.teacher;

import com.changh.sccms.service.TeacherService;

public class ChechUsernameAction {
	//input
	private String tchUsername;
	public void setTchUsername(String tchUsername) {
		this.tchUsername = tchUsername;
	}
	//output
	private boolean find=false;
	
	public boolean isFind() {
		return find;
	}
	//injection
	private TeacherService teacherService;
	
	public void setTeacherService(TeacherService teacherService) {
		this.teacherService = teacherService;
	}
	//业务逻辑
	public String execute() throws Exception
	{
		//找到了返回true
		if(teacherService.getTeacher(tchUsername)!=null) find=true;
		return "success";
	}
}
