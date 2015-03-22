package com.changh.sccms.dao;

import java.util.List;

import com.changh.sccms.entity.ExamQuestion;
import com.changh.sccms.entity.ExamRule;

public interface ExamQuestionDAO {
	//保存
	//返回实际的问题id
	public int save(ExamQuestion question)throws Exception;
	//不返回id,只是添加
	public void save1(ExamQuestion question)throws Exception;
	//保存一个列表，批量添加时
	public void save(List<ExamQuestion> list,int num) throws Exception;
	//findbyId
	public ExamQuestion findById(int questId)throws Exception;
	//findByMD5code
	public List<ExamQuestion> findByMD5Code(String md5code,int ruleId)throws Exception;
	//修改
	public void update(ExamRule question)throws Exception;
	//分页查询某试卷下的所有小题
	public List<ExamQuestion> findPageByCriteria(String criteria,int page,int pagesize,String sortname,String sortorder)throws Exception;
	public long findTotalByCriteria(String criteria)throws Exception;
	//按一定条件查询不带分页
	public List<ExamQuestion> findByCriteria(String criteria)throws Exception;
	//删除
	public void delete(ExamQuestion question)throws Exception;
	public List<ExamQuestion> findAllByPaperId(int paperId)throws Exception;
	public List<ExamQuestion> findAllByRuleId(int ruleId)throws Exception;
	public void deleteAll(List<ExamQuestion> questionList)throws Exception;
	public void deleteAll(String questIds)throws Exception;
	//找题号
	public List<String> findQuestionNo(int ruleId)throws Exception;
	//找出最近的LinkId的值
	public String findLinkedQid()throws Exception;
	
}
