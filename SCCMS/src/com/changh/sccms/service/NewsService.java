package com.changh.sccms.service;


import java.util.Map;

import com.changh.sccms.entity.News;

public interface NewsService {
	public void save(News ac)throws Exception;
	public void update(News ac)throws Exception;
	public News findById(Integer newsId)throws Exception;
	public Map<String,Object> findPageByCriteria(int page,int pagesize,String sortname,String sortorder,String criteria)throws Exception;
	public long findTotal(String criteria) throws Exception ;
	public void delete(Integer newsId) throws Exception;
}
