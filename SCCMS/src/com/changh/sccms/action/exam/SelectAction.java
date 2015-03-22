package com.changh.sccms.action.exam;

import java.util.List;
import java.util.Map;

import com.changh.sccms.entity.Student;
import com.changh.sccms.service.StudentService;
import com.changh.sccms.until.GridDataUtil;

public class SelectAction {
	//output
	private Map<String,Object> stuMap;
	//Input
	private String date;
		
	
	//injection
	private StudentService studentService;
	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}

	public StudentService getStudentService() {
		return studentService;
	}

	public String execute() throws Exception{
		List<Student> list = null; //studentService.studentSelect(date);
		stuMap=GridDataUtil.gridMap(list,list.size());
		return "success";
	}

	public Map<String,Object> getStuMap() {
		return stuMap;
	}

	public void setStuMap(Map<String,Object> stuMap) {
		this.stuMap = stuMap;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

}
