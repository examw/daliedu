package com.changh.eschool.action.question;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.Question;
import com.changh.eschool.entity.Student;
import com.changh.eschool.service.QuestionCollectService;
import com.changh.eschool.service.QuestionService;

public class LoadQuestionAction extends BaseAction{
	private int questionId;
	private Question question;
	private QuestionService questionService;
	private QuestionCollectService questionCollectService;
	private int favFlag=0;
	
	public int getFavFlag() {
		return favFlag;
	}

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
	
	public void setQuestionCollectService(
			QuestionCollectService questionCollectService) {
		this.questionCollectService = questionCollectService;
	}

	public String execute()throws Exception
	{
		Student stu = (Student) session.get("student");
		question = questionService.findById(questionId);
		boolean flag = questionCollectService.isCollected(stu.getStuId(), questionId);
		if(!flag) favFlag = 1;
		return "success";
	}
}
