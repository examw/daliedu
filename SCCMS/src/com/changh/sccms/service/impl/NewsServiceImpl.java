package com.changh.sccms.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.changh.sccms.dao.NewsDAO;
import com.changh.sccms.entity.News;
import com.changh.sccms.service.NewsService;
import com.changh.sccms.until.GridDataUtil;

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
	public Map<String,Object> findPageByCriteria(int page, int pagesize,
			String sortname, String sortorder, String criteria)
			throws Exception {
		// TODO Auto-generated method stub
		return GridDataUtil.gridMap(newsDao.findPageByCriteria(page, pagesize, sortname, sortorder, criteria), 
				(int) newsDao.findTotal(criteria));
	}

	@Override
	public long findTotal(String criteria) throws Exception {
		// TODO Auto-generated method stub
		return newsDao.findTotal(criteria);
	}
	@Override
	public void delete(Integer newsId) throws Exception {
		// TODO Auto-generated method stub
		newsDao.delete(newsId);
	}
}
