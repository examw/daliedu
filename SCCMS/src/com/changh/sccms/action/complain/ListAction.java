package com.changh.sccms.action.complain;

import java.util.Map;

import com.changh.sccms.service.AskOrComplainService;

public class ListAction {
	private int page;
	private int pagesize;
	private String sortname;
	private String sortorder;
	private Map<String,Object> complainList;
	private AskOrComplainService askOrComplainService;
	private String criteria="";
	private int type = 0;
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
		this.sortname =" ac."+sortname;
	}

	public String getSortorder() {
		return sortorder;
	}

	public void setSortorder(String sortorder) {
		this.sortorder = sortorder;
	}

	public String getCriteria() {
		return criteria;
	}

	public void setCriteria(String criteria) {
		this.criteria = criteria;
	}
	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public Map<String, Object> getComplainList() {
		return complainList;
	}

	public void setAskOrComplainService(AskOrComplainService askOrComplainService) {
		this.askOrComplainService = askOrComplainService;
	}

	public String execute()throws Exception
	{
		if(type==1) //未解决的咨询
		{
			criteria = " where ac.acStatus = 0 and ac.acType = 0 ";
		}else if(type==2) //未解决的投诉
		{
			criteria = " where ac.acStatus = 0 and ac.acType = 1 ";
		}
		complainList = askOrComplainService.findPageByCriteria(page, pagesize, sortname, sortorder, criteria);
		return "success";
	}
}
