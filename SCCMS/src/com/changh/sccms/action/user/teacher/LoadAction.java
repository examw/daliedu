package com.changh.sccms.action.user.teacher;

import java.util.List;

import com.changh.sccms.entity.Teacher;
import com.changh.sccms.service.TeacherService;
import com.changh.sccms.until.GridDataUtil;

public class LoadAction {
	//input
	private int id;
	//output
	private Teacher teacher;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	//injection
	private TeacherService teacherService;
	public void setTeacherService(TeacherService teacherService) {
		this.teacherService = teacherService;
	}
	public String execute() throws Exception{
		teacher = teacherService.getTeacher(id);
		return "success";
	}
}
