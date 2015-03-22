package com.changh.eschool.dao;

import java.util.List;

import com.changh.eschool.entity.AskOrComplain;
import com.changh.eschool.entity.News;


public interface NewsDAO {
	public void save(News ac)throws Exception;
	public void update(News ac)throws Exception;
	public News findById(Integer newsId)throws Exception;
	public List<News> findPageByCriteria(int page,int pagesize,String sortname,String sortorder,String criteria)throws Exception;
	public long findTotal(String criteria)throws Exception;
}
