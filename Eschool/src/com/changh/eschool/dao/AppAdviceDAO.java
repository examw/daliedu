package com.changh.eschool.dao;

import java.util.List;

import com.changh.eschool.entity.AppAdvice;


public interface AppAdviceDAO {
	public void save(AppAdvice advice)throws Exception;
	public List<AppAdvice> findPageByCriteria(String criteria,int page,int pagesize,String sortname,String sortorder)throws Exception;
	public long getTotalByCriteria(String criteria)throws Exception;
}
