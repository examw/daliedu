package com.changh.sccms.service;

import java.util.Map;

import com.changh.sccms.entity.ExamQuestion;
import com.changh.sccms.entity.ExamQuestionError;

public interface ExamQuestionErrorService {
	//find all
	public Map<String,Object> findPageByCriteria(String criteria,int page,int pagesize,String sortname,String sortorder)throws Exception;
	//find by id
	public ExamQuestionError findById(int id)throws Exception;
	//update
	public boolean updateError(ExamQuestionError error,ExamQuestion question)throws Exception;
	public ExamQuestion findQuestionById(int questId)throws Exception;
}
