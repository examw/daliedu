package com.changh.sccms.action.exam;

import java.util.ArrayList;
import java.util.List;

import com.changh.sccms.entity.ExamCategory;
import com.changh.sccms.service.ExamCategoryService;



public class ListAction {
	private List<ExamCategory> examList;
	private List<ExamCategory> exam =new ArrayList<ExamCategory>();

	private ExamCategoryService examCategoryService;
	
	public void setExamCategoryService(ExamCategoryService examCategoryService) {
		this.examCategoryService = examCategoryService;
	}

	public String execute() throws Exception
	{
		ExamCategory e = new ExamCategory();
		examList=examCategoryService.examList();
		e.setChildren(examList);
		e.setExamId(0);
		e.setExamChildrenNum(examList.size());
		e.setExamName("考试类别");
		e.setText("考试类别");
		e.setExamPid(-1);
		e.setId(0);
		e.setExamOrderId(0);
		e.setIsexpand("true");
		exam.add(e);
		return "success";
	}

	

	public List<ExamCategory> getExam() {
		return exam;
	}

	public void setExam(List<ExamCategory> exam) {
		this.exam = exam;
	}

	public List<ExamCategory> getExamList() {
		return examList;
	}

	public void setExamList(List<ExamCategory> examList) {
		this.examList = examList;
	}

}
