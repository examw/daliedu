package com.changh.eschool.dao;

import java.util.List;

import com.changh.eschool.entity.Question;

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
	//find total
	public long findTotal(String criteria)throws Exception;
	//find by questionid and stuId
	public Question findBy2Id(int questionId ,int stuId)throws Exception; 
	//delete
	public boolean delete(Question question)throws Exception;
	/**
	 * 查找当前课程下面的
	 * @param classId
	 * @return List<Question>
	 */
	public List<Question> findByClassId(int classId,int type);
}
