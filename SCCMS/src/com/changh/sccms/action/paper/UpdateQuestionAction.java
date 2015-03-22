package com.changh.sccms.action.paper;

import com.changh.sccms.action.BaseAction;
import com.changh.sccms.entity.Administrator;
import com.changh.sccms.entity.ExamQuestion;
import com.changh.sccms.service.ExamPaperService;

public class UpdateQuestionAction extends BaseAction{
	private ExamQuestion question;
	private int paperId;
	private String actionFlag="modify";
	private ExamPaperService examPaperService;
	
	public String execute()throws Exception
	{
		Administrator admin = (Administrator)session.get("admin");
		question.setQuestEditor(admin.getAdmUsername());
		if(examPaperService.updateQuestion(question))
		return "success";
		return "notFind";
	}

	public ExamQuestion getQuestion() {
		return question;
	}

	public void setQuestion(ExamQuestion question) {
		this.question = question;
	}

	public int getPaperId() {
		return paperId;
	}

	public void setPaperId(int paperId) {
		this.paperId = paperId;
	}

	public String getActionFlag() {
		return actionFlag;
	}

	public void setActionFlag(String actionFlag) {
		this.actionFlag = actionFlag;
	}

	public void setExamPaperService(ExamPaperService examPaperService) {
		this.examPaperService = examPaperService;
	}
	
}
