package com.changh.sccms.action.user.student;

import java.util.ArrayList;
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
	private Integer page;
	private Integer pagesize;
	private String sortname;
	private String sortorder;
	public String execute() throws Exception{
		List<Student> list = new ArrayList<Student>();
		if(date.equals("all")){
			 list = studentService.studentList(page,pagesize,sortname,sortorder);
		}else{
			 list = studentService.studentSelect(date,page,pagesize,sortname,sortorder);
		}
		stuMap=GridDataUtil.gridMap(list,studentService.getTotal(date));
		return "success";
	}	
	
	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getPagesize() {
		return pagesize;
	}

	public void setPagesize(Integer pagesize) {
		this.pagesize = pagesize;
	}

	public String getSortname() {
		return sortname;
	}

	public void setSortname(String sortname) {
		this.sortname = sortname;
	}

	public String getSortorder() {
		return sortorder;
	}

	public void setSortorder(String sortorder) {
		this.sortorder = sortorder;
	}

	//injection
	private StudentService studentService;
	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}

	public StudentService getStudentService() {
		return studentService;
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
