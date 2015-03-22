package com.changh.eschool.action.question;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.Question;
import com.changh.eschool.service.QuestionService;

public class LoadQuestion2Action extends BaseAction{
	private int questionId;
	private Question question;
	private QuestionService questionService;

	public int getQuestionId() {
		return questionId;
	}

	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}

	public Question getQuestion() {
		return question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}

	public void setQuestionService(QuestionService questionService) {
		this.questionService = questionService;
	}

	public String execute()throws Exception
	{
		question = questionService.findById(questionId);
		return "success";
	}
}
