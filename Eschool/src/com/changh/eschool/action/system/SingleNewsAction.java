package com.changh.eschool.action.system;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.News;
import com.changh.eschool.service.NewsService;

public class SingleNewsAction extends BaseAction{
	private Integer id;
	private News news;
	private NewsService newsService;
	public String execute() throws Exception
	{
		news = newsService.findById(id);
		return "success";
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public News getNews() {
		return news;
	}
	public void setNews(News news) {
		this.news = news;
	}
	public void setNewsService(NewsService newsService) {
		this.newsService = newsService;
	}
	
}
