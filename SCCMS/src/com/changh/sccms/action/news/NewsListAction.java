package com.changh.sccms.action.news;

import java.util.Map;

import com.changh.sccms.service.NewsService;

public class NewsListAction {
	private Map<String,Object> map;
	private int page;
	private int pagesize;
	private String sortname;
	private String sortorder;
	private NewsService newsService;
	public String execute()throws Exception
	{
		map = newsService.findPageByCriteria(page, pagesize, sortname, sortorder, "");//(page, pagesize, sortname, sortorder);
		return "success";
	}
	public Map<String, Object> getMap() {
		return map;
	}
	public void setMap(Map<String, Object> map) {
		this.map = map;
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
	public NewsService getNewsService() {
		return newsService;
	}
	public void setNewsService(NewsService newsService) {
		this.newsService = newsService;
	}
}
