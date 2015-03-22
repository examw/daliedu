package com.changh.eschool.action.paper;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.ExamQuestionError;
import com.changh.eschool.entity.Student;
import com.changh.eschool.service.ExamQuestionErrorService;

public class SubmitErrorAction extends BaseAction{
	private ExamQuestionError error;
	private boolean ok;
	private ExamQuestionErrorService examQuestionErrorService;
	public ExamQuestionError getError() {
		return error;
	}
	public void setError(ExamQuestionError error) {
		this.error = error;
	}
	public boolean isOk() {
		return ok;
	}
	public void setExamQuestionErrorService(
			ExamQuestionErrorService examQuestionErrorService) {
		this.examQuestionErrorService = examQuestionErrorService;
	}
	public String execute()throws Exception
	{
		Student stu = (Student)session.get("student");
		error.setStuUserName(stu.getStuName());
		ok = examQuestionErrorService.save(error);
		return "success";
	}
}
