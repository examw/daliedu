package com.changh.eschool.service.impl;

import java.util.List;

import com.changh.eschool.dao.AppAdviceDAO;
import com.changh.eschool.entity.AppAdvice;
import com.changh.eschool.service.AppAdviceService;

public class AppAdviceServiceImpl implements AppAdviceService	{
	private AppAdviceDAO appAdviceDao;
	@Override
	public List<AppAdvice> findPageByCriteria(String criteria, int page,
			int pagesize, String sortname, String sortorder) throws Exception {
		// TODO Auto-generated method stub
		return appAdviceDao.findPageByCriteria(criteria, page, pagesize, sortname, sortorder);
	}
	@Override
	public long getTotalByCriteria(String criteria) throws Exception {
		// TODO Auto-generated method stub
		return appAdviceDao.getTotalByCriteria(criteria);
	}
	@Override
	public void save(AppAdvice advice) throws Exception {
		// TODO Auto-generated method stub
		this.appAdviceDao.save(advice);
	}
	public void setAppAdviceDao(AppAdviceDAO appAdviceDao) {
		this.appAdviceDao = appAdviceDao;
	}
	
}
