package com.changh.sccms.action.news;

import java.util.Date;

import com.changh.sccms.entity.News;
import com.changh.sccms.service.NewsService;

public class AddOrUpdateNewsAction {
	private News news;
	private NewsService newsService;
	private boolean ok = false;
	public String execute() throws Exception
	{
		if(news.getId()==null||news.getId()==0)
		{
			news.setAddtime(new Date());
			newsService.save(news);
		}else
		{
			news.setAddtime(new Date());
			newsService.update(news);
		}
		ok= true;
		return "success";
	}

	public boolean isOk() {
		return ok;
	}

	public void setOk(boolean ok) {
		this.ok = ok;
	}

	public News getNews() {
		return news;
	}

	public void setNews(News news) {
		this.news = news;
	}

	public NewsService getNewsService() {
		return newsService;
	}

	public void setNewsService(NewsService newsService) {
		this.newsService = newsService;
	}
}
