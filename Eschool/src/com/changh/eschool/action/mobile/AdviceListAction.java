package com.changh.eschool.action.mobile;

import java.util.List;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.AppAdvice;
import com.changh.eschool.service.AppAdviceService;

public class AdviceListAction  extends BaseAction{
	private int page=1;
	private int pagesize=10;
	private String sortorder = " desc ";
	private String sortname = " adviceAddTime "; 
	private int total;
	private List<AppAdvice> list;
	private int appType = 1;
	private AppAdviceService appAdviceService;
	public String execute()throws Exception
	{
		String criteria = " where appType = "+appType+" ";
		list = appAdviceService.findPageByCriteria(criteria, page, pagesize, sortname, sortorder);
		total  = (int) appAdviceService.getTotalByCriteria(criteria);
		return "success";
	}
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
	public String getSortorder() {
		return sortorder;
	}
	public void setSortorder(String sortorder) {
		this.sortorder = sortorder;
	}
	public String getSortname() {
		return sortname;
	}
	public void setSortname(String sortname) {
		this.sortname = sortname;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public List<AppAdvice> getList() {
		return list;
	}
	public void setList(List<AppAdvice> list) {
		this.list = list;
	}
	public int getAppType() {
		return appType;
	}
	public void setAppType(int appType) {
		this.appType = appType;
	}
	public void setAppAdviceService(AppAdviceService appAdviceService) {
		this.appAdviceService = appAdviceService;
	}
}
