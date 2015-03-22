package com.changh.sccms.action.paper;

import com.changh.sccms.service.ExamPaperService;

public class DeleteQuestionAction {
	private int questionId;
	private boolean ok;
	private ExamPaperService examPaperService;
	public String execute()throws Exception
	{
		ok = examPaperService.deleteQuestion(questionId);
		return "success";
	}
	public int getQuestionId() {
		return questionId;
	}
	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}
	public boolean isOk() {
		return ok;
	}
	public void setExamPaperService(ExamPaperService examPaperService) {
		this.examPaperService = examPaperService;
	}
	
}
