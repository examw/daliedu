package com.changh.eschool.dao;

import java.util.List;

import com.changh.eschool.entity.AskOrComplain;

public interface AskOrComplainDAO {
	public void save(AskOrComplain ac)throws Exception;
	public void update(AskOrComplain ac)throws Exception;
	public AskOrComplain findById(int acId)throws Exception;
	public List<AskOrComplain> findPageByCriteria(int page,int pagesize,String sortname,String sortorder,String criteria)throws Exception;
	public long findTotal(String criteria)throws Exception;
}
