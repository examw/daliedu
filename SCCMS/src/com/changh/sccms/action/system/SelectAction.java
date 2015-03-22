package com.changh.sccms.action.system;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.changh.sccms.entity.Log;
import com.changh.sccms.service.AdministratorService;
import com.changh.sccms.service.StudentService;
import com.changh.sccms.until.GridDataUtil;

public class SelectAction {
	//output
	private Map<String,Object> logMap;
	//Input
	private String date;
	private Integer page;
	private Integer pagesize;
	private String sortname;
	private String sortorder;
	private AdministratorService administratorService;
	
	public String execute() throws Exception{
		List<Log> list = new ArrayList<Log>();
		list = administratorService.selectLog(date, page, pagesize, sortname, sortorder);
		logMap=GridDataUtil.gridMap(list,administratorService.getTotal(date));
		return "success";
	}	
	
	public Integer getPage() {
		return page;
	}

	public Map<String, Object> getLogMap() {
		return logMap;
	}

	public void setLogMap(Map<String, Object> logMap) {
		this.logMap = logMap;
	}


	public void setAdministratorService(AdministratorService administratorService) {
		this.administratorService = administratorService;
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

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

}
