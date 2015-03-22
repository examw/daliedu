package com.changh.sccms.action.user.teacher;

import java.util.List;
import java.util.Map;

import com.changh.sccms.service.TeacherService;
import com.changh.sccms.until.Escape;
import com.changh.sccms.until.GridDataUtil;

public class SearchAction {
	//input
	private String str;
	private String searchName;
	

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
	//output
	private Map<String,Object> teacherList;
	
	public Map<String, Object> getTeacherList() {
		return teacherList;
	}
	//inject
	private TeacherService teacherService;
	
	public String execute() throws Exception{
		List list = teacherService.searchTeacher(str, searchName);
		teacherList = GridDataUtil.gridMap(list,list.size());
		return "success";
	}
	public void setTeacherService(TeacherService teacherService) {
		this.teacherService = teacherService;
	}
}
