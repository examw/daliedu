package com.changh.eschool.action.paper;

import java.util.List;

import com.changh.eschool.entity.ExamQuestion;
import com.changh.eschool.service.ExamPaperService;

public class QuestionListOfRuleAction {
	private int ruleId;
	private int textareaNum; //前面问答题的个数
	private int qNum; 		 //前面大题的总题数
	private List<ExamQuestion> list;
	private ExamPaperService examPaperService;
	public String execute()throws Exception
	{
		list  = examPaperService.findQuestionOfRule(ruleId);
		return "success";
	}
	public int getRuleId() {
		return ruleId;
	}
	public void setRuleId(int ruleId) {
		this.ruleId = ruleId;
	}
	public List<ExamQuestion> getList() {
		return list;
	}
	public void setExamPaperService(ExamPaperService examPaperService) {
		this.examPaperService = examPaperService;
	}
	public int getTextareaNum() {
		return textareaNum;
	}
	public void setTextareaNum(int textareaNum) {
		this.textareaNum = textareaNum;
	}
	public int getQNum() {
		return qNum;
	}
	public void setQNum(int qNum) {
		this.qNum = qNum;
	}
	
}
