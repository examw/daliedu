package com.changh.sccms.action.paper;

import com.changh.sccms.action.BaseAction;
import com.changh.sccms.entity.Administrator;
import com.changh.sccms.entity.ExamQuestion;
import com.changh.sccms.service.ExamPaperService;

public class AddQuestionAction extends BaseAction{
	private ExamQuestion question;
	private String link;
	private String actionFlag="add"; //动作标识
	public ExamQuestion getQuestion() {
		return question;
	}
	public void setQuestion(ExamQuestion question) {
		this.question = question;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public void setExamPaperService(ExamPaperService examPaperService) {
		this.examPaperService = examPaperService;
	}
	private ExamPaperService examPaperService;
	public String execute()throws Exception
	{
		Administrator admin = (Administrator)session.get("admin");
		question.setQuestEditor(admin.getAdmUsername());
		link = examPaperService.addQuestion(question,link);
		return "success";
	}
	public String getActionFlag() {
		return actionFlag;
	}
	public void setActionFlag(String actionFlag) {
		this.actionFlag = actionFlag;
	}
	
}
