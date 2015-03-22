package com.changh.eschool.service;

import java.util.List;

import com.changh.eschool.entity.AppAdvice;

public interface AppAdviceService {
	public void save(AppAdvice advice)throws Exception;
	public List<AppAdvice> findPageByCriteria(String criteria,int page,int pagesize,String sortname,String sortorder)throws Exception;
	public long getTotalByCriteria(String criteria)throws Exception;

}
