package com.changh.sccms.action.user.teacher;

import com.changh.sccms.entity.Teacher;
import com.changh.sccms.service.TeacherService;

public class AddAction {
//	input
	private Teacher teacher;

	public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	//output
	private boolean ok=false;
	
	public boolean isOk() {
		return ok;
	}
		//injection
		private TeacherService teacherService;
		public void setTeacherService(TeacherService teacherService) {
			this.teacherService = teacherService;
		}
	public String execute()throws Exception
	{
		try{
			teacherService.addTeacher(teacher);
			ok=true;
		}catch(Exception e)
		{
			throw e;
		}
		return "success";
	}
}
