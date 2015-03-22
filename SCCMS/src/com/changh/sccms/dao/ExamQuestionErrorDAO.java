package com.changh.sccms.dao;

import java.util.List;

import com.changh.sccms.entity.ExamQuestionError;

public interface ExamQuestionErrorDAO {
	//find all
	public List<ExamQuestionError> findPageByCriteria(String criteria,int page,int pagesize,String sortname,String sortorder)throws Exception;
	public long findTotalByCriteria(String criteria)throws Exception;
	//find by id
	public ExamQuestionError findById(int id)throws Exception;
	//update
	public void updateError(ExamQuestionError error)throws Exception;
}
