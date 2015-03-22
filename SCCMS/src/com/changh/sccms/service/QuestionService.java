package com.changh.sccms.service;

import java.util.List;

import com.changh.sccms.entity.Question;

public interface QuestionService {
	//find by id
	public Question findById(int questionId)throws Exception;
	//所有问题，带分页
	public List<Question> findAll(int page,int pagesize,String sortname,String sortorder)throws Exception;
	//指定类型的问题，带分页
	public List<Question> findByType(int page,int pagesize,String sortname,String sortorder,int type)throws Exception;
	//搜索内容相关（标题和内容相关）的问题，带分页
	public List<Question> findByContent(int page,int pagesize,String sortname,String sortorder,String content)throws Exception;
	//指定状态（已答or未答）的问题，带分页
	public List<Question> findByStatus(int page,int pagesize,String sortname,String sortorder,int status)throws Exception;
}
