package com.changh.sccms.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import com.changh.sccms.entity.ExamPaper;
import com.changh.sccms.entity.ExamQuestion;
import com.changh.sccms.entity.ExamRule;

public interface ExamPaperService {
	//map封装ligerGrid的数据
	public Map<String,Object> findPageByExamId(int examId,int page,int pagesize,String sortname,String sortorder)throws Exception;
	public Map<String,Object> findPageByContent(String content,int page,int pagesize,String sortname,String sortorder)throws Exception;
	//添加试卷
	public void addPaper(ExamPaper paper,List<ExamRule> rules)throws Exception;
	//查看试卷所有的考题 带分页
	public Map<String,Object> findQuestionOfPaper(int paperId,int page,int pagesize,String sortname,String sortorder)throws Exception;
	public Map<String,Object> findQuestionByContent(String content,int page,int pagesize,String sortname,String sortorder)throws Exception;
	//findById
	public ExamPaper findById(int paperId)throws Exception;
	//findPaperByName
	public ExamPaper findPaperByName(String paperName)throws Exception;
	//删除试卷
	public boolean deletePaper(int paperId)throws Exception;
	//删除大题
	public boolean deleteRule(int ruleId)throws Exception;
	//更新试卷
	public void updatePaper(ExamPaper paper,List<ExamRule> rules)throws Exception;
	//findRulebyid
	public ExamRule findRuleById(int ruleId)throws Exception;
	//找考题的题号
	public List<String> findQuestionNo(int ruleId,List<String> list)throws Exception;
	//找上一个考题是不是正在连题中
	public String findLinkedQid()throws Exception; 
	//添加小题目
	public String addQuestion(ExamQuestion question,String link)throws Exception;
	//查找小题目
	//按id找
	public ExamQuestion findQuestionById(int questionId)throws Exception;
	//比对md5code检查重复题目,根据ruleId检测,添加和修改时进行不同的比对
	public boolean checkRepeat(String content,int ruleId,int model)throws Exception;
	//删除试题
	public boolean deleteQuestion(int questId)throws Exception;
	//更新试题
	public boolean updateQuestion(ExamQuestion question)throws Exception;
	//设置连题
	public boolean updateQuestionsForSetLink(String questionIds)throws Exception;
	//取消连题属性
	public boolean updateQuestionForCancelLink(String questionId)throws Exception;
	//批量添加
	public boolean saveBatchFromFile(File mf, int ruleId, int paperId,
			int questType,int startNo,int model)throws Exception;
	public boolean saveBatchFromEditor(String questContent, int ruleId,
			int paperId, int questType,int startNo,int model)throws Exception;
	//查找某大题下的所有小题
	public List<ExamQuestion> findQuestionOfRule(int ruleId)throws Exception;
	//查找某条件下的所有小题
	public List<ExamQuestion> findByCriteria(String criteria)throws Exception;
}
