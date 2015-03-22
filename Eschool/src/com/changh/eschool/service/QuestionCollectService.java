package com.changh.eschool.service;

import java.util.List;

import com.changh.eschool.entity.QuestionCollect;

public interface QuestionCollectService {
	public List<QuestionCollect> findByStuId(int page,int pagesize,String sortname,String sortorder,int stuId)throws Exception;
	public boolean isCollected(int stuId,int questionId)throws Exception;
	public long findTotalByStuId(int stuId)throws Exception;
	public void save(QuestionCollect qc)throws Exception;
	public boolean delete(int stuId,int questionId)throws Exception;
}
