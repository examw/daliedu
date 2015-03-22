package com.changh.sccms.action.paper;

import com.changh.sccms.entity.ExamQuestion;
import com.changh.sccms.entity.ExamRule;
import com.changh.sccms.service.ExamPaperService;
import com.changh.sccms.until.Escape;

public class LoadQuestionAction {
	private int qid;
	private String paperName;
	private ExamQuestion question;
	private ExamRule rule;
	private ExamPaperService examPaperService;
	private String flag;
	public String execute()throws Exception{
		question = examPaperService.findQuestionById(qid);
		if(question!=null)
		{
			rule = examPaperService.findRuleById(question.getQuestRuleId());
			if("detail".equals(flag))
			{
				return "success1";
			}
			return "success";
			
		}else
			return "notFind";
	}
	public int getQid() {
		return qid;
	}
	public void setQid(int qid) {
		this.qid = qid;
	}
	public String getPaperName() {
		return paperName;
	}
	public void setPaperName(String paperName) {
		this.paperName = Escape.unescape(paperName);
	}
	public ExamQuestion getQuestion() {
		return question;
	}
	public void setExamPaperService(ExamPaperService examPaperService) {
		this.examPaperService = examPaperService;
	}
	public ExamRule getRule() {
		return rule;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	
}
