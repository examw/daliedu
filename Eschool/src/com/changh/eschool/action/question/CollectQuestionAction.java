package com.changh.eschool.action.question;

import java.util.Date;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.Question;
import com.changh.eschool.entity.QuestionCollect;
import com.changh.eschool.entity.Student;
import com.changh.eschool.service.QuestionCollectService;

public class CollectQuestionAction extends BaseAction{
	private QuestionCollect qc;
	private QuestionCollectService questionCollectService;
	private int questionId;
	private boolean ok;
	
	public boolean isOk() {
		return ok;
	}

	public int getQuestionId() {
		return questionId;
	}

	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}

	public void setQuestionCollectService(
			QuestionCollectService questionCollectService) {
		this.questionCollectService = questionCollectService;
	}

	public String execute()throws Exception
	{
		qc = new QuestionCollect();
		Question question = new Question();
		question.setQuestionId(questionId);
		qc.setQuestion(question);
		qc.setStudent((Student) session.get("student"));
		qc.setCollectAddTime(new Date());
		questionCollectService.save(qc);
		ok=true;
		return "success";
	}
}
