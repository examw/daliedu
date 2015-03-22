package com.changh.eschool.dao;

import java.util.List;

import com.changh.eschool.entity.QuestionCollect;

public interface QuestionCollectDAO {
	public List<QuestionCollect> findByStuId(int page,int pagesize,String sortname,String sortorder,int stuId)throws Exception;
	//收藏存到库
	public void save(QuestionCollect qc)throws Exception;
	//删除
	public void delete(QuestionCollect qc)throws Exception;
	//是否已收藏
	public QuestionCollect isCollected(int stuId,int questionId)throws Exception;
	//find total
	public long findTotalByStuId(int stuId)throws Exception;
}
