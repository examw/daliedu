package com.changh.sccms.action.user.student;

import java.util.List;
import java.util.Map;

import com.changh.sccms.service.StudentService;
import com.changh.sccms.service.TeacherService;
import com.changh.sccms.until.Escape;
import com.changh.sccms.until.GridDataUtil;

public class SearchAction {
	//input
	private String str;
	private String searchName;
	private Integer page=1;
	private Integer pagesize=10;
	private String sortname="stuAddTime";
	private String sortorder="desc";
	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}
	//output
	private Map<String,Object> stuList;
	private StudentService studentService;
	
	public String execute() throws Exception{
		List list = studentService.search(page, pagesize, sortname, sortorder, str, searchName);
		setStuList(GridDataUtil.gridMap(list,studentService.getSearchTotal(searchName, str)));
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
	public String getStr() {
		return str;
	}
	public void setStr(String str) {
		//转码
		str = Escape.unescape(str);
		//防注入（后台可能没什么必要）
		this.str = str.replace("%", "\\%");
	}
	public String getSearchName() {
		return searchName;
	}
	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}
	
	public Map<String,Object> getStuList() {
		return stuList;
	}
	public void setStuList(Map<String,Object> stuList) {
		this.stuList = stuList;
	}
}
