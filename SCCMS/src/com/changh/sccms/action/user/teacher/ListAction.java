package com.changh.sccms.action.user.teacher;

import java.util.List;
import java.util.Map;

import com.changh.sccms.entity.Teacher;
import com.changh.sccms.service.TeacherService;
import com.changh.sccms.until.GridDataUtil;



public class ListAction {
	private int page;
	private int pagesize;
	private String sortname;
	private String sortorder;
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPagesize() {
		return pagesize;
	}
	public void setPagesize(int pagesize) {
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
	//output
	private Map<String,Object> teacherList;
	
	public Map<String, Object> getTeacherList() {
		return teacherList;
	}
	//inject
	private TeacherService teacherService;
	

	public String execute() throws Exception{
		List<Teacher> list = teacherService.teacherList(page, pagesize, sortname, sortorder);
		int total = (int) teacherService.getTotal("");
		teacherList = GridDataUtil.gridMap(list,total);
		return "success";
	}
	public void setTeacherService(TeacherService teacherService) {
		this.teacherService = teacherService;
	}
}
