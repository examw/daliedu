package com.changh.eschool.action.question;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.Student;
import com.changh.eschool.service.QuestionCollectService;

public class CancelCollectAction extends BaseAction{
	private boolean ok;
	private int questionId;
	private QuestionCollectService questionCollectService;
	
	public int getQuestionId() {
		return questionId;
	}

	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}

	public boolean isOk() {
		return ok;
	}

	public void setQuestionCollectService(
			QuestionCollectService questionCollectService) {
		this.questionCollectService = questionCollectService;
	}

	public String execute()throws Exception
	{
		ok = questionCollectService.delete(((Student)session.get("student")).getStuId(), questionId);
		return "success";
	}
}
