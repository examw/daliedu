package com.changh.sccms.action.user.teacher;

import com.changh.sccms.entity.Teacher;
import com.changh.sccms.service.TeacherService;

public class UpdateImgUrlAction {
	private Teacher teacher;
	private TeacherService teacherService;
	private boolean ok=false;
	
	public boolean isOk() {
		return ok;
	}
	
	public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}

	public void setTeacherService(TeacherService teacherService) {
		this.teacherService = teacherService;
	}

	public String execute()throws Exception
	{
		ok = teacherService.updateTeacherImgUrl(teacher);
		return "success";
	}
}
