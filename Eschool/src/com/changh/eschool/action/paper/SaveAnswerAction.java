package com.changh.eschool.action.paper;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.Student;
import com.changh.eschool.service.ExamPaperService;

public class SaveAnswerAction extends BaseAction{
	private String optionAnswer;
	private String contentAnswer;
	private int paperId;
	private boolean ok;
	private ExamPaperService examPaperService;
	public String execute()throws Exception
	{
		Student stu = (Student)session.get("student");
		examPaperService.saveAnswer(paperId,stu.getStuId(),optionAnswer,contentAnswer);
		ok=true;
		return "success";
	}
	public String getOptionAnswer() {
		return optionAnswer;
	}
	public void setOptionAnswer(String optionAnswer) {
		this.optionAnswer = optionAnswer;
	}
	public String getContentAnswer() {
		return contentAnswer;
	}
	public void setContentAnswer(String contentAnswer) {
		this.contentAnswer = contentAnswer;
	}
	public int getPaperId() {
		return paperId;
	}
	public void setPaperId(int paperId) {
		this.paperId = paperId;
	}
	public boolean isOk() {
		return ok;
	}
	public void setOk(boolean ok) {
		this.ok = ok;
	}
	public void setExamPaperService(ExamPaperService examPaperService) {
		this.examPaperService = examPaperService;
	}
	
}
