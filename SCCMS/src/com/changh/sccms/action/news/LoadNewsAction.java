package com.changh.sccms.action.news;

import com.changh.sccms.entity.News;
import com.changh.sccms.service.NewsService;

public class LoadNewsAction {
	private Integer id;
	private NewsService newsService;
	private News news;
	public String execute()throws Exception
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
	public NewsService getNewsService() {
		return newsService;
	}
	public void setNewsService(NewsService newsService) {
		this.newsService = newsService;
	}
	public News getNews() {
		return news;
	}
	public void setNews(News news) {
		this.news = news;
	}
}
