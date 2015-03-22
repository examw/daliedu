package com.changh.sccms.action.paper;

import com.changh.sccms.entity.ExamQuestion;
import com.changh.sccms.entity.ExamQuestionError;
import com.changh.sccms.service.ExamQuestionErrorService;

public class CopeErrorAction {
	private ExamQuestionError error;
	private ExamQuestion question;
	private boolean ok;
	private ExamQuestionErrorService examQuestionErrorService;
	public String execute()throws Exception
	{
		ok = examQuestionErrorService.updateError(error, question);
		return "success";
	}
	public ExamQuestionError getError() {
		return error;
	}
	public void setError(ExamQuestionError error) {
		this.error = error;
	}
	public ExamQuestion getQuestion() {
		return question;
	}
	public void setQuestion(ExamQuestion question) {
		this.question = question;
	}
	public void setExamQuestionErrorService(
			ExamQuestionErrorService examQuestionErrorService) {
		this.examQuestionErrorService = examQuestionErrorService;
	}
	public boolean isOk() {
		return ok;
	}
	
}
