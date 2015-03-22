package com.changh.sccms.action.paper;

import com.changh.sccms.entity.ExamQuestion;
import com.changh.sccms.entity.ExamQuestionError;
import com.changh.sccms.service.ExamQuestionErrorService;

public class LoadErrorAction {
	private int id;
	private ExamQuestionError error;
	private ExamQuestion question;
	private String actionFlag;
	private ExamQuestionErrorService examQuestionErrorService;
	public String execute()throws Exception
	{
		error = examQuestionErrorService.findById(id);
		if(error!=null)
		{
			question = examQuestionErrorService.findQuestionById(error.getQuestId());
			if("detail".equals(actionFlag))
			{
				return "success1";
			}
			return "success";
		}else
		{
			return "notFind";
		}
		
		
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
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getActionFlag() {
		return actionFlag;
	}
	public void setActionFlag(String actionFlag) {
		this.actionFlag = actionFlag;
	}
	
}
