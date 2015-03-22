package com.changh.eschool.action.question;

import java.util.Date;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.Answer;
import com.changh.eschool.entity.Teacher;
import com.changh.eschool.service.QuestionService;

public class AnswerQuestionAction extends BaseAction{
	private Answer answer;
	private QuestionService questionService;
	private boolean ok;
	public Answer getAnswer() {
		return answer;
	}

	public void setAnswer(Answer answer) {
		this.answer = answer;
	}

	public boolean isOk() {
		return ok;
	}

	public void setQuestionService(QuestionService questionService) {
		this.questionService = questionService;
	}

	public String execute()throws Exception
	{
		Teacher tch = (Teacher)session.get("teacher");
		answer.setTchId(tch.getId());
		answer.setAnswerTime(new Date());
		ok = questionService.addAnswer(answer);
		return "success";
	}
	
}
