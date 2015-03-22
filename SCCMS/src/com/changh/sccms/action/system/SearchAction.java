package com.changh.sccms.action.system;

import java.util.List;
import java.util.Map;

import com.changh.sccms.service.AdministratorService;
import com.changh.sccms.service.StudentService;
import com.changh.sccms.service.TeacherService;
import com.changh.sccms.until.Escape;
import com.changh.sccms.until.GridDataUtil;

public class SearchAction {
	//input
	private String str;
	private String searchName;
	private Integer page;
	private Integer pagesize;
	private String sortname;
	private String sortorder;
	
	//output
	private Map<String,Object> logList;
	private AdministratorService administratorService;
	
	public String execute() throws Exception{
		List list = administratorService.findLog(page, pagesize, sortname, sortorder, str, searchName);
		
		logList=(GridDataUtil.gridMap(list,administratorService.getSearchTotal(searchName, str)));
		return "success";
	}

	public Map<String, Object> getLogList() {
		return logList;
	}

	public void setLogList(Map<String, Object> logList) {
		this.logList = logList;
	}

	public AdministratorService getAdministratorService() {
		return administratorService;
	}

	public void setAdministratorService(AdministratorService administratorService) {
		this.administratorService = administratorService;
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
	
}
