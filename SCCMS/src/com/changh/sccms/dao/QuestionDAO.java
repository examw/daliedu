package com.changh.sccms.dao;

import java.util.List;

import com.changh.sccms.entity.Question;

public interface QuestionDAO {
	//分页查询所有
	public List<Question> findPage(int page,int pagesize,String sortname,String sortorder)throws Exception;
	//findbyid
	public Question findById(int questionId)throws Exception;
	//分页搜索
	/**
	 * 分页搜索 
	 * @param page			第几页
	 * @param pagesize		每页记录数
	 * @param sortname		排序名字
	 * @param sortorder		降序or升序
	 * @param content		搜索内容
	 * @return
	 * @throws Exception
	 */
	public List<Question> searchPage(int page,int pagesize,String sortname,String sortorder,String content)throws Exception;
	//问题存到库
	public void save(Question question)throws Exception;
	//find by stu_id 某学员提的问题集合
	public List<Question> findByStuId(int stuId)throws Exception;
}
