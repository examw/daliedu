package com.changh.eschool.service.impl;

import java.util.Date;
import java.util.List;

import com.changh.eschool.dao.NewsDAO;
import com.changh.eschool.entity.News;
import com.changh.eschool.service.NewsService;

public class NewsServiceImpl implements NewsService {
	private NewsDAO newsDao;
	public NewsDAO getNewsDao() {
		return newsDao;
	}

	public void setNewsDao(NewsDAO newsDao) {
		this.newsDao = newsDao;
	}

	@Override
	public void save(News ac) throws Exception {
		// TODO Auto-generated method stub
		ac.setAddtime(new Date());
		newsDao.save(ac);
	}

	@Override
	public void update(News ac) throws Exception {
		// TODO Auto-generated method stub
		newsDao.update(ac);
	}

	@Override
	public News findById(Integer newsId) throws Exception {
		// TODO Auto-generated method stub
		return newsDao.findById(newsId);
	}

	@Override
	public List<News> findPageByCriteria(int page, int pagesize,
			String sortname, String sortorder, String criteria)
			throws Exception {
		// TODO Auto-generated method stub
		return newsDao.findPageByCriteria(page, pagesize, sortname, sortorder, criteria);
	}

	@Override
	public long findTotal(String criteria) throws Exception {
		// TODO Auto-generated method stub
		return newsDao.findTotal(criteria);
	}

}
