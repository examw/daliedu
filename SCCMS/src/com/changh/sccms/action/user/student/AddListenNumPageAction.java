package com.changh.sccms.action.user.student;

import java.util.List;

import com.changh.sccms.entity.StudyRecord;
import com.changh.sccms.service.StudentService;

public class AddListenNumPageAction {
	private Integer stuId;
	private StudentService studentService;
	private List<StudyRecord> list;
	
	public Integer getStuId() {
		return stuId;
	}
	public void setStuId(Integer stuId) {
		this.stuId = stuId;
	}
	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}
	
	public String execute() throws Exception{
		list = this.studentService.findLimitStudyRecord(stuId);
		return "success";
	}
	public List<StudyRecord> getList() {
		return list;
	}
	public void setList(List<StudyRecord> list) {
		this.list = list;
	}
}
