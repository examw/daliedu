package com.changh.sccms.dao;

import java.util.List;

import com.changh.sccms.entity.QuestionCollect;

public interface QuestionCollectDAO {
	public List<QuestionCollect> findByStuId(int stuId)throws Exception;
	//ÊÕ²Ø´æµ½¿â
	public void save(QuestionCollect qc)throws Exception;
	//É¾³ý
	public void delete(QuestionCollect qc)throws Exception;
}
