package com.changh.sccms.action.user.teacher;

import com.changh.sccms.service.TeacherService;

public class DeleteAction {
	//input 
	private int id;
	private boolean ok=false;
	
	public boolean isOk() {
		return ok;
	}
	public void setId(int id) {
		this.id = id;
	}
	//injection
	private TeacherService teacherService;
	public void setTeacherService(TeacherService teacherService) {
			this.teacherService = teacherService;
	}
	public String execute()throws Exception
	{
		try{
			teacherService.deleteTeacher(id);
			ok=true;
			
		}catch(Exception e)
		{
			throw e;
		}
		return "success";
	}
}
