package com.changh.sccms.action.user.student;

import java.util.List;
import java.util.Map;

import com.changh.sccms.entity.Student;
import com.changh.sccms.service.StudentService;
import com.changh.sccms.until.GridDataUtil;



public class ListAction {
	//output
	private Map<String,Object> gridMap;
	private Integer page;
	private Integer pagesize;
	private String sortname;
	private String sortorder;
	private String date;
	
	

	public String execute() throws Exception{
		List<Student> list = studentService.studentList(page,pagesize,sortname,sortorder);
		gridMap=GridDataUtil.gridMap(list,studentService.getTotal(date));
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

	public void setGridMap(Map<String, Object> gridMap) {
		this.gridMap = gridMap;
	}

	public Map<String, Object> getGridMap() {
		return gridMap;
	}
	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	//injection
	private StudentService studentService;
	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}

	public StudentService getStudentService() {
		return studentService;
	}
}
