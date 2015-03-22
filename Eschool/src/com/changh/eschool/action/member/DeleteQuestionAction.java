package com.changh.eschool.action.member;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.Student;
import com.changh.eschool.service.QuestionService;

public class DeleteQuestionAction extends BaseAction{
	private int questionId;
	private boolean ok;
	private QuestionService questionService;
	
	public int getQuestionId() {
		return questionId;
	}

	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}

	public boolean isOk() {
		return ok;
	}

	public void setQuestionService(QuestionService questionService) {
		this.questionService = questionService;
	}

	public String execute()throws Exception
	{
		Student stu =(Student)session.get("student");
		ok = questionService.deleteQuestion(questionId, stu.getStuId());
		return "success";
	}
}
