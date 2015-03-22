package com.changh.sccms.action.news;

import com.changh.sccms.service.NewsService;

public class DeleteNewsAction {
	private boolean ok = false;
	private Integer id;
	private NewsService newsService;
	public String execute()throws Exception
	{
		newsService.delete(id);
		ok = true;
		return "success";
	}
	public boolean isOk() {
		return ok;
	}
	public void setOk(boolean ok) {
		this.ok = ok;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public NewsService getNewsService() {
		return newsService;
	}
	public void setNewsService(NewsService newsService) {
		this.newsService = newsService;
	}
}
