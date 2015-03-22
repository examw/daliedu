package com.changh.eschool.service;

import java.util.List;

import com.changh.eschool.entity.Answer;
import com.changh.eschool.entity.Question;

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
	//find by stuid 带分页
	public List<Question> findByStuId(int page,int pagesize,String sortname,String sortorder,int stuId)throws Exception;
	//find total
	public int findTotal(String criteria) throws Exception;
	//删除
	public boolean deleteQuestion(int questionId,int stuId)throws Exception;
	//添加
	public void save(Question question)throws Exception;
	//
	public List<Question> findByCriteria(int page,int pagesize,String sortname,String sortorder,String criteria)throws Exception;
	//addAnswer
	public boolean addAnswer(Answer answer)throws Exception;
	/**
	 * 查找当前课节下面的问题
	 * @param classId
	 * @param type
	 * @return  List<Question>
	 */
	public List<Question> findByClassId( int classId,int type);
}
