package com.changh.eschool.dao;

import java.util.List;

import com.changh.eschool.entity.ExamQuestion;
import com.changh.eschool.entity.ExamRule;

public interface ExamQuestionDAO {
	//findbyId
	public ExamQuestion findById(int questId)throws Exception;
	//修改
	public void update(ExamRule question)throws Exception;
	//分页查询某试卷下的所有小题
	public List<ExamQuestion> findPageByCriteria(String criteria,int page,int pagesize,String sortname,String sortorder)throws Exception;
	public long findTotalByCriteria(String criteria)throws Exception;
	//按一定条件查询不带分页
	public List<ExamQuestion> findByCriteria(String criteria)throws Exception;
	//删除
	public List<ExamQuestion> findAllByPaperId(int paperId)throws Exception;
	public List<ExamQuestion> findAllByRuleId(int ruleId)throws Exception;
	//找题号
	public List<String> findQuestionNo(int ruleId)throws Exception;
	//找出最近的LinkId的值
	public String findLinkedQid()throws Exception;
	
}
